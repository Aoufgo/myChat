package com.ai.chat.mapper;

import com.ai.chat.pojo.Message;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * @author guoao
 */
@Repository
public interface MsgMapper {
    /**
     * 添加信息方法
     * @param msg 设定属性的信息对象
     * @return 影响数据库的行数
     */
    int add(Message msg);

    /**
     * 获取聊天记录方法
     * @param fromId 发送者id
     * @param toId 接收者id
     * @return 信息集合
     */
    List<Message> getChatLog(String fromId,String toId);

    /**
     * 条件查询信息方法
     * @param msg 信息对象
     * @return 所有信息的集合
     */
    List<Message> query(Message msg);

    /**
     * 将对方的信息设为已读
     * @param fromId 发送者id
     * @param toId 接收者id
     */
    void updateRead(String fromId, String toId);

    /**
     * 获取用户的未读消息
     * @param id 用户id
     * @return 用户好友对应的未读消息数
     */
    List<Map<String,Integer>> getUnread(String id);

    /**
     * 获取用户的未读好友邀请
     * @param id 用户Id
     * @return 邀请信息
     */
    List<Message> getReq(String id);

}
