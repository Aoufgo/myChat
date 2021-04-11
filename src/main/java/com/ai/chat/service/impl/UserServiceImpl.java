package com.ai.chat.service.impl;



import com.ai.chat.service.UserService;
import com.ai.chat.mapper.UserMapper;
import com.ai.chat.pojo.User;
import com.ai.chat.util.GenerateIdUtil;
import com.ai.chat.util.Md5Util;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @author aoufgo
 */
@Repository
@Service

public class UserServiceImpl implements UserService {
    @Resource(name = "userMapper")
    private UserMapper mapper;


    @Override
    public ModelAndView register(User user) {
        ModelAndView mav = new ModelAndView();
        try {
            //随机生成id
            user.setId(GenerateIdUtil.generateId());
            //对密码Md5加密
            String password = Md5Util.md5(user.getPassword());
            user.setPassword(password);
            //添加数据库
            mapper.add(user);
            mav.addObject("type",1);
            mav.setViewName("login");
        } catch (Exception e) {
            mav.addObject("msg",e.getCause().toString());
            e.printStackTrace();
        }
        return mav;
    }
    @Override
    public ModelAndView login(User user, HttpSession session) {
        ModelAndView mav = new ModelAndView();
        try {
            //md5加密
            String password = Md5Util.md5(user.getPassword());
            user.setPassword(password);
            if (mapper.queryByNP(user)==null){
                mav.addObject("type",7);
            }else {
                //将user对象存入session域对象
                session.setAttribute("user",user);
                //修改在线状态为'在线'
                user.setStatus(1);
                mapper.update(user);
                mav.addObject("type",4);
            }
        } catch (Exception e) {
            mav.addObject("error",e.getCause().toString());
            e.printStackTrace();
        }
        mav.setViewName("login");
        return mav;
    }

}
