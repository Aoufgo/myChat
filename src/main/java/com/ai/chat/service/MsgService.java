package com.ai.chat.service;

import com.ai.chat.pojo.Message;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
@Service
public interface MsgService {
    /**
     * 添加信息记录
     * @param message 信息对象
     * @return 影响行数
     */
    ModelAndView add(Message message);
}
