package com.ai.chat.controller;

import com.ai.chat.pojo.User;
import com.ai.chat.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

/**
 * @author aoufgo
 * @date 2021/4/2 下午4:52
 */
@RestController
@RequestMapping("/user")
public class UserController {
    @Resource(name = "userServiceImpl")
    private UserService service;
    String rsKey = "result";

    /**
     * 注册controller
     * @param user 前端user
     * @return 反馈信息
     */
    @RequestMapping("register")
    public ModelAndView register(User user){
        ModelAndView mav = service.register(user);
        rsKey = "result";
        if ((Boolean)mav.getModel().get(rsKey)){
            mav.addObject("type",1);
            mav.setViewName("login");
        }else {
            mav.addObject("type",0);
            mav.setViewName("register");
        }
        return mav;
    }
    /**
     * 登录controller
     * @param user 前端user
     * @param session 存入session
     * @return 反馈信息
     */
    @RequestMapping("login")
    public ModelAndView login(User user, HttpSession session){
        ModelAndView mav = service.login(user,session);
        rsKey = "result";
        if ((Boolean)mav.getModel().get(rsKey)){
            mav.addObject("type",4);
        }else {
            mav.addObject("type",7);
        }
        mav.setViewName("login");
        return mav;
    }

    /**
     * 跳转到chat页面
     * @param id
     * @return
     */
    @GetMapping("jumpToChat/{id}")
    public ModelAndView chat(@PathVariable String id){
        ModelAndView mav = service.chat(id);
        mav.setViewName("chat");
        return mav;
    }

    @GetMapping("link/{id}")
    public ModelAndView linkTo(@PathVariable String id){
        ModelAndView mav = new ModelAndView();
        mav.addObject("id",id);
        mav.setViewName("chat_page");
        return  mav;
    }











}
