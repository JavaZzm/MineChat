package com.webchat.entity;

import com.google.gson.Gson;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

public class WsMessage {
    private Integer id;
    private List<User> users;
    private String tip;
    private String msg;
    private Integer userid;
    private Integer to_id;
    private Integer from_id;
    private Timestamp time;
    private Integer type; //1 单聊    2群聊

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public List<User> getUsers() {
        return users;
    }

    public void setUsers(List<User> users) {
        this.users = users;
    }

    public String getTip() {
        return tip;
    }

    public void setTip(String tip) {
        this.tip = tip;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }


    public Integer getUserid() {
        return userid;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Integer getTo_id() {
        return to_id;
    }

    public void setTo_id(Integer to_id) {
        this.to_id = to_id;
    }

    public Integer getFrom_id() {
        return from_id;
    }

    public void setFrom_id(Integer from_id) {
        this.from_id = from_id;
    }

    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    @Override
    public String toString() {
        return "WsMessage{" +
                "id=" + id +
                ", users=" + users +
                ", tip='" + tip + '\'' +
                ", msg='" + msg + '\'' +
                ", userid=" + userid +
                ", to_id=" + to_id +
                ", from_id=" + from_id +
                ", time=" + time +
                ", type=" + type +
                '}';
    }
}
