package com.ai.chat.service.impl;

import com.ai.chat.mapper.LogMapper;
import com.ai.chat.pojo.Log;
import com.ai.chat.service.LogService;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import javax.annotation.Resource;
import java.util.List;


/**
 * @author teng
 */
@Service
public class LogServiceImpl implements LogService {
    ModelAndView mav = new ModelAndView();
    @Resource
    private LogMapper logMapper;


    @Override
    public ModelAndView saveLog(Log log) {
        try {
            logMapper.add(log);
            mav.addObject("result", true);
        }catch (Exception e){
            mav.addObject("error",e.getCause().toString());
            mav.addObject("result",false);
            e.printStackTrace();
        }
        return mav;
    }

    @Override
    public ModelAndView queryLog(Log log) {
        try {
            List<Log> logs = logMapper.queryAllLog(log);
            mav.addObject("logs",logs);
        }catch (Exception e){
            mav.addObject("error",e.getCause().toString());
            e.printStackTrace();
        }
        return mav;
    }
}
