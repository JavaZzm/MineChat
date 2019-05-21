package com.webchat.realm;

import com.webchat.entity.Role;
import com.webchat.entity.User;
import com.webchat.service.UserService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthenticatingRealm;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.HashSet;

public class UserRealm extends AuthorizingRealm {
    @Autowired
    private UserService userService;


    // 授权
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        User user = (User) SecurityUtils.getSubject().getSession().getAttribute("USER");
        // 获取用户的角色
        Role role = user.getRole();
        HashSet<String> roles = new HashSet<>();
        roles.add(role.getName());
        return new SimpleAuthorizationInfo(roles);
    }

    // 认证
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        // 用户登录时传来的用户名
        String principal = (String) token.getPrincipal();

        // 通过用户名去数据库中查询用户是否存在
        User user = userService.getUserByUsername(principal);
        if (user == null) {
            // 如果用户不存在就抛异常，客户端提示时不建议提示“用户名不存在”，“密码错误”
            // 一般直接就提示“用户名或密码错误”
            throw new UnknownAccountException();
        }
        SecurityUtils.getSubject().getSession().setAttribute("USER", user);
        ByteSource bytes = ByteSource.Util.bytes(user.getUsername());
        SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(user.getUsername(), user.getPassword(), bytes, getName());
        return info;
    }
}
