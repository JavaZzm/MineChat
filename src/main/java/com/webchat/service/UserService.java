package com.webchat.service;

import com.webchat.entity.User;
import com.webchat.mapper.UserMapper;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.net.URI;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;
import java.util.Set;

@Service
public class UserService {
    @Autowired
    private UserMapper userMapper;

    public int saveUser(User user) {

        // 注册时给密码加密和加盐
        ByteSource bytes = ByteSource.Util.bytes(user.getUsername());
        SimpleHash simpleHash = new SimpleHash("SHA-512", user.getPassword(), bytes, 1024);
        user.setNickname(user.getUsername());
        user.setPassword(simpleHash.toString());
        user.setRegTime(new Timestamp(new Date().getTime()));
        user.setEnabled(true);
        user.setOnline(0);
        int i = userMapper.saveUser(user);
        // 用户注册成功就赋予角色
        userMapper.saveRoleUser(user.getId(), 2);
        return i;
    }

    public User getUserById(int id) {
        return userMapper.getUserById(id);
    }

    public User getUserByUsername(String username) {
        return userMapper.getUserByUsername(username);
    }

    public List<User> allUser() {
        return userMapper.allUser();
    }

    public int updateUserById(Integer id, Integer online) {
        return userMapper.updateUserById(id, online);
    }

}
