package com.ai.chat.service;

import com.ai.chat.pojo.User;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.stereotype.Repository;
import org.springframework.web.servlet.ModelAndView;


/**
 * @author aoufgo
 * @date 2021/4/5 下午4:28
 */
@Repository
public interface AdminService {

    /**
     * 条件查询用户
     * @return mav
     * @param user 条件
     */
    ModelAndView queryUser(User user);

    /**
     * 获取用户
     * @param id 用户id
     * @return mav
     */
    ModelAndView getUser(String id);
    /**
     * 删除用户方法
     * @param id 用户id
     * @return mav
     */
    ModelAndView delUser(String id);

    /**
     * 更新用户信息方法
     * @param user 更新过的用户信息
     * @return mav
     */
    ModelAndView updateUser(User user);

}
