<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>支付确认</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f4f4f4;
        }
        .container {
            background: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            max-width: 600px;
            margin: auto;
        }
        .product-info {
            margin-bottom: 20px;
        }
        .product-info h2 {
            margin: 0 0 10px;
        }
        .product-info p {
            margin: 0;
        }
        .payment-options {
            margin-bottom: 20px;
        }
        .payment-options label {
            display: block;
            margin-bottom: 10px;
        }
        .confirm-btn {
            display: inline-block;
            padding: 10px 20px;
            font-size: 16px;
            color: #fff;
            background-color: #007bff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .confirm-btn:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="product-info">
        <p>价格: ¥${sessionScope.orderTotalPrice}</p>
    </div>
    <div class="payment-options">
        <h3>选择支付方式</h3>
        <label>
            <input type="radio" name="payment" value="alipay" checked> 支付宝
        </label>
        <label>
            <input type="radio" name="payment" value="wechat"> 微信支付
        </label>
        <label>
            <input type="radio" name="payment" value="credit_card"> 信用卡
        </label>
    </div>
    <form action="./OrderPayServlet" method="post">
        <input type="hidden" name="orderCode" value="${orderCode}">
        <button type="submit" class="confirm-btn" onclick="confirmPayment()">确认支付</button>
    </form>

</div>

<script>
    function confirmPayment() {
        const paymentMethodElement = document.querySelector('input[name="payment"]:checked');
        if (!paymentMethodElement) {
            alert('请选择支付方式！');
            return;
        }
        const paymentMethod = paymentMethodElement.value;
        const confirmed = confirm(`你选择了` + paymentMethod + `支付方式，确认支付吗？`);
        if (confirmed) {
            // 这里可以添加实际的支付逻辑，例如调用支付API
            alert('支付成功！');
        } else {
            alert('支付已取消。');
        }
    }
</script>

</body>
</html>
