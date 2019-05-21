package com.webchat.controller;

import com.webchat.entity.RespBean;
import com.webchat.entity.WsMessage;
import com.webchat.mapper.MessageMapper;
import com.webchat.service.MessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class MessageController {

    @Autowired
    private MessageService messageService;

    @PostMapping("/getMsgList")
    public RespBean getMsgList(int from_id, int to_id) {
        List<WsMessage> messageList = messageService.listMessage(from_id, to_id, 1);
        return RespBean.ok(null, messageList);
    }

    @GetMapping("getSysMsgList")
    public RespBean getSysMsgList() {
        List<WsMessage> messageList = messageService.listMessage(null, null, 2);
        return RespBean.ok(null, messageList);
    }
}
