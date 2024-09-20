<%--
  Created by IntelliJ IDEA.
  User: fby
  Date: 2024/6/22
  Time: 上午11:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>商品详情</title>
    <link rel="stylesheet" href="./css/goods_detail.css">
</head>
<body>
<div class="product-detail">
    <div class="product-image">
        <img src="./img/${goods.image}" alt="商品图片">
    </div>
    <div class="product-info">
        <form action="./SpCartAddServlet" method="post">
            <h1 class="product-name">${goods.name}</h1>
            <p class="product-description">${goods.goodsDetail}</p>
            <p class="product-price">价格: ¥${goods.price}</p>
            <input type="hidden" name="goodsId" value="${goods.id}">
            <button class="add-to-cart" type="submit">加入购物车</button>
        </form>
    </div>
</div>
</body>
</html>
