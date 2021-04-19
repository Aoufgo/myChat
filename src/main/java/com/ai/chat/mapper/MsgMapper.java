package com.ai.chat.mapper;

import com.ai.chat.pojo.Message;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface MsgMapper {
    /**
     * 添加信息方法
     * @param msg 设定属性的信息对象
     * @return 影响数据库的行数
     */
    int add(Message msg);


    /**
     * 条件查询信息方法
     * @return 所有信息的集合
     */
    List<Message> query(Message msg);

}
