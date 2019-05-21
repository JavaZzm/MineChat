package com.webchat.controller;

import com.webchat.entity.RespBean;
import com.webchat.entity.User;
import com.webchat.service.UserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class UserController {
    @Autowired
    private UserService userService;
    @GetMapping("/login")
    public String login() {
        return "login";
    }

    @PostMapping("/doLogin")
    @ResponseBody
    public RespBean doLogin(User user, Model model) {
        String msg = null;
        if (user != null) {
            // 执行登录
            UsernamePasswordToken token = new UsernamePasswordToken(user.getUsername(), user.getPassword());
            Subject subject = SecurityUtils.getSubject();
            try {
                subject.login(token);
                msg = "登录成功";
            } catch (AuthenticationException e) {
                e.printStackTrace();
                msg = "用户名或密码错误";
            }
        }
        return RespBean.ok(msg);

    }

    @GetMapping("/register")
    public String register(){
        return "register";
    }

    @PostMapping("/doRegister")
    public String doRegister(User user){
        userService.saveUser(user);
        return "redirect:/index";
    }
}
