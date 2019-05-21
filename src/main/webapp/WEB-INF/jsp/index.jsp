<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
    <link href="resources/layui/css/layui.css" charset="UTF-8">
    <script src="resources/js/jquery-1.9.1.min.js"></script>
    <script src="resources/layui/layui.all.js"></script>
    <style>
        ul li {
            list-style: none;
        }

        .friendList {
            width: 260px;
            height: 520px;
            border: 1px solid #D6D6D6;
            box-shadow: 0 0 10px #D6D6D6;
            float: right;
            float: bottom;
            background: url('../../resources/images/friend-list-bg.jpg') no-repeat 100% 100%;

        }

        .header-panel {
            background-color: #D6D6D6;
            height: 85px;
            width: 100%;
        }

        .friend-ul {
            margin: 10px;
            padding: 0;

        }

        .head-icon {
            width: 36px;
            height: 36px;
            border-radius: 100%;
        }

        .friend-div {
            display: flex;
            height: 70px;
            margin: 0 auto;
            align-items: center;
        }

        .layui-btn {
            display: inline-block;
            height: 38px;
            line-height: 38px;
            padding: 0 18px;
            background-color: #009688;
            color: #fff;
            white-space: nowrap;
            text-align: center;
            font-size: 14px;
            border: none;
            border-radius: 2px;
            cursor: pointer;
        }

        .triangle {
            width: 100%;
            height: 90%;
            padding-bottom: 10px;
            position: relative;
            transition: all 0.5s;
            overflow-x: hidden;
            overflow-y: auto;
        }

        .triangle ul {
            padding: 10px;
        }

        .friendListUl {
            display: none;
        }

        .triangle li {
            padding: 5px;
            margin-bottom: 10px;
        }

        .triangle li span {
            position: relative;
            border-radius: 7px;
            background-color: #a6e860;
            padding: 6px 10px 8px 10px;
            z-index: 1;
        }

        .triangle .textLeft span {
            background-color: #EDEDED;
        }

        .textRight {
            text-align: right;
        }

        .naviga {
            display: flex;
            justify-content: space-around;
            border-bottom: 1px solid #3F3F3F;
        }

        .naviga span {
            width: 50%;
            padding: 10px;
            cursor: pointer;
            text-align: center;

        }

        .active {
            border-bottom: 2px solid #1E9FFF;
            background-color: #1E9FFF;
            color: #FFFFFF;
        }

    </style>
</head>
<body>
<a href="/logout">注销</a>
&nbsp;&nbsp;&nbsp;
<shiro:hasRole name="系统管理员">
    <a href="#" style="text-decoration: none" onclick="openSendSysMsgWindow()">发送系统消息</a>
</shiro:hasRole>
<div id="friendList" class="friendList">
    <div class="header-panel" id="header-panel">

    </div>
    <div class="naviga" id="naviga"><span class="active">联系人</span><span>系统消息</span></div>
    <ul id="friend" class="friend-ul">

    </ul>
    <ul id="sysMsg" class="friend-ul friendListUl">
        <li style="border-bottom: 1px solid #D6D6D6; cursor: pointer;">
            <div class="friend-div" onclick="openSysMsg()">
                <img class="head-icon" src="resources/images/message.png">
                <span style="margin-left: 10px">系统消息</span>
            </div>
        </li>
    </ul>
</div>
</body>
<script>
    var currentUser = JSON.parse('${currentUser}')
    var userid = currentUser.id;
    var currentUserNickname = currentUser.nickname;
    var ws;
    $(function () {
        $('#naviga span').each(function (i, e) {
            $(this).click(function () {
                $(this).addClass('active').siblings().removeClass('active')

                $(".friend-ul").hide().eq($(this).index()).show();

            })
        });

        if ('WebSocket' in window) {
            ws = new WebSocket('ws://localhost:8080/ws/webchat/' + userid);
        } else if ('MozWebSocket' in window) {
            ws = new MozWebSocket(target);
        } else {
            alert('WebSocket is not supported by this browser.');
            return;
        }
        ws.onopen = function (ev) {
        }


        ws.onmessage = function (ev) {
            var data = JSON.parse(ev.data)
            friendList(data);
            if (data.type == 1) {
                $('#' + data.from_id + "output").empty();
                $('#' + data.to_id + "output").empty();
                var msgList = getMsgList(data.from_id);
                msgList.forEach(function (e) {
                    showReceiveMessage(e.from_id, e.to_id, e.msg, e.time, e.type)
                })
            }
        }

        ws.onclose = function (ev) {
            var data = JSON.parse(ev.data)
            layer.msg(data.tip)
        }


    })

    //  打开单人聊天窗口
    function openChatWindow(toId, nickname) {
        var chatWith = '<div style="width: 100%;height: 100%;overflow: hidden">'
            + '<div  class="triangle" > <ul id="' + toId + 'output"></ul>'
            + '</div>'
            +
            '<div style="width: 100%;height: 35px"><input id="' + toId +
            'messageText" type="text" style="width: 87%;height: 100%"> <button class="layui-btn" onclick="sendMsg(' + toId +
            ')">发送</button></div></div>';
        layer.open({
            type: 1,
            title: [nickname, 'font-family:Microsoft YaHei;font-size: 24px;height: 80px;'],
            content: chatWith,
            area: ['600px', '600px'],
            maxmin: true,
            shade: 0,
            id: toId,
            resize: true,
            zIndex: layer.zIndex,
            success: function (layero) {
            }
        });

        var msgList = getMsgList(toId);
        msgList.forEach(function (e) {
            showReceiveMessage(e.from_id, e.to_id, e.msg, e.time, e.type)
        })
    }

    // 将消息显示在聊天列表上
    function showReceiveMessage(from_id, to_id, msg, time, type) {
        time = getDateFull(time)
        if (from_id == userid) {
            var rightHtml = '<li class="textRight"><span>' + msg + '</span><img class="head-icon" src="resources/images/icon.jpg" alt=""></li>';
            $('#' + to_id + "output").append(rightHtml);

        } else {
            var leftHtml = '<li class="textLeft"><img class="head-icon" src="resources/images/icon.jpg" alt=""><span>' + msg +
                '</span></li>'
            $('#' + from_id + "output").append(leftHtml);
        }
        var scrollDiv = $('.triangle')
        scrollDiv.scrollTop(scrollDiv[0].scrollHeight);
    }

    function appendZero(s) {
        return ("00" + s).substr((s + "").length);
    } //补0函数

    //获取当前时间日期
    function getDateFull(time) {
        var date = new Date(time);
        var currentdate = date.getFullYear() + "-"
            + appendZero(date.getMonth() + 1) + "-"
            + appendZero(date.getDate()) + " "
            + appendZero(date.getHours()) + ":"
            + appendZero(date.getMinutes()) + ":"
            + appendZero(date.getSeconds());
        return currentdate;
    }

    // 发送消息
    function sendMsg(toId) {
        var msg = $("#" + toId + "messageText").val();
        var message = {
            from_id: userid,
            to_id: toId,
            msg: msg,
            type: 1
        }
        ws.send(JSON.stringify(message));
        uploadMineMsgList(toId, msg);
        $("#" + toId + "messageText").val("");
    }

    // 发消息时，本人的消息实时更新在消息列表上
    function uploadMineMsgList(toId, msg) {
        var rightHtml = '<li class="textRight"><span>' + msg + '</span><img class="head-icon" src="resources/images/icon.jpg" alt=""></li>';
        $('#' + toId + "output").append(rightHtml);
        var scrollDiv = $('.triangle')
        scrollDiv.scrollTop(scrollDiv[0].scrollHeight);
    }

    // 好友列表
    function friendList(data) {
        $('#friend').empty();
        $('#header-panel').empty();
        var online;
        var color;
        data.users.forEach(function (e) {
            if (e.online == 0) {
                online = '离线';
                color = '#666666';
            } else if (e.online == 1) {
                online = '在线';
                color = '#0000FF';
            }
            if (e.id != userid) {
                $('#friend').append('<li onclick="openChatWindow(' + e.id + ',\'' + e.nickname +
                    '\')" style="border-bottom: 1px solid #D6D6D6; cursor: pointer;"><div class="friend-div">' +
                    '<img class="head-icon" src="resources/images/icon.jpg">' +
                    '<span style="margin-left: 10px">' + e.nickname + '</span><span style="margin-left: 10px;color: ' + color + '">' +
                    online +
                    '</span>' +
                    '</div></li>');
            } else {
                $('#header-panel').append('<div class="friend-div"style="padding-left: 5px;">\n' +
                    '            <img class="head-icon" src="resources/images/icon.jpg" alt="">\n' +
                    '            <span style="margin-left: 10px">' + e.nickname + '</span>\n' +
                    '        </div>');
            }
        })
    }

    // 获取消息记录
    function getMsgList(toId) {
        var allMessages = null;
        $.ajax({
            async: false, //设置同步
            url: 'getMsgList',
            data: {'from_id': userid, "to_id": toId},
            type: 'POST',
            success: function (res) {
                allMessages = res.obj;
            }
        })

        return allMessages;
    }

    function openSendSysMsgWindow() {
        var chatWith = '<div style="width: 100%;height: 100%;overflow: hidden">' +
            '<div style="width: 100%;height: 35px">' +
            '<input id="sysMessageText" type="text" style="width: 87%;height: 100%"> <button class="layui-btn" onclick="sendSysMsg()">发送</button></div></div>';
        layer.open({
            type: 1,
            title: ['系统消息'],
            content: chatWith,
            area: ['600px', '100px'],
            shade: 0,
            id: '系统消息',
            resize: true,
            zIndex: layer.zIndex,
            success: function (layero) {
            }
        });
    }

    //发送系统消息
    function sendSysMsg() {
        var msg = $("#sysMessageText").val();
        var message = {
            msg: msg,
            type: 2
        }
        ws.send(JSON.stringify(message));
        $("#sysMessageText").val("");
    }

    // 获取系统消息
    function openSysMsg() {


        var chatWith = '<div style="width: 100%;height: 100%;overflow: hidden">'
            + '<div  class="triangle" > <ul id="sysmsglist"></ul>'
            + '</div></div>';
        layer.open({
            type: 1,
            title: ['系统消息', 'font-family:Microsoft YaHei;font-size: 24px;height: 80px;'],
            content: chatWith,
            area: ['600px', '600px'],
            maxmin: true,
            shade: 0,
            id: "系统消息",
            resize: true,
            zIndex: layer.zIndex,
            success: function (layero) {
            }
        });
        $.ajax({
            async: false, //设置同步
            url: 'getSysMsgList',
            type: 'GET',
            success: function (res) {
                if (res.obj) {
                    var msgList = res.obj;
                    msgList.forEach(function (e) {
                        var rightHtml = '<li class="textLeft"><img class="head-icon" src="resources/images/icon.jpg" alt=""><span>' + e.msg +
                            '</span></li>';
                        $('#sysmsglist').append(rightHtml);
                    })
                }
            }
        })
    }
</script>

</html>
