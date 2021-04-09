package com.ai.chat.service;

import com.ai.chat.pojo.User;
import com.sun.org.apache.xpath.internal.operations.Mod;
import org.springframework.stereotype.Repository;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

/**
 * @author aoufgo
 * @date 2021/4/2 下午4:32
 */
@Repository
public interface UserService {
    /**
     * 注册用户
     * @param user 接收的user对象
     * @return 页面信息
     */
    ModelAndView register(User user);
    /**
     * 登录用户
     * @param user 接收的user对象
     * @param session session域对象
     * @return 页面信息
     */
    ModelAndView login(User user, HttpSession session);




}
