package com.ai.chat.util;

import com.baidu.aip.face.AipFace;
import com.baidu.aip.face.MatchRequest;
import org.apache.commons.codec.binary.Base64;
import org.json.JSONObject;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;

/**
 * 人脸对比工具类
 * @author aoufgo
 */
public class FaceUtil {
    private static String appId ="23316281";
    private static String apiKey ="2baXqxVuUIR5AxDl42mzo3bR";
    private static String secretKey ="0G0QdgaWn1h3jA67DL1i3dWHBxzaSkK7";
    private static AipFace client;

    //创建aip客户端
    static {
        client = new AipFace(appId,apiKey,secretKey);
    }
    /**
     * 校验两个人脸图片是否为同一个人的方法
     *
     * @param loginFaceImg 要登陆的人脸信息，本身为base64
     * @param userFace     用户的人脸信息，路径
     * @return 如果为同一个人返回true，否则返回false
     */
    public static boolean checkFace(String loginFaceImg, String userFace) {
        //将userFace读取程序，将其转换为base64
        try {
            userFace = getImgBase64(userFace);
            MatchRequest req1 = new MatchRequest(loginFaceImg, "BASE64");
            MatchRequest req2 = new MatchRequest(userFace, "BASE64");

            ArrayList<MatchRequest> requests = new ArrayList<MatchRequest>();
            requests.add(req1);
            requests.add(req2);
            //调用百度人脸对比的接口
            JSONObject resp = client.match(requests);
            System.out.println(resp);
            //获取对比接口
            JSONObject result = (JSONObject) resp.get("result");
            //从结果中获取分数
            double score = result.getDouble("score");
            if (score > 90) {
                return true;
            }

        } catch (Exception e) {
            e.printStackTrace();

        }
        return false;
    }



    public static String getImgBase64(String imgPath) throws IOException {
        //将图片的内容读取到程序
        InputStream in =new FileInputStream(imgPath);
        byte buffer[]=new byte[in.available()];
        //读取内容
        in.read(buffer);
        in.close();

        //再将读取到的内容转换为base64
        String imgBase64= Base64.encodeBase64String(buffer);
        return imgBase64;
    }
}
