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
    <title>购物车管理</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="./css/goods_mange.css">
</head>
<body>
<div class="container">
    <h1>购物车管理</h1>
    <table class="table">
        <thead>
        <tr>
            <th></th>
            <th>商品ID</th>
            <th>商品名称</th>
            <th>商品介绍</th>
            <th>商品价格</th>
            <th>商品数量</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="cart" items="${sessionScope.cartList}">
            <tr>
                <td><input type="checkbox" name="selectedGoods" value="${cart.spGoodsId}"></td>
                <td>${cart.spGoodsId}</td>
                <td>${cart.spGoods.name}</td>
                <td>${cart.spGoods.goodsDetail}</td>
                <td>${cart.spGoods.price}</td>
                <td>
                    <input type="number" name="quantity" value="1" min="1" class="form-control">
                </td>
                <td>
                    <form action="./SpCartDelServlet" method="post">
                        <input type="hidden" name="id" value="${cart.spCartId}">
                        <input type="submit" value="删除" class="btn btn-danger" name="btn">
                    </form>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <div class="d-flex justify-content-end">
        <button type="button" class="btn btn-primary" onclick="getSelectedGoods()">支付</button>
    </div>
    <div>
        <nav aria-label="Page navigation">
            <ul class="pagination">
                <!-- 前一页 -->
                <li class="page-item ${offset == 1 ? 'disabled' : ''}">
                    <a class="page-link" href="SpCartShowServlet?offset=${offset - 1}"
                       aria-label="Previous">
                        <span aria-hidden="true">«</span>
                    </a>
                </li>

                <!-- 分页数字 -->
                <c:forEach begin="1" end="${pageCount}" var="i">
                    <li class="page-item ${i == offset ? 'active' : ''}">
                        <a class="page-link" href="SpCartShowServlet?offset=${i}">${i}</a>
                    </li>
                </c:forEach>

                <!-- 后一页 -->
                <li class="page-item ${offset == pageCount ? 'disabled' : ''}">
                    <a class="page-link" href="SpCartShowServlet?offset=${offset + 1}"
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
    function getSelectedGoods() {
        // 获取所有复选框
        const checkboxes = document.querySelectorAll('input[name="selectedGoods"]:checked');
        const selectedValues = [];

        // 遍历复选框，收集选中的值
        checkboxes.forEach(checkbox => {
            const goodsId = checkbox.value;
            const quantityInput = checkbox.closest('tr').querySelector('input[name="quantity"]');
            const quantity = quantityInput ? quantityInput.value : 1;
            selectedValues.push({goodsId, quantity});
        });

        if (selectedValues.length > 0) {
            // 将选中的值提交到服务器
            const form = document.createElement('form');
            form.method = 'POST';
            form.action = './PaymentServlet';

            selectedValues.forEach(item => {
                const goodsIdInput = document.createElement('input');
                goodsIdInput.type = 'hidden';
                goodsIdInput.name = 'selectedGoods';
                goodsIdInput.value = item.goodsId;
                form.appendChild(goodsIdInput);

                const quantityInput = document.createElement('input');
                quantityInput.type = 'hidden';
                quantityInput.name = 'quantity';
                quantityInput.value = item.quantity;
                form.appendChild(quantityInput);
            });

            document.body.appendChild(form);
            form.submit();
        } else {
            alert('请选择一个或多个商品进行支付');
        }
    }
</script>
</body>
</html>
