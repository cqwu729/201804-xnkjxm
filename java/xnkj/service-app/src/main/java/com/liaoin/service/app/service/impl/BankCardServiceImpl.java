package com.liaoin.service.app.service.impl;

import com.liaoin.service.app.bean.BankCard;
import com.liaoin.service.app.dao.BankCardRepository;
import com.liaoin.service.app.service.BankCardService;
import com.liaoin.service.base.message.OperateResult;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

import static com.liaoin.service.base.message.OperateResult.success;

@Service
public class BankCardServiceImpl implements BankCardService {

    @Autowired
    private BankCardRepository  bankCardRepository;

    @Override
    public OperateResult save(BankCard bankCard) {
        //查询用户银行卡
        if(StringUtils.isNotEmpty(bankCard.getAddress())){
            List<BankCard>  bankCards =  bankCardRepository.findByUserIdAndAddressNotNull(bankCard.getUserId());
            if(bankCards.size() > 0){
                bankCard.setId(bankCards.get(0).getId());
            }
            bankCardRepository.save(bankCard);
        }else{
            List<BankCard>  bankCards =  bankCardRepository.findByUserIdAndAddressNull(bankCard.getUserId());
            if(bankCards.size() > 0){
                bankCard.setId(bankCards.get(0).getId());
            }
            bankCardRepository.save(bankCard);
        }
        return success();
    }

    @Override
    public OperateResult queryUserBankCardLists(String userId) {
        List<BankCard>  bankCards =  bankCardRepository.findByUserId(userId);
        return success(bankCards);
    }

    @Override
    public OperateResult queryUserBankCard(String userId) {
        List<BankCard> bankCards =  bankCardRepository.findByUserIdAndAddressNull(userId);
        return success(bankCards);
    }

    @Override
    public OperateResult queryUserImtoken(String userId) {
        List<BankCard>  bankCards =  bankCardRepository.findByUserIdAndAddressNotNull(userId);
        return success(bankCards);
    }
}
