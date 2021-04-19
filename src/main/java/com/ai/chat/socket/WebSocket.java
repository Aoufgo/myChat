package com.ai.chat.socket;

import com.ai.chat.mapper.MsgMapper;
import com.ai.chat.mapper.UserMapper;
import com.ai.chat.pojo.Message;
import com.ai.chat.pojo.User;
import com.ai.chat.service.AdminService;
import com.ai.chat.service.MsgService;
import com.ai.chat.service.UserService;
import com.ai.chat.service.impl.AdminServiceImpl;
import com.ai.chat.service.impl.MsgServiceImpl;
import com.ai.chat.service.impl.UserServiceImpl;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import javax.websocket.*;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

/**
 * @author aoufgo
 */
@Slf4j
@Component
@ServerEndpoint("/websocket/{userId}")
public class WebSocket {

    /**
     * 在线人数
     */
    public static int onlineNumber = 0;
    /**
     * 以用户的姓名为key，WebSocket为对象保存起来
     */
    private static final Map<String, WebSocket> clients = new ConcurrentHashMap<String, WebSocket>();
    /**
     * 会话
     */
    private Session session;
    /**
     * 用户id
     */
    private String userId;

    private static UserMapper userMapper;

    private static MsgMapper msgMapper;

    @Resource
    public void setUserMapper(UserMapper userMapper) {
        WebSocket.userMapper = userMapper;
    }
    @Resource
    public void setMsgMapper(MsgMapper msgMapper) {
        WebSocket.msgMapper = msgMapper;
    }
    /*
     * OnOpen 表示有浏览器链接过来的时候被调用
     * OnClose 表示浏览器发出关闭请求的时候被调用
     * OnMessage 表示浏览器发消息的时候被调用
     * OnError 表示有错误发生，比如网络断开了等等
     */

    /**
     * 建立连接
     *
     * @param session
     */
    @OnOpen
    public void onOpen(@PathParam("userId") String userId, Session session) {
        onlineNumber++;
        log.info("现在来连接的客户id：" + session.getId() + "用户Id：" + userId);
        this.userId = userId;
        this.session = session;
        clients.put(userId, this);
        log.info("有新连接加入！ 当前在线人数" + onlineNumber);
    }

    @OnError
    public void onError(Session session, Throwable error) {
        log.info("服务端发生了错误" + error);
        //error.printStackTrace();
    }

    /**
     * 连接关闭
     */
    @OnClose
    public void onClose() {
        onlineNumber--;
        clients.remove(userId);
        //设置用户的在线状态为离线
        User user = new User();
        user.setStatus(0);
        user.setId(userId);
        userMapper.update(user);
        log.info("有连接关闭！ 当前在线人数" + onlineNumber);
    }

    /**
     * 收到客户端的消息
     *
     * @param message 消息
     * @param session 会话
     */
    @OnMessage
    public void onMessage(String message, Session session) {
        try {
            log.info("来自客户端消息：" + message + "客户端的id是：" + session.getId());
            JSONObject jsonObject = JSON.parseObject(message);
            String textMessage = jsonObject.getString("message");
            String fromId = jsonObject.getString("userId");
            String toId = jsonObject.getString("to");
            String time = jsonObject.getString("sendTime");
            //发送信息给
            Map<String, Object> map1 = new HashMap<>();
            map1.put("textMessage", textMessage);
            map1.put("fromId", fromId);
            map1.put("toId", toId);
            sendMessageTo(JSON.toJSONString(map1),toId);
            //将信息存入数据库
            Message msg = new Message(fromId,toId,textMessage,time);
            msgMapper.add(msg);
        } catch (Exception e) {
            log.info("发生了错误了:"+e);
            e.printStackTrace();
        }
    }

    public void sendMessageTo(String message,String toId) throws IOException {
        for (WebSocket item : clients.values()) {
            System.out.println(item.userId);
            if (item.userId.equals(toId)) {
                item.session.getAsyncRemote().sendText(message);
                break;
            }
        }
    }

    public static synchronized int getOnlineCount() {
        return onlineNumber;
    }

}
