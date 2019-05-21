package com.webchat.mapper;

import com.webchat.entity.WsMessage;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MessageMapper {

    int saveMsg(WsMessage wsMessage);

    /**
     * 根据发送人id和接收人id获取消息列表
     * @param from
     * @param to
     * @return
     */
    List<WsMessage> listMessage(@Param("from_id") Integer from, @Param("to_id") Integer to, @Param("type") Integer type);
}
