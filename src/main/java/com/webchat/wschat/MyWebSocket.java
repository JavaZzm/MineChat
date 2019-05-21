package com.webchat.wschat;

import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;

// 对应的就是浏览器中的 ws://localhost:8080/test，浏览器连接的就是这个/test这个地址
@ServerEndpoint("/test")
public class MyWebSocket {

    /**
     * 连接时触发
     *
     * @param session
     */
    @OnOpen
    public void open(Session session) {
        // session 可以表示当前连接的用户
        try {
            session.getBasicRemote().sendText("连接成功");
            System.out.println("连接成功");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 收到消息时触发
     *
     * @param session
     * @param msg     收到的消息
     */
    @OnMessage
    public void message(Session session, String msg) {
        System.out.println("收到浏览器的消息：" + msg);
        try {
            session.getBasicRemote().sendText("服务端返回的消息");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 连接关闭时触发
     *
     * @param session
     */
    public void close(Session session) {
        try {
            session.getBasicRemote().sendText("连接关闭");
            System.out.println("连接关闭");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
