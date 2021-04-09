package com.ai.chat.util;

import com.ai.chat.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import javax.annotation.Resource;

/**
 * @author aoufgo
 */
@Component
public class GenerateIdUtil {
    static UserMapper mapper;

    /**
     * springboot不支把值自动注入到静态变量中,但可以使用非静态的set方法注入
     * @param mapper 注入mapper
     */
    @Autowired
    public  void setMapper(UserMapper mapper) {
        GenerateIdUtil.mapper = mapper;
    }
    /**
     *  随机生成x位的id方法
     * @param x 位数
     * @return id
     */
    public static String randomId(int x){
        StringBuilder code= new StringBuilder();
        int i =1;
        while (i<=x){
            //生成0-9的整数
            int n= (int)(Math.random()*10);
            if (n != 0) {
                code.append(n);
                i++;
            }
        }
        return code.toString();
    }

    /**
     * 生成id方法
     * @return id
     */
    public static String generateId(){
        String id;
        int x = 6;
        a:while (true){
            while (true){
                id = randomId(x);
                System.out.println(mapper);
                //数据库查重
                if (mapper.queryById(id) == null){
                    break a;
                }else {
                    break ;
                }
            }
            //位数加一
            x++;
        }
        return id;
    }
}
