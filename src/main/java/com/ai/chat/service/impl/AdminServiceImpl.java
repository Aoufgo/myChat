package com.ai.chat.service.impl;

import com.ai.chat.mapper.UserMapper;
import com.ai.chat.pojo.User;
import com.ai.chat.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;


/**
 * @author aoufgo
 * @date 2021/4/5 下午4:28
 */
@Service
public class AdminServiceImpl implements AdminService{
    ModelAndView mav = new ModelAndView();
    @Resource
    private UserMapper userMapper;


    @Override
    public ModelAndView queryUser(User user) {
        try{
            List<User> users = userMapper.query(user);
            mav.addObject("users", users);

        }catch (Exception e){
            mav.addObject("error",e.getMessage());
            e.printStackTrace();
        }
        mav.setViewName("admin/userManage");
        return mav;
    }



    @Override
    public ModelAndView getUser(String id) {
        mav.addObject("user",userMapper.queryById(id));
        mav.setViewName("admin/userEdit");
        return  mav;
    }

    @Override
    public ModelAndView delUser(String id) {
        try {
            userMapper.del(id);
            mav.addObject("type",5);
        }catch (Exception e){
            mav.addObject("error",e.getMessage());
            mav.addObject("type",4);
            e.printStackTrace();
        }
        mav.setViewName("redirect:/admin/queryUser");
        return mav;
    }

    @Override
    public ModelAndView updateUser(User user) {
        try {
            userMapper.update(user);
            mav.addObject("type",7);
        }catch (Exception e){
            mav.addObject("error",e.getMessage());
            mav.addObject("type",6);
            e.printStackTrace();
        }
        mav.setViewName("redirect:/admin/queryUser");
        return mav;
    }
    @Override
    public ModelAndView addUser(User user) {
        try {
            userMapper.add(user);
            mav.addObject("type",7);
        }catch (Exception e){
            mav.addObject("error",e.getMessage());
            mav.addObject("type",6);
            e.printStackTrace();
        }
        mav.setViewName("admin/addUser");
        return mav;
    }
}
