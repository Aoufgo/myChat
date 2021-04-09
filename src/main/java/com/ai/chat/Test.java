package com.ai.chat;

import com.ai.chat.pojo.User;
import com.ai.chat.service.UserService;
import com.ai.chat.service.impl.UserServiceImpl;
import com.ai.chat.util.GenerateIdUtil;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Properties;

/**
 * @author aoufgo
 * @date 2021/4/3 下午1:19
 */
public class Test {
    private Class c;
    //    public static void main( String[] args )
//    {
//        System.out.println( "Hello World!" );
//        UserService service = new UserServiceImpl();
//        String id = GenerateIdUtil.generateId();
//        boolean b = service.register(new User(id,"anans","isis","12334","m",21,"15517305802",
//                0,0,null,null,null,null));
//        System.out.println(b);
//
//    }

    public static void main(String[] args) throws IOException, ClassNotFoundException, IllegalAccessException, InstantiationException, InvocationTargetException {
        Properties properties = new Properties();
        properties.load(new FileReader("src/main/java/com/ai/chat/my.properties"));
        String str = properties.getProperty("name");
        Class<?> c = Class.forName(str);
        Object newIns = c.newInstance();
        Method[] methods = c.getMethods();
        for (Method method:methods){
            System.out.println(method.getName());
            //method.invoke(newIns);
        }

    }
}

