package com.ai.chat.controller;

import com.ai.chat.pojo.User;
import com.ai.chat.service.AdminService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;

/**
 * @author aoufgo
 * @date 2021/4/5 下午4:35
 */
@RestController
@RequestMapping("/admin")
public class AdminController {

    @Resource(name = "adminServiceImpl")
    AdminService adminService;

    String rsKey = "result";

    @RequestMapping("queryUser")
    public ModelAndView queryUser(User user){
        ModelAndView mav = adminService.queryUser(user);
        mav.setViewName("admin/userManage");
        return mav;
    }
    /**
     * @param id 用户id
     * @return 返回到页面该用户
     */
    @GetMapping("getUser")
    public ModelAndView getUser(String id){
        ModelAndView mav= adminService.getUser(id);
        mav.setViewName("admin/userEdit");
        return mav;
    }
    @RequestMapping("updateUser")
    public ModelAndView updateUser(User user){
        ModelAndView mav = adminService.updateUser(user);
        rsKey = "result";
        if ((Boolean)mav.getModel().get(rsKey)){
            mav.addObject("type",7);
        }else {
            mav.addObject("type",6);
        }
        mav.setViewName("redirect:/admin/queryUser");
        return mav;
    }
    @GetMapping("delUser")
    public ModelAndView delUser(String id){
        ModelAndView mav = adminService.delUser(id);
        rsKey = "result";
        if ((Boolean)mav.getModel().get(rsKey)){
            mav.addObject("type",5);
        }else {
            mav.addObject("type",4);
        }
        mav.setViewName("redirect:/admin/queryUser");
        return mav;
    }
    @RequestMapping("addUser")
    public ModelAndView addUser(User user){
        ModelAndView mav = adminService.addUser(user);
        rsKey = "result";
        if ((Boolean)mav.getModel().get(rsKey)){
            mav.addObject("type",1);
        }else {
            mav.addObject("type",2);
        }
        mav.setViewName("admin/userAdd");
        return mav;
    }

}
