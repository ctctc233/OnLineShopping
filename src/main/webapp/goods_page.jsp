<%--
  Created by IntelliJ IDEA.
  User: fby
  Date: 2024/6/22
  Time: 上午9:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>商品首页</title>
    <link rel="stylesheet" href="./css/goods_page.css">
</head>
<body>
<!--建立一个div标签并使用ID属性标签类进行唯一标示操作-->
<div id="box">
    <ul>
        <!--ul为无序列表标签,li标签对象用于进行项目列表的定义操作,即在当前项目对象之前添加一个小圆点-->
        <li class="img-li"><img src="./img/OIP-C.jpg" width="100%" height="100%" alt="错误"></li>
        <li class="img-li"><img src="./img/下载.jpg" width="100%" height="100%" alt="错误"></li>
        <li class="img-li"><img src="./img/下载 (1).jpg" width="100%" height="100%" alt="错误"></li>
        <li class="img-li"><img src="./img/OIP-C.jpg" width="100%" height="100%" alt="错误"></li>
    </ul>
    <!--在当前div当中嵌套两个div来作为图片切换的按钮-->
    <div id="previous" class="img-button">《</div>
    <div id="next" class="img-button">》</div>
    <!--div盒子模型当中建立两个按钮标签来进行图片的切换结束-->

    <!-- 建立轮播图按钮对象开始 -->
    <ul class="button-ul"><!-- ul为无序列表标签 -->
        <li class="button-li" id="one"></li>
        <li class="button-li" id="two"></li>
        <li class="button-li" id="three"></li>
        <li class="button-li" id="four"></li>
    </ul>
    <!-- 建立轮播图按钮对象结束 -->
</div>
<div class="search-container">
    <form action="./DetailServlet" method="post">
        <input type="text" id="search-input" placeholder="输入商品ID" name="id">
        <button id="search-button">查询</button>
    </form>
</div>
<div class="product-section">
    <div class="product-card">
        <img src="./img/天选.jpg" alt="Product 1">
        <h3>天选3</h3>
        <p>价格: $6500</p>
        <form action="./DetailServlet" method="post">
            <input type="hidden" name="id" value="1">
            <button id="detail-button-1">查看详情</button>
        </form>
    </div>
    <div class="product-card">
        <img src="./img/智能手机.jpg" alt="Product 2">
        <h3>智能手机</h3>
        <p>价格: $3200</p>
        <form action="./DetailServlet" method="post">
            <input type="hidden" name="id" value="2">
            <button id="detail-button-2">查看详情</button>
        </form>
    </div>
    <div class="product-card">
        <img src="./img/台式电脑.jpg" alt="Product 3">
        <h3>台式电脑</h3>
        <p>价格: $9900</p>
        <form action="./DetailServlet" method="post">
            <input type="hidden" name="id" value="4">
            <button id="detail-button-3">查看详情</button>
        </form>
    </div>
</div>
<script type="text/javascript">
    var imgli = document.getElementsByClassName("img-li");/*对图片所在的li无序列表标签对象进行获取操作*/
    /*对图片当中进行图片切换的两个按钮对象进行获取操作*/
    var next = document.getElementById("next");
    var previous = document.getElementById("previous");
    var img_index = 0;/*设置一个索引变量,用于记录当前所显示的图片的索引号*/
    /*建立新旧两个指针变量对象用于分别记录当前所显示的图片对象和下一个将要进行显示的图片对象*/
    var oldLi = imgli[0];/*页面一开始所显示的图片为索引值为0的图片*/
    var newLi;/*声明一个新的标签对象列表*/
    var img_timer;/*用于对图片进行自动播放时的计时器进行唯一标示*/
    var box = document.getElementById("box");/*获取整个盒子对象*/


    /*对图片下方的四个小圆点按钮对象进行获取操作*/
    var one = document.getElementById("one");
    var two = document.getElementById("two");
    var three = document.getElementById("three");
    var four = document.getElementById("four");
    /*next.onclick是指当点击next标签对象当中的元素时将会触发的事件函数*/
    next.onclick = function nextClick() {
        img_index++;
        if (img_index == imgli.length)
            img_index = 0;
        oldLi.style.opacity = 0;
        newLi = imgli[img_index];
        newLi.style.opacity = 1;
        oldLi = newLi;
    }
    previous.onclick = function previousClick() {
        img_index--;
        if (img_index < 0)
            img_index = imgli.length - 1;
        oldLi.style.opacity = 0;
        newLi = imgli[img_index];
        newLi.style.opacity = 1;
        oldLi = newLi;
    }

    /*建立一个播放函数来实现对imgli标签对象当中的图片的自动播放操作*/
    function play() {/* setInterval() 方法重复调用一个函数或执行一个代码段，在每次调用之间具有固定的时间延迟。该方法会返回一
个唯一标示当前计时器方法的ID值*/
        timer = window.setInterval(
            function () {
                next.onclick()
            }
            , 5000)
    }

    play();

    /*用于停止图片的自动播放操作*/
    function stop() {
        clearInterval(timer);/*根据计时器的ID值来清除指定的计时器对象，使得当前的图片停止自动播放操作*/
    }

    box.onmouseover = stop;/*当鼠标移动到盒子的上方的时候将会进行事件的触发然后调用stop函数来执行自动播放的
停止操作*/
    box.onmouseout = play;/*当鼠标移出盒子对象的时候将会重新的调用play方法来再次进行图片的轮播操作*/

    /*当鼠标点击第一个小圆点对象所在标签时，将会触发该方法，然后改变盒子当中对应图片的透明度*/
    one.onclick = function oneClick() {
        oldLi.style.opacity = 0;
        newLi = imgli[0];
        newLi.style.opacity = 1;
        oldLi = newLi;
    }
    one.onmouseover = one.onclick;
    /*点击第二个小圆点时触发的方法*/
    two.onclick = function twoClick() {
        oldLi.style.opacity = 0;
        newLi = imgli[1];
        newLi.style.opacity = 1;
        oldLi = newLi;
    }
    two.onmouseover = two.onclick;

    /*点击第三个小圆点触发方法来进行图片的显示*/
    three.onclick = function threeClick() {
        oldLi.style.opacity = 0;
        newLi = imgli[2];
        newLi.style.opacity = 1;
        oldLi = newLi;
    }
    three.onmouseover = three.onclick;

    /*点击第四个小圆点来进行对应事件的触发操作*/
    four.onclick = function fourClick() {
        oldLi.style.opacity = 0;
        newLi = imgli[3];
        newLi.style.opacity = 1;
        oldLi = newLi;
    }
    four.onmouseover = four.onclick;

</script>
</body>
</html>
