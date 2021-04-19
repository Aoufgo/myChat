package com.ai.chat.aspect;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;

import java.util.Date;

/**
 * @author aoufgo
 * @date 2021/4/8 下午11:11
 */
@Component
@Aspect //表示当前类是切面类
public class ServiceAspect {
    /*
     * 定义方法,实现切面功能
     * 1.public
     * 2.void
     * 3.名称自定义
     * 4.可以有参数,也可以无
     */
    /**
     * 在所有service方法执行前获得时间
     */
    @Before(value = "execution(* *..*Impl.*(..))")
    public void timeBefore(JoinPoint jp){
        //获取方法的定义
        System.out.println("方法的定义:"+jp.getSignature());
        System.out.println("方法的名称:"+jp.getSignature().getName());
        System.out.println("业务执行的时间为"+new Date());
    }
}
