<%--
  Created by IntelliJ IDEA.
  User: fby
  Date: 2024/6/20
  Time: 下午10:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>修改账户成功</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .success-container {
            text-align: center;
            background: #fff;
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .success-icon {
            font-size: 50px;
            color: #4CAF50;
        }
        .success-message {
            font-size: 24px;
            margin: 20px 0 10px;
        }
        .success-description {
            font-size: 16px;
            color: #666;
        }
        .home-link {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
        }
        .home-link:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
<div class="success-container">
    <div class="success-icon">✔</div>
    <div class="success-message">账户修改成功！</div>
    <div class="success-description">您的账户信息已成功更新。</div>
    <a href="./home_page.jsp" class="home-link">返回首页</a>
</div>
</body>
</html>

