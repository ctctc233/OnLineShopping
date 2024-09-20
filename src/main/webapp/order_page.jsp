<%--
  Created by IntelliJ IDEA.
  User: fby
  Date: 2024/6/24
  Time: 下午10:47
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
    <title>订单管理</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="./css/goods_mange.css">
</head>
<body>
<div class="container">
    <h1>订单管理</h1>
    <table class="table">
        <thead>
        <tr>
            <th>订单号</th>
            <th>订单码</th>
            <th>创建时间</th>
            <th>总价</th>
            <th>是否支付</th>
            <th>是否发货</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="order" items="${placeOrder}">
            <tr>
                <td>${order.orderId}</td>
                <td>${order.orderCode}</td>
                <td>${order.date}</td>
                <td>${order.totalPrice}</td>
                <td>${order.isPay}</td>
                <td>${order.isSend}</td>
                <td>
                    <form action="./OrderMangeServlet" method="post">
                        <input type="hidden" name="orderCode" value="${order.orderCode}">
                        <input type="hidden" name="orderPayment" value="${order.isPay}">
                        <input type="hidden" name="orderTotalPrice" value="${order.totalPrice}">
                        <input type="submit" value="详情" class="btn btn-primary" name="btn">
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
                <li class="page-item ${offset == 1 ? 'disabled' : ''}">
                    <a class="page-link" href="OrderShowServlet?offset=${offset - 1}"
                       aria-label="Previous">
                        <span aria-hidden="true">«</span>
                    </a>
                </li>

                <!-- 分页数字 -->
                <c:forEach begin="1" end="${pageCount}" var="i">
                    <li class="page-item ${i == offset ? 'active' : ''}">
                        <a class="page-link" href="OrderShowServlet?offset=${i}">${i}</a>
                    </li>
                </c:forEach>

                <!-- 后一页 -->
                <li class="page-item ${offset == pageCount ? 'disabled' : ''}">
                    <a class="page-link" href="OrderShowServlet?offset=${offset + 1}"
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

