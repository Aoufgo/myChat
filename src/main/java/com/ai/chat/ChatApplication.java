package com.ai.chat;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.context.annotation.EnableAspectJAutoProxy;

/**
 * @author aoufgo
 */
@ServletComponentScan   //扫描Servlet
@MapperScan("com.ai.chat.mapper")//自动扫描mapper文件
@EnableAspectJAutoProxy//自动扫描所有的aspectJ代理,spring来生成代理对象
@SpringBootApplication
public class ChatApplication {

    public static void main(String[] args) {
        SpringApplication.run(ChatApplication.class, args);
    }

}
