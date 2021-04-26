package com.ai.chat.config;


import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * @author aoufgo
 * @date 2021/4/3 下午4:37
 */
@Configuration
public class MyMvcConfig implements WebMvcConfigurer {
    /**资源处理器:设置静态资源的url*/
    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/image/**").addResourceLocations("/WEB-INF/"+"/image/");
        registry.addResourceHandler("/static/**").addResourceLocations("/WEB-INF/"+"/static/");
        //虚拟路径
        registry.addResourceHandler("/avatar/**").addResourceLocations("file:/Volumes/MacData/chatAvatar/");
    }

}
