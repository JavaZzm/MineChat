<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
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

        .form_div {

        }
    </style>


</head>
<body>
<div class="container">
    <form class="layui-form" action="/doLogin" method="post" id="formAction">
        <div class="layui-form-item">
            <label class="layui-form-label">用户名</label>
            <div class="layui-input-inline">
                <input type="text" name="username" value="admin" required lay-verify="required" placeholder="请输入用户名" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">密码</label>
            <div class="layui-input-inline">
                <input type="password" name="password" value="admin" required lay-verify="required" placeholder="请输入密码" autocomplete="off"
                       class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <input type="button"  class="layui-btn" lay-submit lay-filter="formDemo" value="登录" id="loginBtn"/>
                <input type="button" id="toReg" class="layui-btn layui-btn-primary" value="去注册"></input>
            </div>
        </div>
    </form>
</div>
</body>
<script>
  $('#loginBtn').click(function () {
      var formData = $('#formAction').serialize();
      var url = $('#formAction').attr("action");
      $.ajax({
          url: url,
          data: formData,
          type: 'POST',
          success: function (res) {
              if (res.msg != "登录成功") {
                  layer.msg(res.msg)
              } else {
                  location.href = "/index";
              }
          },
          error: function (res) {
              layer.msg("未知错误！")
          }
      })

  })

    $('#toReg').click(function () {
        location.href = "/register";
    })
</script>
</html>
