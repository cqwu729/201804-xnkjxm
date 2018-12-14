package com.liaoin.service.app.service.impl;

import com.liaoin.common.jjwt.JWTTokenUtils;
import com.liaoin.common.md5.MD5Encoder;
import com.liaoin.service.app.Enum.OrderStatus;
import com.liaoin.service.app.Enum.RevenueStatus;
import com.liaoin.service.app.Enum.RevenueType;
import com.liaoin.service.app.Enum.UserStatus;
import com.liaoin.service.app.bean.*;
import com.liaoin.service.app.dao.*;
import com.liaoin.service.app.service.UserService;
import com.liaoin.service.base.Enum.Result;
import com.liaoin.service.base.message.OperateResult;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import static com.liaoin.service.base.message.OperateResult.fail;
import static com.liaoin.service.base.message.OperateResult.success;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private MessageRepository messageRepository;

    @Autowired
    private WithdrawRepository withdrawRepository;

    @Autowired
    private ExtensionRecordRepository extensionRecordRepository;

    @Autowired
    private BankCardRepository bankCardRepository;

    @Autowired
    private MinerRepository minerRepository;

    @Autowired
    private CalculationForceRepository calculationForceRepository;

    @Autowired
    private RevenueRecordRepository revenueRecordRepository;

    @Autowired
    private AuthenticationRepository authenticationRepository;

    @Autowired
    private IncomeDetailRepository incomeDetailRepository;

    @Override
    public OperateResult save(User user) {
        userRepository.save(user);
        return success();
    }

    @Override
    public OperateResult login(String phone, String password) {
        User user = userRepository.findByPhone(phone);
        if(user == null){
            return fail(Result.NO_USER);
        };
        String confirmPassword = MD5Encoder.encryption(user.getRandom() + MD5Encoder.encryption(password));
        if(confirmPassword.equals(user.getPassword())){
            if(user.getRoleStatus() == UserStatus.ENABLE){
                int random = (int)(Math.random()*9000 + 1000);
                user.setRandom(random);
                confirmPassword = MD5Encoder.encryption(random + MD5Encoder.encryption(password));
                user.setPassword(confirmPassword);
                user.setToken(JWTTokenUtils.createToken(user.getId()));
                userRepository.save(user);
                return success(user);
            }else{
                return fail(Result.YHJY);
            }
        }else{
            return fail(Result.ERROR_PASSWORD);
        }
    }

    @Override
    public OperateResult findById(String userId) {
        if(userRepository.existsById(userId)){
            return success(userRepository.findById(userId));
        }
        return fail(Result.NO_USER);
    }

    @Override
    public User findId(String userId) {
        return userRepository.findById(userId).get();
    }

    @Override
    public OperateResult register(String phone, int verify, String password, String confirmPassword, Integer recommendCode) {
        User user = userRepository.findByPhone(phone);
        if(user != null){
            return fail(Result.USER_REGISTERED);
        }
        if(recommendCode == null){
            return fail(Result.CODE_NOT_NULL);
        }
        Message message = messageRepository.findByPhoneAndVerifyOrderByAddTimeDesc(phone,verify);
        if(message == null){
            return fail(Result.MESSAGE_IS_NOT_TRUE);
        }else if(message.getVerify() != verify){
            return fail(Result.MESSAGE_IS_NOT_TRUE);
        }else if((message.getAddTime().getTime() + 30 * 1000 * 60) < System.currentTimeMillis()){
            return fail(Result.MESSAGE_IS_BE_OVERDUE);
        }else{
            if(!password.equals(confirmPassword)){
                return fail(Result.TWICE_PASSWORD_NOT_EQUAL);
            }
            User recommendUser = userRepository.findByRecommendCode(recommendCode);
            if(recommendCode != null && recommendUser == null){
                return fail(Result.RECOMMENT_CODE_HAVA_NOT);
            }
            user = new User();
            int random = (int)(Math.random()*9000 + 1000);
            user.setRandom(random);
            confirmPassword = MD5Encoder.encryption(random + MD5Encoder.encryption(password));
            user.setPassword(confirmPassword);
            user.setRegisterTime(new Date());
            user.setPhone(phone);
            user.setRoleStatus(UserStatus.ENABLE);
            int myRecommendCode = (int)(Math.random()*900000 + 100000);
            user.setRecommendCode(myRecommendCode);
            if(recommendCode != null){
                user.setCode(recommendCode);
            }else{
                user.setCode(0);
            }
            userRepository.save(user);
            //添加推广记录
            if(recommendCode != null && recommendUser != null){
                ExtensionRecord extensionRecord = ExtensionRecord.builder()
                        .user(recommendUser)
                        .recommendUser(user)
                        .addTime(new Date())
                        .build();
                extensionRecordRepository.save(extensionRecord);
            }

            //添加注册收益
            RevenueRecord revenueRecord = RevenueRecord.builder()
                    .user(user)
                    .money(50)
                    .date(new Date())
                    .revenueStatus(RevenueStatus.NO)
                    .revenueType(RevenueType.REGISTER)
                    .build();
            revenueRecordRepository.save(revenueRecord);
            return success();
        }
    }

    @Override
    public OperateResult forgetPassword(String phone, int verify, String password, String confirmPassword) {
        User user = userRepository.findByPhone(phone);
        if(user == null){
            return fail(Result.NO_USER);
        }
        Message message = messageRepository.findByPhoneAndVerifyOrderByAddTimeDesc(phone,verify);
        if(message == null){
            return fail(Result.MESSAGE_IS_NOT_TRUE);
        }else if(message.getVerify() != verify){
            return fail(Result.MESSAGE_IS_NOT_TRUE);
        }else if((message.getAddTime().getTime() + 30 * 1000 * 60) < System.currentTimeMillis()){
            return fail(Result.MESSAGE_IS_BE_OVERDUE);
        }else{
            if(!password.equals(confirmPassword)){
                return fail(Result.TWICE_PASSWORD_NOT_EQUAL);
            }
            int random = (int)(Math.random()*9000 + 1000);
            user.setRandom(random);
            confirmPassword = MD5Encoder.encryption(random + MD5Encoder.encryption(password));
            user.setPassword(confirmPassword);
            userRepository.save(user);
            return success();
        }
    }

    @Override
    public OperateResult withdraw(String userId, float money, String bankCardId,Integer verify) {
        if(userRepository.existsById(userId)){
            User user = userRepository.findById(userId).get();
            Message message = messageRepository.findByPhoneAndVerifyOrderByAddTimeDesc(user.getPhone(),verify);
            if(message == null){
                return fail(Result.MESSAGE_IS_NOT_TRUE);
            }else if(message.getVerify() != verify){
                return fail(Result.MESSAGE_IS_NOT_TRUE);
            }else if((message.getAddTime().getTime() + 30 * 1000 * 60) < System.currentTimeMillis()){
                return fail(Result.MESSAGE_IS_BE_OVERDUE);
            }else{
                if(!bankCardRepository.existsById(bankCardId)){
                    return fail(Result.BANK_HAVE_NOT_DATA);
                }
                BankCard bankCard = bankCardRepository.findById(bankCardId).get();
                if(user.getBalance() < 200){
                    return fail(Result.BALANCE_HAVA_NOT);
                }
                if(money >  user.getBalance()){
                    return fail(Result.HAVE_NOT_BALANCE);
                }else{
                    Withdraw withdraw  = Withdraw.builder()
                            .user(user)
                            .money(money)
                            .addTime(new Date())
                            .updateTime(new Date())
                            .orderStatus(OrderStatus.WAIT_FOR_PAY)
                            .bankCard(bankCard)
                            .build();
                    withdrawRepository.save(withdraw);
                    user.setBalance(user.getBalance() - withdraw.getMoney());
                    userRepository.save(user);
                    //增加收支明细
                    IncomeDetail incomeDetail = IncomeDetail.builder()
                            .user(user)
                            .name("提现")
                            .balance(user.getBalance())
                            .date(new Date())
                            .money(withdraw.getMoney()*(-1))
                            .build();
                    incomeDetailRepository.save(incomeDetail);
                    return success();
                }
            }
        }else{
            return fail(Result.NO_USER);
        }
    }

    /**
     * 递归获取团队信息
     * @param userId
     * @return
     */
    @Override
    public OperateResult queryMyTeams(String userId) {
        List<ExtensionRecord> extensionRecords = queryMyTeams(userId,1);
        return success(extensionRecords);
    }

    public List<ExtensionRecord> queryMyTeams(String userId,int index) {
        if(index <= 2){
            List<ExtensionRecord> extensionRecords = extensionRecordRepository.findByUserId(userId);
            for (ExtensionRecord extensionRecord : extensionRecords){
                extensionRecord.setIndex(index);
                extensionRecord.setExtensionRecords(queryMyTeams(extensionRecord.getRecommendUser().getId(),index+1));
                Authentication authentication = authenticationRepository.findByUserId(extensionRecord.getRecommendUser().getId());
                if(authentication != null){
//                    extensionRecord.getRecommendUser().setPhone(authentication.getUsername());
                    extensionRecord.getRecommendUser().setUsername(authentication.getUsername());
                }
            }
            return extensionRecords;
        }
        return null;
    }

    @Override
    public OperateResult saveUserInfo(String userId, String username, String idCardNumber,String picture) {
        if(userRepository.existsById(userId)){
            User user = userRepository.findById(userId).get();
            if(StringUtils.isNotEmpty(username)){
                user.setUsername(username);
            }
            if(StringUtils.isNotEmpty(idCardNumber)){
                user.setIdCardNumber(idCardNumber);
            }

            if(StringUtils.isNotEmpty(picture)){
                user.setPicture(picture);
            }
            userRepository.save(user);
            return success();
        }else{
            return fail(Result.NO_USER);
        }
    }

    @Override
    public OperateResult queryWithPageOrderByIncome(int page, int size) {
        Sort sort = Sort.by(Sort.Direction.DESC, "totalIncome");
        PageRequest pageRequest = PageRequest.of(page,size,sort);
        Page<User> users = userRepository.findAll(pageRequest);
        return success(users.getContent());
    }

    @Override
    public Page<User> queryWithPage(int page, int size,String keyword,boolean hide) {
        Specification<User> specification = new Specification<User>() {
            @Override
            public Predicate toPredicate(Root<User> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
                List<Predicate> predicate = new ArrayList<>();
                if(hide){
                    predicate.add(cb.equal(root.get("hide").as(Integer.class), 0));
                }
                if(StringUtils.isNotEmpty(keyword)){
                    predicate.add(cb.like(root.get("phone").as(String.class), "%" + keyword + "%"));

                }
                Predicate[] pre = new Predicate[predicate.size()];
                return query.where(predicate.toArray(pre)).getRestriction();
            }
        };
        Sort sort = Sort.by(Sort.Direction.DESC, "id");
        PageRequest pageRequest = PageRequest.of(page,size,sort);
        Page<User> users = userRepository.findAll(specification,pageRequest);
        for (User user : users){
            Authentication authentication = authenticationRepository.findByUserId(user.getId());
            user.setAuthentication(authentication);
        }
        return users;
    }

    @Override
    public OperateResult post(String userId, Float money, Integer minerId) {
        User user = userRepository.findById(userId).get();
        if(money != null){
            user.setBalance(user.getBalance() + money);
            //增加收支明细
            IncomeDetail incomeDetail = IncomeDetail.builder()
                    .user(user)
                    .name("后台系统增加余额")
                    .balance(user.getBalance())
                    .date(new Date())
                    .money(money)
                    .build();
            incomeDetailRepository.save(incomeDetail);
        }

        if(minerId != null){
            if(minerId != 100){
                Miner miner = minerRepository.findById(minerId).get();
                if(user.getMiner() == null){//第一次购买才计算直接收益
                    if(user.getCode() != 0){
                        //计算直推收益
//                        calculationDirectRecommendation(user.getCode(),miner.getPrice());
                    }
                }
                user.setMiner(miner);
            }else{
                user.setMiner(null);
            }
        }
        userRepository.save(user);
        return success();
    }

    @Override
    public OperateResult updateCalculationForce() {
        List<User> users  = userRepository.findAll();
        for (User user :  users){
            //查询下一级别
            List<User> nextUsers  = userRepository.findByCode(user.getRecommendCode());
            float totalMoney =  0;
            for (User nextUser : nextUsers){
                if(nextUser.getMiner() != null){
                    totalMoney = totalMoney + nextUser.getMiner().getPrice();
                }
            }
            CalculationForce calculationForce = calculationForceRepository.findByUserId(user.getId());
            if(calculationForce  == null){
                calculationForce  = new CalculationForce();
            }
            if(user.getMiner() != null){
                totalMoney = totalMoney + user.getMiner().getPrice();
            }
            calculationForce.setUser(user);
            calculationForce.setMoney((int)(totalMoney/100));
            calculationForceRepository.save(calculationForce);
        }
        return success();
    }

    @Override
    public OperateResult queryWithPageCalculationForceOrderByMoney(int page, int size) {
        Specification<CalculationForce> specification = new Specification<CalculationForce>() {
            @Override
            public Predicate toPredicate(Root<CalculationForce> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
                List<Predicate> predicate = new ArrayList<>();
                predicate.add(cb.equal(root.get("user").get("hide").as(Integer.class), 0));
                Predicate[] pre = new Predicate[predicate.size()];
                return query.where(predicate.toArray(pre)).getRestriction();
            }
        };
        Sort sort = Sort.by(Sort.Direction.DESC, "money");
        PageRequest pageRequest = PageRequest.of(page,size,sort);
        Page<CalculationForce> calculationForces = calculationForceRepository.findAll(specification,pageRequest);
        for (CalculationForce calculationForce : calculationForces){
            String phone = calculationForce.getUser().getPhone().replaceAll("(\\d{3})\\d{4}(\\d{4})","$1****$2");
            calculationForce.getUser().setPhone(phone);
            if(StringUtils.isEmpty(calculationForce.getUser().getUsername())){
                calculationForce.getUser().setUsername(phone);
            }
        }
        return success(calculationForces.getContent());
    }

    /**
     * 直接推荐收益
     */
    @Override
    public void calculationDirectRecommendation(Integer recommendCode,float money){
        //查询1代推荐人
        User firstUser = userRepository.findByRecommendCode(recommendCode);
        if(firstUser.getMiner() != null && firstUser.getRoleStatus() == UserStatus.ENABLE ){
            //计算一代收益
            float totalMoney = money * firstUser.getMiner().getGeneration();
//            firstUser.setBalance(firstUser.getBalance() + totalMoney);
//            userRepository.save(firstUser);

            if(totalMoney > 0){
                //添加收益记录
                RevenueRecord revenueRecord  = RevenueRecord.builder()
                        .user(firstUser)
                        .miner(firstUser.getMiner())
                        .money(totalMoney)
                        .date(new Date())
                        .revenueStatus(RevenueStatus.NO)
                        .revenueType(RevenueType.TJSY)
                        .build();
                revenueRecordRepository.save(revenueRecord);
            }
        }

        //查询2代推荐人
        if(firstUser.getCode() != 0){
            User secondUser = userRepository.findByRecommendCode(firstUser.getCode());
            if(secondUser.getMiner() != null && secondUser.getRoleStatus() == UserStatus.ENABLE){
                //计算二代收益
                float totalMoney = money * secondUser.getMiner().getTwoGeneration();
//            secondUser.setBalance(secondUser.getBalance() + totalMoney);
//            userRepository.save(secondUser);

                if(totalMoney > 0){
                    //添加收益记录
                    RevenueRecord revenueRecord  = RevenueRecord.builder()
                            .user(secondUser)
                            .miner(secondUser.getMiner())
                            .money(totalMoney)
                            .date(new Date())
                            .revenueStatus(RevenueStatus.NO)
                            .revenueType(RevenueType.TJSY)
                            .build();
                    revenueRecordRepository.save(revenueRecord);
                }
            }
        }
    }

    @Override
    public void calculationCynamicIncome(String userId,String recommendUserId) {
        User user = userRepository.findById(userId).get();
        User recommendUser = userRepository.findById(recommendUserId).get();
        //自己是大矿主或者小矿主才计算动态收益
        if(user.getMiner() != null && user.getRoleStatus() == UserStatus.ENABLE){
            if(user.getMiner().getId() == 3 || user.getMiner().getId() == 4){
                List<User> users = queryLists(recommendUser.getRecommendCode());
                for (User user1 : users){
                    if(user1.getMiner() != null && user1.getRoleStatus() == UserStatus.ENABLE && user1.getProfit() > 0){
                        if(user.getMiner().getId() != 4){//小矿主动态收益,如果推荐用户是小矿主
                            float tcl = (float) 0.02;//默认是百分之2
                            //判断是否为直推1代，如果是直推一代则是百分之8
                            if(user.getRecommendCode() == user1.getCode()){
                                tcl = (float) 0.08;
                            }
                            float totalMoney = user1.getProfit() * tcl;
//                            user.setBalance(user.getBalance() + totalMoney);
//                            userRepository.save(user);

                            if(totalMoney > 0){
                                //添加收益记录
                                RevenueRecord revenueRecord  = RevenueRecord.builder()
                                        .user(user)
                                        .miner(user.getMiner())
                                        .money(totalMoney)
                                        .date(new Date())
                                        .revenueStatus(RevenueStatus.NO)
                                        .revenueType(RevenueType.DTSY)
                                        .build();
                                revenueRecordRepository.save(revenueRecord);
                            }
                        }else{//大矿主动态收益，推荐用户是大矿主
                            //添加收益记录
                            float tcl = (float) 0.05;//默认是百分之5
                            //判断是否为直推1代，如果是直推一代则是百分之10
                            if(user.getRecommendCode() == user1.getCode()){
                                tcl = (float) 0.1;
                            }
                            float totalMoney = user1.getProfit() * tcl;
                            if(totalMoney > 0) {
                                RevenueRecord revenueRecord = RevenueRecord.builder()
                                        .user(user)
                                        .miner(user.getMiner())
                                        .money(totalMoney)
                                        .date(new Date())
                                        .revenueStatus(RevenueStatus.NO)
                                        .revenueType(RevenueType.DTSY)
                                        .build();
                                revenueRecordRepository.save(revenueRecord);
                            }
                        }
                    }
                    calculationCynamicIncome(userId,user1.getId());
                }
            }
        }
    }

    /**
     * 获取菜单猎豹
     */
    public List<User> queryLists(Integer code){
        Specification<User> specification = new Specification<User>() {
            @Override
            public Predicate toPredicate(Root<User> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
                List<Predicate> predicate = new ArrayList<>();
                if(code != null) {
                    predicate.add(cb.equal(root.get("code").as(Integer.class), code));
                }else{
                    predicate.add(cb.equal(root.get("code").as(Integer.class),0));
                }
                Predicate[] pre = new Predicate[predicate.size()];
                return query.where(predicate.toArray(pre)).getRestriction();
            }
        };

        List<User> users = userRepository.findAll(specification);
        return users;
    }

    @Override
    public List<User> findAll() {
        return userRepository.findAll();
    }

    @Override
    public float queryUserTotalCalculationForce(String userId) {
        User user = userRepository.findById(userId).get();
        float total  = 0;
        if(user.getMiner() != null){
            total = user.getMiner().getPrice();
        }
        return queryUserTotalCalculationForce(user.getRecommendCode(),total);
    }

    public float queryUserTotalCalculationForce(Integer code,float totalCalculationForce){
        Specification<User> specification = new Specification<User>() {
            @Override
            public Predicate toPredicate(Root<User> root, CriteriaQuery<?> query, CriteriaBuilder cb) {
                List<Predicate> predicate = new ArrayList<>();
                if(code != null) {
                    predicate.add(cb.equal(root.get("code").as(Integer.class), code));
                }
                Predicate[] pre = new Predicate[predicate.size()];
                return query.where(predicate.toArray(pre)).getRestriction();
            }
        };

        List<User> users = userRepository.findAll(specification);
        for (User user : users){
            totalCalculationForce = queryUserTotalCalculationForce(user.getRecommendCode(),totalCalculationForce);
            if(user.getMiner() != null){
                totalCalculationForce = totalCalculationForce + user.getMiner().getPrice();
            }
        }
        return totalCalculationForce;
    }

    @Override
    public OperateResult dealStatus(String id, UserStatus status) {
        User user = userRepository.findById(id).get();
        user.setRoleStatus(status);
        userRepository.save(user);
        return success();
    }
}
