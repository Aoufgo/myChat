package com.ai.chat.service.impl;

import com.ai.chat.mapper.MsgMapper;
import com.ai.chat.pojo.Message;
import com.ai.chat.service.MsgService;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * @author guoao
 */
@Service
public class MsgServiceImpl implements MsgService {
    @Resource(name = "msgMapper")
    private MsgMapper mapper;

    ModelAndView mav = new ModelAndView();

    @Override
    public ModelAndView add(Message msg) {
        try {
            mapper.add(msg);
            mav.addObject("result",true);
        } catch (Exception e) {
            mav.addObject("error", e.getCause().toString());
            mav.addObject("result",false);
            e.printStackTrace();
        }
        return mav;
    }

    @Override
    public ModelAndView query(Message msg) {
        try {
            List<Message> messages = mapper.query(msg);
            mav.addObject("messages",messages);
            mav.addObject("result",true);
        } catch (Exception e) {
            mav.addObject("error", e.getCause().toString());
            mav.addObject("result",false);
            e.printStackTrace();
        }
        return mav;
    }

    @Override
    public ModelAndView getChatLog(String fromId, String toId) {
        try {
            List<Message> messages = mapper.getChatLog(fromId,toId);
            mav.addObject("messages",messages);
            mav.addObject("result",true);
        } catch (Exception e) {
            mav.addObject("error", e.getCause().toString());
            mav.addObject("result",false);
            e.printStackTrace();
        }
        return mav;
    }

    @Override
    public void updateRead(String fromId, String toId) {
        mapper.updateRead(fromId, toId);
    }

    @Override
    public List<Map<String, Integer>> getUnread(String id) {
        return mapper.getUnread(id);
    }
}
