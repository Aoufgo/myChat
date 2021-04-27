package com.ai.chat.util;

import com.aliyuncs.CommonRequest;
import com.aliyuncs.CommonResponse;
import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.IAcsClient;
import com.aliyuncs.exceptions.ClientException;
import com.aliyuncs.exceptions.ServerException;
import com.aliyuncs.http.MethodType;
import com.aliyuncs.profile.DefaultProfile;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import org.springframework.stereotype.Component;


/**
 * 发送验证码工具类
 * 1.生成一个6位验证码
 * 2.发送验证码
 *
 * @author aoufgo
 */
@Component
public class SendCodeUtil {
    /**
     * 生成六位验证码
     */
    public static String randomCode() {
        String code = "";
        while (true) {
            int f = (int) (Math.random() * 10);
            if (f != 0) {
                code += f;
                break;
            }
        }
        int i = 1;
        while (i <= 5) {
            //生成0-9的整数
            int n = (int) (Math.random() * 10);
            code += n;
            i++;
        }
        return code;
    }

    /**
     * 发送验证码方法
     * @param userPhone 手机
     * @return 返回验证码，如果返回位null，表示发送失败，否则成功
     */
    public static String send(String userPhone){
        DefaultProfile profile = DefaultProfile.getProfile("cn-hangzhou", "LTAI4FyNPFCE7uyU2uwozAEw", "FNAJUVoVR2TFy5Akzgi8wBu22gIChD");
        IAcsClient client = new DefaultAcsClient(profile);

        CommonRequest request = new CommonRequest();
        request.setSysMethod(MethodType.POST);
        request.setSysDomain("dysmsapi.aliyuncs.com");
        request.setSysVersion("2017-05-25");
        request.setSysAction("SendSms");
        request.putQueryParameter("RegionId", "cn-hangzhou");
        request.putQueryParameter("PhoneNumbers", userPhone);
        request.putQueryParameter("SignName", "Lq商城");
        request.putQueryParameter("TemplateCode", "SMS_206735114");

        //随机生成6位数验证码
        String code = randomCode();


        request.putQueryParameter("TemplateParam", "{code:" + code + "}");
        try {
            CommonResponse response = client.getCommonResponse(request);
            System.out.println(response.getData());
            //获取发送验证码后的结果
            String result = response.getData();
            //获取结果中的Message的值  需要将result转换为json对象
            JsonObject json = (JsonObject) JsonParser.parseString(result);

            result = json.get("Message").toString().replace("\"", "");

            if ("OK".equals(result)) {
                return code;
            }

        } catch (ClientException e) {
            e.printStackTrace();
        }
        return null;
    }
}
