package com.ai.chat.controller;

import com.ai.chat.pojo.Message;
import com.ai.chat.pojo.Relation;
import com.ai.chat.pojo.User;
import com.ai.chat.service.MsgService;
import com.ai.chat.service.UserService;
import com.alibaba.fastjson.JSON;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpRequest;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author aoufgo
 * @date 2021/4/2 下午4:52
 */
@RestController
@RequestMapping("/user")
public class UserController {
    @Resource(name = "userServiceImpl")
    private UserService service;
    @Resource(name = "msgServiceImpl")
    private MsgService msgService;
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
        //获取好友邀请信息
        mav.addObject("respList",msgService.getResp(id));
        mav.setViewName("chat");
        return mav;
    }

    @GetMapping("getFriends/{id}")
    public void getFriends(@PathVariable String id, HttpServletRequest request){
        ModelAndView mav = service.chat(id);
        List<Relation> list = (List<Relation>)mav.getModel().get("friends");
        System.out.println(list);
        request.setAttribute("friends",list);
    }

    @GetMapping("link/{fromId}/{toId}")
    public ModelAndView linkTo(@PathVariable String fromId,@PathVariable String toId){
        //查询聊天记录
        ModelAndView mav = msgService.getChatLog(fromId,toId);
        mav.addObject("fromId",fromId);
        mav.addObject("id",toId);
        mav.setViewName("chat_page");
        return mav;
    }
    @RequestMapping("quit")
    public void quit(HttpSession session){
        session.removeAttribute("user");
    }

    @RequestMapping("isRead/{fromId}/{toId}")
    public void updateRead(@PathVariable String fromId,@PathVariable String toId){
        msgService.updateRead(fromId, toId);
    }
    @RequestMapping("getUnread/{id}")
    public String getUnread(@PathVariable String id){
        return  JSON.toJSONString(msgService.getUnread(id));
    }
    @RequestMapping("addF/{id1}/{id2}")
    public String quit(@PathVariable String id1,@PathVariable String id2){
        return (service.addF(id1, id2)? "yes":"no");
    }
    @RequestMapping("getUser/{id}")
    public String getUser(@PathVariable String id){
        return (service.getUser(id)? "yes":"no");
    }












}
