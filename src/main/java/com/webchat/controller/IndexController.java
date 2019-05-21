package com.webchat.controller;

import com.google.gson.Gson;
import com.webchat.entity.User;
import com.webchat.utils.UserUtil;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController {
    @GetMapping("/index")
    public String index(Model model) {
        User currentUser = UserUtil.getCurrentUser();
        currentUser.setPassword(null);
        model.addAttribute("currentUser",new Gson().toJson(currentUser) );
        return "index";
    }
}
