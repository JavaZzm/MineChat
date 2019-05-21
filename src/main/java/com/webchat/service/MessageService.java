package com.webchat.service;

import com.webchat.entity.WsMessage;
import com.webchat.mapper.MessageMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MessageService {

    @Autowired
    private MessageMapper messageMapper;

    public int saveMsg(WsMessage wsMessage) {
        return messageMapper.saveMsg(wsMessage);
    }


    public List<WsMessage> listMessage(Integer from, Integer to, Integer type) {
        return messageMapper.listMessage(from, to, type);
    }
}
