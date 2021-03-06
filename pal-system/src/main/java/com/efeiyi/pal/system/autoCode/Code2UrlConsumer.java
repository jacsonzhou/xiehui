package com.efeiyi.pal.system.autoCode;

import com.alibaba.fastjson.JSONObject;
import com.ming800.core.util.JsonUtil;
import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpMethod;
import org.apache.commons.httpclient.methods.GetMethod;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.util.EntityUtils;

import java.io.*;
import java.util.Map;
import java.util.concurrent.ConcurrentLinkedQueue;

/**
 * Created by Administrator on 2015/8/19.
 */
public class Code2UrlConsumer implements Runnable {

    HttpClient httpclient = new HttpClient();
    DefaultHttpClient httpClient = new DefaultHttpClient();
    static transient String accessToken;
    HttpPost method;
    JSONObject jsonObject = new JSONObject();
    HttpResponse response;
    StringEntity stringEntity;
    private Url2FileConsumer url2FileConsumer;

    //true:永久二维码模式；false：临时二维码模式
//    private boolean runningModel = false;
    private boolean runningModel = true;

    public Code2UrlConsumer(Url2FileConsumer url2FileConsumer) {
        this.url2FileConsumer = url2FileConsumer;
    }

    public void run() {


        if (Code2UrlConsumer.accessToken == null) {
            synchronized (url2FileConsumer.getCodeList()) {
                if (Code2UrlConsumer.accessToken == null) {
                    Code2UrlConsumer.accessToken = getAccessToken();
                }
            }
        }
        method = new HttpPost("https://api.weixin.qq.com/cgi-bin/qrcode/create?access_token=" + accessToken);

        //永久/临时二维码
        if (runningModel) {
            //永久
            preparePermanentJsonObject();
        } else {
            //临时
            prepareTempJsonObject();
        }

        while (true) {
            if (url2FileConsumer.isStart()) {
                System.out.println(Thread.currentThread().getId() + ":退出");
                break;
            }
            if (url2FileConsumer.getCodeList().size() > 0) {
                String code = url2FileConsumer.getCodeList().remove();
                String url = "";
                try {
                    url = getTicketUrl(code);
                } catch (UnsupportedEncodingException e) {
                    e.printStackTrace();
                    return;
                }
                url2FileConsumer.getCodeUrlMap().put(code, url);
//                synchronized (Url2FileConsumer.codeUrlMap) {
//                    Url2FileConsumer.codeUrlMap.notifyAll();
//                }
//                    System.out.println(Thread.currentThread().getId() + ":      " + ticket);
//                    System.out.println(Thread.currentThread().getId() + ":      " + url);
//                    consumer.getPic(ticket, consumer.filePath + code + ".jpg");
            } else {
                try {
                    synchronized (url2FileConsumer.getCodeList()) {
                        url2FileConsumer.getCodeList().notifyAll();
                        url2FileConsumer.getCodeList().wait();
                    }
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
        }

    }

    private void prepareTempJsonObject() {
        jsonObject.put("expire_seconds", "3000");
        jsonObject.put("action_name", "QR_SCENE");

        JSONObject sceneId = new JSONObject();
        JSONObject scene = new JSONObject();
        scene.put("scene", sceneId);
        jsonObject.put("action_info", scene);
    }

    private void preparePermanentJsonObject() {
        jsonObject.put("action_name", "QR_LIMIT_STR_SCENE");

        JSONObject sceneId = new JSONObject();
        JSONObject scene = new JSONObject();
        scene.put("scene", sceneId);
        jsonObject.put("action_info", scene);
    }

    private String getAccessToken() {

//诚品宝服务号
        HttpMethod method = new GetMethod("https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=wx2db1e25ab3dac836&secret=a39099dfb48bb588c1fc7b0d538d3a2b");
        //电商服务号
//        HttpMethod method = new GetMethod("https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=wx7f6aa253b75466dd&secret=04928de13ab23dca159d235ba6dc19ea");
        //订阅号没法生成带参二维码，坑了几个小时
//        HttpMethod method = new GetMethod("https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=wxa58e5140a4bdb7d2&secret=4d9dc76cda0c35255dcbcf4490e41135");

        try {
            httpclient.executeMethod(method);
            String accessToken = method.getResponseBodyAsString();
            System.out.println(method.getResponseBodyAsString());
            method.releaseConnection();
            Map<?, ?> ipAddressMap = JsonUtil.parseJsonStringToMap(accessToken);
            return (String) ipAddressMap.get("access_token");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "";
    }

    private String getTicket(String code) throws IOException {

        //写入二维码Json参数code
        if (runningModel) {
            //永久
            ((JSONObject) ((JSONObject) jsonObject.get("action_info")).get("scene")).put("scene_str", code);
        } else {
            //临时
            ((JSONObject) ((JSONObject) jsonObject.get("action_info")).get("scene")).put("scene_id", code);
        }

        stringEntity = new StringEntity(jsonObject.toJSONString(), "utf-8");
        stringEntity.setContentType("application/json");
        method.setEntity(stringEntity);
        response = httpClient.execute(method);
        String json = EntityUtils.toString(response.getEntity());
        String ticket = (String) JSONObject.parseObject(json).get("ticket");
        if (ticket == null) {
            Code2UrlConsumer.accessToken = getAccessToken();
            ticket = getTicket(code);
        }
        return ticket;
    }

    private String getTicketUrl(String code) throws UnsupportedEncodingException {

        if (runningModel) {
            ((JSONObject) ((JSONObject) jsonObject.get("action_info")).get("scene")).put("scene_str", code);
        } else {
            ((JSONObject) ((JSONObject) jsonObject.get("action_info")).get("scene")).put("scene_id", code);
        }
        stringEntity = new StringEntity(jsonObject.toJSONString(), "utf-8");
        stringEntity.setContentType("application/json");
        method.setEntity(stringEntity);
        String url = "";
        try {
            response = httpClient.execute(method);
            String json = EntityUtils.toString(response.getEntity());
            url = (String) JSONObject.parseObject(json).get("url");
//            url = "*******************";
            if (url == null) {
                url = getTicketUrl(code);
            }
        } catch (Throwable e) {
            e.printStackTrace();
            System.out.println("重试...................");
            url = getTicketUrl(code);
        }
        return url;
    }

    private void getPic(String ticket, String fileName) throws IOException {

        HttpMethod method = new GetMethod("https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket=" + ticket);
        httpclient.executeMethod(method);
        InputStream is = method.getResponseBodyAsStream();
        OutputStream os = new FileOutputStream(new File(fileName));
        byte[] b = new byte[1];
        while (is.read(b) != -1) {
            os.write(b);
        }
        os.flush();
        os.close();
    }

}
