package com.ai.chat;

import com.ai.chat.mapper.UserMapper;
import com.ai.chat.pojo.Message;
import com.ai.chat.service.impl.MsgServiceImpl;

import javax.annotation.Resource;
import java.util.Map;

/**
 * @author aoufgo
 * @date 2021/4/14 上午10:35
 */

public class Test {
    @org.junit.Test
    public void test1(){
        new MsgServiceImpl().add(new Message("11","11","11","11"));
    }

}