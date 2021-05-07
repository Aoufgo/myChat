package com.ai.chat.controller;

import com.ai.chat.pojo.Log;
import com.ai.chat.service.LogService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;

@RestController
@RequestMapping("/log")
public class LogController {
    @Resource(name = "logServiceImpl")
    LogService logService;

    String rsKey = "result";

    @RequestMapping("queryAll")
    public ModelAndView queryAll(Log log){
        ModelAndView mav = logService.queryLog(log);
        mav.setViewName("admin/log");
        return mav;
    }





}
