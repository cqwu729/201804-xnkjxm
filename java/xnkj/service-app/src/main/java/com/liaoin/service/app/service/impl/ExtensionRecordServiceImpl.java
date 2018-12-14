package com.liaoin.service.app.service.impl;

import com.liaoin.service.app.bean.ExtensionRecord;
import com.liaoin.service.app.bean.User;
import com.liaoin.service.app.dao.ExtensionRecordRepository;
import com.liaoin.service.app.dao.UserRepository;
import com.liaoin.service.app.service.ExtensionRecordService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import javax.servlet.http.HttpServletRequest;
import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
public class ExtensionRecordServiceImpl  implements ExtensionRecordService {

    @Autowired
    private ExtensionRecordRepository extensionRecordRepository;

    @Autowired
    private UserRepository userRepository;
    /**
     * 递归获取
     */
    @Override
    public String queryExtensionRecords(Integer code, HttpServletRequest request){
        StringBuilder textbookString = new StringBuilder("");
        List<User> users = queryLists(code);
        if(users.size() > 0){
            for(User user : users){
                String classValue = "";
                if(user.getCode() != 0){
                    classValue = "child-of-node-" + user.getCode();
                }
                String name = "";
                if(user.getMiner()  != null){
                    name =  user.getMiner().getUsername();
                }
                String textbookStr = "<tr id='node-"+user.getRecommendCode()+"' class="+classValue+">" +
                        "<td style='padding-left:20px;'>" + user.getPhone() + "</td>" +
                        "<td>" + user.getUsername() + "</td>" +
                        "<td>" + name + "</td>" +
                        "<td>" + user.getBalance()+ "</td>" +
                        "<td>" + user.getTotalIncome()  +"</td>" +
                        "<td>" + user.getYesterdayIncome()  +"</td>" +
                        "</tr>"+queryExtensionRecords(user.getRecommendCode(), request);
                textbookString.append(textbookStr);
            }
        }
        return textbookString.toString();
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
}
