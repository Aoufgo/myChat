package com.ai.chat.service.impl;

import com.ai.chat.mapper.AdminMapper;
import com.ai.chat.mapper.UserMapper;
import com.ai.chat.pojo.Admin;
import com.ai.chat.pojo.User;
import com.ai.chat.service.AdminService;
import com.ai.chat.util.GenerateIdUtil;
import com.ai.chat.util.Md5Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
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
    @Resource
    private AdminMapper adminMapper;


    @Override
    public ModelAndView queryUser(User user) {
        try{
            List<User> users = userMapper.query(user);
            mav.addObject("users", users);
        }catch (Exception e){
            mav.addObject("error",e.getCause().toString());
            e.printStackTrace();
        }
        return mav;
    }
    @Override
    public ModelAndView getUser(String id) {
        mav.addObject("user",userMapper.queryById(id));
        return  mav;
    }

    @Override
    public ModelAndView delUser(String id) {
        try {
            userMapper.del(id);
            mav.addObject("result",true);
        }catch (Exception e){
            mav.addObject("error",e.getCause().toString());
            mav.addObject("result",false);
            e.printStackTrace();
        }
        return mav;
    }

    @Override
    public ModelAndView updateUser(User user) {
        try {
            userMapper.update(user);
            mav.addObject("result",true);
        }catch (Exception e){
            mav.addObject("error",e.getCause().toString());
            mav.addObject("result",false);
            e.printStackTrace();
        }
        return mav;
    }
    @Override
    public ModelAndView addUser(User user) {
        try {
            //随机生成id
            user.setId(GenerateIdUtil.generateId());
            String id = user.getId();
            //设置用户昵称
            user.setNickname("用户"+id);
            //对密码Md5加密
            String password = Md5Util.md5(user.getPassword());
            user.setPassword(password);
            userMapper.add(user);
            mav.addObject("result",true);
        }catch (Exception e){
            mav.addObject("error",e.getCause().toString());
            mav.addObject("result",false);
            e.printStackTrace();
        }
        return mav;
    }

    @Override
    public ModelAndView login(Admin admin, HttpSession session) {
        try {
            String adminPassword = Md5Util.md5(admin.getAdminPassword());
            admin.setAdminPassword(adminPassword);
            if (adminMapper.queryByNp(admin) == null) {
                mav.addObject("result", false);
            } else {
                admin = adminMapper.queryById(admin.getAdminId());
                session.setAttribute("admin", admin);
                mav.addObject("result", true);
            }
        }catch (Exception e){
//            mav.addObject("error",e.getCause().toString());
            e.printStackTrace();
        }
        return mav;
    }
}
