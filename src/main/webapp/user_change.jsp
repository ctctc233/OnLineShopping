<%--
  Created by IntelliJ IDEA.
  User: fby
  Date: 2024/6/14
  Time: 上午1:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>Title</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="./css/user_change.css">
</head>
<body>
<div class="avatar-area"><img class="avatar1" src="./img/${sessionScope.user.userImg}"
                              alt="User Avatar"></div>
<div class="menu-area">
    <form action="./UserServlet" method="post">
        <input type="hidden" name="action" value="change">
        <label for="username">用户名：</label>
        <input type="text" id="username" name="username" value="${sessionScope.user.name}">
        <br>
        <br>
        <label for="password">密码：</label>
        <input type="password" id="password" name="password">
        <br>
        <br>
        <label for="confirm_password">确认密码：</label>
        <input type="password" id="confirm_password" name="confirm_password">
        <br>
        <br>
        <input type="submit" value="提交" class="btn_submit">
        <br>
        <br>
        <input type="submit" value="退出登录" class="btn_logout" onclick="logout()">
        <br>
        <br>
    </form>
    <form action="./UploadServlet" method="post" enctype="multipart/form-data" id="avatarForm">
        <input type="file" id="avatarInput" name="upload" onchange="document.getElementById('avatarForm').submit()" style="display:none;" class="avatarInput">
        <input type="hidden" name="action" value="avatar">
        <label for="avatarInput" class="avatarLabel" >上传头像</label>
    </form>
    <script>
        // 在iframe中执行
        function logout() {
            window.top.location.href = 'login.html';
        }
    </script>
</div>
</body>
</html>
