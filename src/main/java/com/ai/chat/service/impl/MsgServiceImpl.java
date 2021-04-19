package com.ai.chat.service.impl;

import com.ai.chat.mapper.MsgMapper;
import com.ai.chat.pojo.Message;
import com.ai.chat.service.MsgService;
import com.ai.chat.util.GenerateIdUtil;
import com.ai.chat.util.Md5Util;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
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
}
