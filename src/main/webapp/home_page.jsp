<%--
  Created by IntelliJ IDEA.
  User: fby
  Date: 2024/6/12
  Time: 下午8:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>Title</title>
    <head>
        <meta charset="UTF-8">
        <title>Title</title>
        <link rel="stylesheet" href="./css/menu.css">
    </head>
<body>
<div class="s-layout">
    <!-- Sidebar -->
    <div class="s-layout__sidebar">
        <a class="s-sidebar__trigger" href="#0">
            <i class="fa fa-bars"></i>
        </a>

        <nav class="s-sidebar__nav">
            <h2 class="s-sidebar__heading">欢迎回来</h2>
            <div><img class="avatar" src="./img/${sessionScope.user.userImg}" alt="User Avatar"></div>
            <div class="username"> ${sessionScope.user.name} </div>
            <ul class="s-sidebar__list">
                <li>
                    <a class="s-sidebar__nav-link" href="javascript:void(0)" onclick="loadGoodsPage()">
                        <i class="fa fa-home"></i><em>商品列表</em>
                    </a>
                </li>
                <c:if test="${sessionScope.user.role == 0}">
                    <li>
                        <a class="s-sidebar__nav-link" href="javascript:void(0)" onclick="loadGoodsManagementPage()">
                            <i class="fa fa-user"></i><em>商品管理</em>
                        </a>
                    </li>
                </c:if>
                <li>
                    <a class="s-sidebar__nav-link" href="javascript:void(0)" onclick="loadCardManagementPage()">
                        <i class="fa fa-camera"></i><em>购物车</em>
                    </a>
                </li>
                <li>
                    <a class="s-sidebar__nav-link" href="javascript:void(0)" onclick="loadOrderPage()">
                        <i class="fa fa-home"></i><em>查看订单</em>
                    </a>
                </li>
                <li>
                    <a class="s-sidebar__nav-link" href="javascript:void(0)" onclick="loadUserPage()">
                        <i class="fa fa-home"></i><em>我的</em>
                    </a>
                </li>
            </ul>
        </nav>
    </div>
    <div class="iframe">
        <iframe id="iframe1" style="width: 100%; height: 100%;"></iframe>
        <iframe id="iframe2" style="width: 100%; height: 100%; display: none;"></iframe>
        <iframe id="iframe3" style="width: 100%; height: 100%; display: none;"></iframe>
        <iframe id="iframe4" style="width: 100%; height: 100%; display: none;"></iframe>
        <iframe id="iframe5" style="width: 100%; height: 100%; display: none;"></iframe>
    </div>
</div>

<script>
    function loadGoodsPage() {
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                console.log(this.responseText);
            }
        };
        xhttp.open("POST", "#", true);
        xhttp.send();
        document.getElementById('iframe1').src = './goods_page.jsp';
        document.getElementById('iframe1').style.display = 'block';
        document.getElementById('iframe2').style.display = 'none';
        document.getElementById('iframe3').style.display = 'none';
        document.getElementById('iframe4').style.display = 'none';
        document.getElementById('iframe5').style.display = 'none';
    }

    function loadGoodsManagementPage() {
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function() {
            if (this.readyState == 4 && this.status == 200) {
                console.log(this.responseText);
            }
        };
        xhttp.open("POST", "#", true);
        xhttp.send();
        document.getElementById('iframe2').src = './GoodsMangeServlet';
        document.getElementById('iframe1').style.display = 'none';
        document.getElementById('iframe2').style.display = 'block';
        document.getElementById('iframe3').style.display = 'none';
        document.getElementById('iframe4').style.display = 'none';
        document.getElementById('iframe5').style.display = 'none';
    }

    function loadCardManagementPage() {
        document.getElementById('iframe3').src = './SpCartShowServlet';
        document.getElementById('iframe1').style.display = 'none';
        document.getElementById('iframe2').style.display = 'none';
        document.getElementById('iframe3').style.display = 'block';
        document.getElementById('iframe4').style.display = 'none';
        document.getElementById('iframe5').style.display = 'none';
    }

    function loadOrderPage() {
        document.getElementById('iframe4').src = './OrderShowServlet';
        document.getElementById('iframe1').style.display = 'none';
        document.getElementById('iframe2').style.display = 'none';
        document.getElementById('iframe3').style.display = 'none';
        document.getElementById('iframe4').style.display = 'block';
        document.getElementById('iframe5').style.display = 'none';
    }

    function loadUserPage() {
        document.getElementById('iframe5').src = './user_change.jsp';
        document.getElementById('iframe1').style.display = 'none';
        document.getElementById('iframe2').style.display = 'none';
        document.getElementById('iframe3').style.display = 'none';
        document.getElementById('iframe4').style.display = 'none';
        document.getElementById('iframe5').style.display = 'block';
    }
</script>
</body>
</html>
