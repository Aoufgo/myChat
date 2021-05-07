package com.ai.chat.mapper;

import com.ai.chat.pojo.Admin;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AdminMapper {

    /**
     * 根据用户名密码查询方法
     * @param admin
     * @return
     */
    Admin queryByNp (Admin admin);

    /**
     * 添加管理员方法
     * @param admin
     * @return
     */
    int add (Admin admin);

    /**
     * 根据adminId查询的方法
     * @param adminId
     * @return
     */
    Admin queryById(int adminId);

    /**
     * 删除管理员
     * @param adminId
     * @return
     */
    int delAdmin (int adminId);

    /**
     * 查询管理员
     * @param admin
     * @return
     */
    List<Admin> queryAll(Admin admin);

    /**
     * 编辑管理员
     * @param admin
     * @return
     */
    int update (Admin admin);

    /**
     * 根据名字更新登录时间
     * @param admin
     * @return
     */
    int updateByAdminName(Admin admin);

    /**
     * 增加管理员
     * @param admin
     * @return
     */
    int insertAdmin(Admin admin);

    /**
     * 条件查询管理员
     * @param admin
     * @return
     */
    List<Admin> query(Admin admin);

    Admin queryByAdminName(Admin admin);





}
