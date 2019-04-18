<%--
  Created by IntelliJ IDEA.
  User: zsq
  Date: 2019/1/7
  Time: 18:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="static/bootstrap/css/bootstrap.min.css">

    <script type="text/javascript" src="static/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="static/bootstrap/js/bootstrap.min.js"></script>

    <script type="text/javascript" src="js/vue.js"></script>
    <title>Title</title>
    <style type="text/css">
        a:hover {
            text-decoration: none;
            cursor: pointer;
        }

        .list {
            margin-left: 30px;
        }

        .list:hover {
            cursor: pointer;
        }

        .damu_carousel {
            width: 80%;
            height: 300px;
            margin: 0px 10%;
        }

        .damu_carousel .carousel-inner .item img {
            width: 100%;
            height: 300px;
        }

        body {
            overflow-y: scroll;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-default" style="margin-top: 30px; background-color: #ffffff; border-color: #ffffff">
    <div class="container">
        <div class="row">
            <div class="navbar-header col-lg-offset-3">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                        data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                    <span class="icon-bar"></span>
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#" style="font-size: 30px; font-family: '华文楷体'">香飘十里 </a>
            </div>

            <div class="collapse navbar-collapse">
                <form class="navbar-form navbar-left">
                    <div class="form-group" style="margin-right: 30px">
                        <input type="text" class="form-control">
                        <button type="submit" class="btn btn-default">搜索</button>
                        <a class="list on"><span class="glyphicon glyphicon-cloud-upload"></span>上传</a>
                        <a class="list on"><span class="glyphicon glyphicon-question-sign"></span>提问</a>
                        <a class="list" href="login"><span class="glyphicon glyphicon-user"></span>登录</a>
                        <a class="list" href="register"><span class="glyphicon glyphicon-pencil"></span>注册</a>
                    </div>
                </form>
            </div>
        </div>
    </div>

</nav>

<div style="background: #eea236">
    <div class="container">
        <div class="collapse navbar-collapse navbar-ex1-collapse">
            <ul class="nav nav-tabs">
                <li role="presentation"><a href="/index_page">首页</a></li>
                <li role="presentation"><a href="menu">菜谱大全</a></li>
                <li role="presentation"><a href="meat">肉类</a></li>
                <li role="presentation" class="active"><a href="vegetables">蔬菜类</a></li>
                <li role="presentation"><a href="xiangcai">湘菜</a></li>
                <li role="presentation"><a href="yuecai">粤菜</a></li>
                <li role="presentation"><a href="chuancai">川菜</a></li>
                <li role="presentation"><a href="lucai">鲁菜</a></li>
                <li role="presentation"><a href="sucai">苏菜</a></li>
                <li role="presentation"><a href="mincai">闽菜</a></li>
                <li role="presentation"><a href="zhecai">浙菜</a></li>
                <li role="presentation"><a href="huicai">徽菜</a></li>
            </ul>
        </div>
    </div>
</div>

</body>
</html>