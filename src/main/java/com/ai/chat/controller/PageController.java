package com.ai.chat.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 因为springboot不支持直接访问jsp文件,所以要写一个控制页面跳转的controller
 * @author aoufgo
 * @date 2021/4/3 下午2:38
 */
@Controller
public class PageController {
    @RequestMapping("{page}")
    public String page(@PathVariable String page){
        return page;
    }

    @RequestMapping("/admin_page/{page}")
    public  String permissionPage(@PathVariable String page){
        return "admin/"+page;
    }
}