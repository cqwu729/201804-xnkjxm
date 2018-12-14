package com.liaoin.service.app.service;


import com.liaoin.service.app.Enum.UserStatus;
import com.liaoin.service.app.bean.Order;
import com.liaoin.service.app.bean.User;
import com.liaoin.service.base.message.OperateResult;
import org.springframework.data.domain.Page;

import java.util.List;

public interface UserService {

    public OperateResult save(User user);

    public OperateResult login(String phone, String password);

    public OperateResult findById(String userId);

    public User findId(String userId);

    public OperateResult register(String phone, int verify, String password, String confirmPassword, Integer recommendCode);

    public OperateResult forgetPassword(String phone, int verify, String password, String confirmPassword);

    public OperateResult withdraw(String userId,float money,String bankCardId,Integer verify);

    public OperateResult queryMyTeams(String userId);

    public OperateResult saveUserInfo(String userId,String username, String idCardNumber,String picture);

    public OperateResult queryWithPageOrderByIncome(int page, int size);

    public Page<User> queryWithPage(int page, int size,String keyword,boolean hide);

    public OperateResult post(String  userId, Float money, Integer minerId);

    public OperateResult updateCalculationForce();

    public OperateResult queryWithPageCalculationForceOrderByMoney(int page, int size);

    /**
     * 直接推荐收益
     */
    public void calculationDirectRecommendation(Integer recommendCode,float money);

    /**
     * 计算动态收益
     * @param userId //收钱的人id
     */
    public void calculationCynamicIncome(String userId,String recommendUserId);

    public List<User> findAll();

    /**
     * 获取用户所有下级算力值
     */
    public float queryUserTotalCalculationForce(String userId);

    OperateResult dealStatus(String id, UserStatus status);
}
