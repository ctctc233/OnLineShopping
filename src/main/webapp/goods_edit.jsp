<%--
  Created by IntelliJ IDEA.
  User: fby
  Date: 2024/6/23
  Time: 上午11:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>商品编辑界面</title>
    <link rel="stylesheet" href="./css/goods_edit.css">
</head>
<body>
<div class="container">
    <h2>编辑商品信息</h2>
    <div class="product-image">
        <img src="./img/${sessionScope.goods.image}" alt="商品图片">
    </div>
    <form id="editForm" method="post" action="./GoodsChangeServlet">
        <div class="form-group">
            <label for="productName">商品名称:</label>
            <input type="text" id="productName" name="goodsName" required value="${sessionScope.goods.name}">
        </div>
        <div class="form-group">
            <label for="productPrice">商品价格:</label>
            <input type="number" id="productPrice" name="goodsPrice" required value="${sessionScope.goods.price}">
        </div>
        <div class="form-group">
            <label for="productDescription">商品描述:</label>
            <textarea id="productDescription" name="goodsDetail" rows="4"
                      required>${sessionScope.goods.goodsDetail}</textarea>
        </div>
        <button type="submit" class="btn">保存</button>
    </form>
    <form action="./UploadServlet" method="post" enctype="multipart/form-data" id="avatarForm">
        <input type="file" id="avatarInput" name="upload" onchange="document.getElementById('avatarForm').submit()" style="display:none;" class="avatarInput">
        <input type="hidden" name="action" value="goodsImg">
        <label for="avatarInput" class="avatarLabel" >上传图片</label>
    </form>
</div>
</body>
</html>

