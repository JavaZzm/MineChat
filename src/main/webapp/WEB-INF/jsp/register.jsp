<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册</title>
    <link rel="stylesheet" type="text/css" href="resources/layui/css/layui.css" charset="utf-8"/>
    <script src="resources/js/jquery-1.9.1.min.js"></script>
    <script src="resources/layui/layui.all.js"></script>
    <style>
        .container {
            display: flex;
            margin: 0 auto;
            width: 100%;
            align-items: center;
            justify-content: center;
            height: 500px;
        }

    </style>
</head>
<body>
<div class="container">
    <form class="layui-form" action="/doRegister" method="post">
        <div class="layui-form-item">
            <label class="layui-form-label">用户名</label>
            <div class="layui-input-inline">
                <input type="text" name="username" required lay-verify="required" placeholder="请输入用户名" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">密码</label>
            <div class="layui-input-inline">
                <input type="password" name="password" required lay-verify="required" placeholder="请输入密码" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button type="submit"  class="layui-btn" lay-submit lay-filter="formDemo">注册</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>
</body>
</html>
