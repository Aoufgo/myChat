package com.ai.chat.mapper;

import com.ai.chat.pojo.Relation;
import com.ai.chat.pojo.User;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;


import java.util.List;
import java.util.Map;


/**
 * @author aoufgo
 */
@Repository
public interface UserMapper {
    /**
     * 添加用户方法
     * @param user 设定属性的user对象
     * @return 影响数据库的行数
     */
    int add(User user);

    /**
     * 根据id删除用户的方法
     * @param id 要删除用户的id
     * @return 影响数据库的行数
     */
    int del(String id);

    /**
     * 查询所有用户方法
     * @return 所有用户的集合
     */
    List<User> queryAll();
    /**
     * 条件查询用户
     * @return 用户的集合
     * @param user 条件
     */
    List<User> query(User user);

    /**
     * 根据id查询用户的方法
     * @param id 要查询用户的id
     * @return 用户的对象
     */
    User queryById(String id);

    /**
     * 根据用户名和密码查询用户方法
     * @param user 用户对象
     * @return 用户对象
     */
    User queryByNP(User user);

    /**
     * 修改用户信息方法
     * @param user 修改好的用户对象
     * @return 影响数据库的行数
     */
    int update(User user);

    /**
     * 获取id的好友和分组
     * @param id 用户id
     * @return 存放的list
     */
    List<Relation> getFriends(String id);

    /**
     * 根据name获取用户
     * @param name name
     * @return 用户对象
     */
    User queryByName(String name);
    /**
     * 根据phone获取用户
     * @param phone phone
     * @return 用户对象
     */
    User queryByPhone(String phone);


}
