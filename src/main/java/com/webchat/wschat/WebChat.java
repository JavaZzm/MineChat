package com.webchat.wschat;

import com.google.gson.Gson;
import com.webchat.entity.User;
import com.webchat.entity.WsMessage;
import com.webchat.mapper.MessageMapper;
import com.webchat.service.MessageService;
import com.webchat.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.server.standard.SpringConfigurator;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.*;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.ConcurrentMap;

// 为了注入service需要添加configurator = SpringConfigurator.class
@ServerEndpoint(value = "/ws/webchat/{userid}", configurator = SpringConfigurator.class)
public class WebChat {
    @Autowired
    private UserService userService;
    @Autowired
    private MessageService messageService;

    // 统计在线人数
    private static final ConcurrentMap<Integer, Session> sessionMap = new ConcurrentHashMap<Integer, Session>();
    private static final Gson gson = new Gson();
    // 当前用户
    private User user;
    // 用户列表
    private static List<User> users;

    @OnOpen
    public void open(Session session, @PathParam(value = "userid") int userid) {
        sessionMap.put(userid, session);
        userService.updateUserById(userid, 1); // 把该用户状态设置为上线。
        users = userService.allUser(); // 获取所有用户
        this.user = userService.getUserById(userid);
        if (this.user != null) {
            this.user.setPassword(null);
        }
        WsMessage wsMessage = new WsMessage();
        wsMessage.setUsers(this.users);
        wsMessage.setUserid(userid);
        broadcast(sessionMap, gson.toJson(wsMessage));
    }

    @OnMessage
    public void message(Session session, String jsonMessage) {
        WsMessage message = gson.fromJson(jsonMessage, WsMessage.class);

        if (message.getType() == 1) { // 消息类型为1时表示单聊
            message.setTime(new Timestamp(new Date().getTime()));
            messageService.saveMsg(message);
            Session s = sessionMap.get(message.getTo_id()); // 需要接收消息的用户
            message.setUsers(this.users);
            send(s, gson.toJson(message));

        } else {
            // 否则表示管理员发送系统消息
            message.setTime(new Timestamp(new Date().getTime()));
            messageService.saveMsg(message);
            message.setUsers(this.users);
            broadcast(sessionMap, gson.toJson(message));// 给用户发送系统消息
        }
    }

    @OnClose
    public void close(Session session) {
        this.sessionMap.remove(this.user.getId(), session);
        userService.updateUserById(this.user.getId(), 0);// 把该用户状态设置为离线。
        WsMessage wsMessage = new WsMessage();
        wsMessage.setTip(this.user.getNickname() + "退出聊天室");
        this.users = userService.allUser();
        wsMessage.setUsers(this.users);
        broadcast(sessionMap, gson.toJson(wsMessage)); // 通知所有人该用户已离线


    }

    public void broadcast(ConcurrentMap<Integer, Session> sessions, String msg) {
        Set<Map.Entry<Integer, Session>> entries = sessions.entrySet();
        for (Map.Entry<Integer, Session> me : entries) {
            try {
                me.getValue().getBasicRemote().sendText(msg);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }

    }

    public void send(Session session, String msg) {
        try {
            session.getBasicRemote().sendText(msg);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
