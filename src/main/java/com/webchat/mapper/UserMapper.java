package com.webchat.mapper;

import com.webchat.entity.Role;
import com.webchat.entity.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Set;

public interface UserMapper {
    int saveUser(User user);

    User getUserByUsername(String username);


    List<User> allUser();

    User getUserById(int id);

    Role getRoleByUserId(int id);

    /**
     * 保存用户角色关联表
     *
     * @param uid 用户id
     * @param rid 角色id
     * @return
     */
    int saveRoleUser(@Param("uid") int uid, @Param("rid") int rid);

    /**
     * 更新用户在线状态，1 在线    0离线
     *
     * @param id
     * @param online
     * @return
     */
    int updateUserById(@Param("id") Integer id, @Param("online") Integer online);
}
