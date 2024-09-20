<%--
  Created by IntelliJ IDEA.
  User: fby
  Date: 2024/6/25
  Time: 上午12:52
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
    <h1>订单详情</h1>
    <table class="table">
        <thead>
        <tr>
            <th>商品名称</th>
            <th>商品数量</th>
            <th>商品单价</th>
            <th>商品描述</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="order" items="${orderDetail}">
            <tr>
                <td>${order.goods.name}</td>
                <td>${order.goodsNum}</td>
                <td>${order.goods.price}</td>
                <td>${order.goods.goodsDetail}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div class="d-flex justify-content-end">
        <c:if test="${sessionScope.role == '1'}">
            <c:if test="${orderPayment == false}">
                <form action="./PayDataServlet" method="post">
                    <input type="hidden" name="orderCode" value="${orderCode}">
                    <button type="submit" class="btn btn-primary" onclick="redirectToPage()">支付</button>
                </form>
            </c:if>
        </c:if>
        <c:if test="${sessionScope.role == '0'}">
            <form action="./OrderMangeServlet" method="post">
                <input type="hidden" name="orderCode" value="${orderCode}">
                <input type="submit" value="发货" class="btn btn-success" name="btn">
            </form>
        </c:if>
    </div>
    <div>
        <nav aria-label="Page navigation">
            <ul class="pagination">
                <!-- 前一页 -->
                <li class="page-item ${offset == 1 ? 'disabled' : ''}">
                    <a class="page-link" href="OrderMangeServlet?offset=${offset - 1}"
                       aria-label="Previous">
                        <span aria-hidden="true">«</span>
                    </a>
                </li>

                <!-- 分页数字 -->
                <c:forEach begin="1" end="${pageCount}" var="i">
                    <li class="page-item ${i == offset ? 'active' : ''}">
                        <a class="page-link" href="OrderMangeServlet?offset=${i}">${i}</a>
                    </li>
                </c:forEach>

                <!-- 后一页 -->
                <li class="page-item ${offset == pageCount ? 'disabled' : ''}">
                    <a class="page-link" href="OrderMangeServlet?offset=${offset + 1}"
                       aria-label="Next">
                        <span aria-hidden="true">»</span>
                    </a>
                </li>
            </ul>
        </nav>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script>
    function redirectToPage() {
        window.location.href = 'pay_confirm.jsp';
    }
</script>
</body>
</html>
