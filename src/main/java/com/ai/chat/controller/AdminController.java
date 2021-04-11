package com.ai.chat.controller;

import com.ai.chat.pojo.User;
import com.ai.chat.service.AdminService;
import com.ai.chat.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
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

    @RequestMapping("queryUser")
    public ModelAndView queryUser(User user){
        return adminService.queryUser(user);
    }
    @RequestMapping("updateUser")
    public ModelAndView updateUser(User user){
        return adminService.updateUser(user);
    }
    @GetMapping("delUser")
    public ModelAndView delUser(String id){
        return adminService.delUser(id);
    }
    @RequestMapping("addUser")
    public ModelAndView addUser(User user){
        return adminService.addUser(user);
    }
    /**
     * @param id 用户id
     * @return 返回到页面该用户
     */
    @GetMapping("getUser")
    public ModelAndView getUser(String id){
        return adminService.getUser(id);
    }
}
