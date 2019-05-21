package com.webchat.utils;

import com.webchat.entity.User;
import org.apache.shiro.SecurityUtils;

public class UserUtil {
    public static User getCurrentUser() {
        return ((User) SecurityUtils.getSubject().getSession().getAttribute("USER"));
    }
}
