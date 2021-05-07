package com.ai.chat.service;

import com.ai.chat.pojo.Log;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;

public interface LogService {

    /**
     * 保存日志
     * @param log
     * @return
     */
    ModelAndView saveLog (Log log);

    /**
     * 查询日志
     * @param log
     * @return
     */
    ModelAndView queryLog (Log log);
}
