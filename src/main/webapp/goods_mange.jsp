<%--
  Created by IntelliJ IDEA.
  User: fby
  Date: 2024/6/23
  Time: 上午9:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>Title</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>商品管理</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="./css/goods_mange.css">
    <style>
        .input-group {
            margin-left: 100px;
            height: 38px;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>商品管理</h1>
    <div class="mb-3 d-flex justify-content-between">
        <form action="./GoodsMangeServlet" method="post" class="input-group">
            <input type="text" name="searchKeyword" class="form-control" placeholder="输入商品名称搜索">
            <button type="submit" class="btn btn-primary">搜索</button>
        </form>
        <div class="input-group">
            <a href="./goods_add.jsp" class="btn btn-success">新增商品</a>
        </div>
    </div>
    <table class="table">
        <thead>
        <tr>
            <th>ID</th>
            <th>商品名称</th>
            <th>商品介绍</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="goods" items="${goodsList}">
            <tr>
                <td>${goods.id}</td>
                <td>${goods.name}</td>
                <td>${goods.goodsDetail}</td>
                <td>
                    <form action="./GoodsEditServlet" method="post">
                        <input type="hidden" name="id" value="${goods.id}">
                        <input type="submit" value="编辑" class="btn btn-primary" name="btn">
                        <input type="submit" value="删除" class="btn btn-danger" name="btn">
                    </form>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div>
        <nav aria-label="Page navigation">
            <ul class="pagination">
                <!-- 前一页 -->
                <li class="page-item ${currentPage == 1 ? 'disabled' : ''}">
                    <a class="page-link" href="GoodsMangeServlet?currentPage=${currentPage - 1}"
                       aria-label="Previous">
                        <span aria-hidden="true">«</span>
                    </a>
                </li>

                <!-- 分页数字 -->
                <c:forEach begin="1" end="${pageCount}" var="i">
                    <li class="page-item ${i == currentPage ? 'active' : ''}">
                        <a class="page-link" href="GoodsMangeServlet?currentPage=${i}">${i}</a>
                    </li>
                </c:forEach>

                <!-- 后一页 -->
                <li class="page-item ${currentPage == pageCount ? 'disabled' : ''}">
                    <a class="page-link" href="GoodsMangeServlet?currentPage=${currentPage + 1}"
                       aria-label="Next">
                        <span aria-hidden="true">»</span>
                    </a>
                </li>
            </ul>
        </nav>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
