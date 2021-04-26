package com.ai.chat.mapper;

import com.ai.chat.pojo.Admin;
import org.springframework.stereotype.Repository;

@Repository
public interface AdminMapper {

    /**
     * 根据用户名密码查询方法
     * @param admin
     * @return
     */
    Admin queryByNp (Admin admin);

    /**
     * 添加信息方法
     * @param admin
     * @return
     */
    int add (Admin admin);

    /**
     * 根据adminId查询的方法
     * @param adminId
     * @return
     */
    Admin queryById(String adminId);





}
