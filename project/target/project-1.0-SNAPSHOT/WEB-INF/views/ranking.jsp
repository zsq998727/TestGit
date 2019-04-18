<%--
  Created by IntelliJ IDEA.
  User: zsq
  Date: 2019/1/7
  Time: 18:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="static/bootstrap/css/bootstrap.min.css">

    <script type="text/javascript" src="static/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="static/bootstrap/js/bootstrap.min.js"></script>

    <title>排行榜</title>
    <style type="text/css">
        * {
            font-size: 16px;
        }

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

        .rank {
            list-style: none;
            margin-top: 20px;
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
            <div class="navbar-header .col-lg-3 col-lg-offset-3">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                        data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                    <span class="icon-bar"></span>
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html" style="font-size: 30px; font-family: '华文楷体'">香飘十里 </a>
            </div>

            <div class="collapse navbar-collapse">
                <form class="navbar-form navbar-left" action="search_info">
                    <div class="form-group" style="margin-right: 30px">
                        <input type="text" class="form-control" id="searchbox" list="inforlist">
                        <datalist id="inforlist">
                        </datalist>
                        <button type="submit" class="btn btn-default" id="sub">搜索</button>
                        <a class="list" href="upload"><span class="glyphicon glyphicon-cloud-upload"></span>上传</a>
                        <a class="list" href="question"><span class="glyphicon glyphicon-question-sign"></span>提问</a>
                        <c:choose>
                            <c:when test="${userInfo == 'null'}">
                                <a class="list" href="login_page"><span class="glyphicon glyphicon-user"></span>登录</a>
                                <a class="list" href="register_page"><span class="glyphicon glyphicon-pencil"></span>注册</a>
                            </c:when>
                            <c:otherwise>
                                <div class="dropdown list" style="float: right">
                                    <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu2"
                                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                            ${userInfo.name}
                                        <span class="caret"></span>
                                    </button>
                                    <ul class="dropdown-menu" aria-labelledby="dropdownMenu2">
                                        <li><a href="my_recipe_page">我的厨房</a></li>
                                        <li><a href="my_favorites_page">我的收藏</a></li>
                                        <li><a href="my_infor_page">我的设置</a></li>
                                        <li><a href="exit">退出登录</a></li>
                                    </ul>
                                </div>
                            </c:otherwise>
                        </c:choose>
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
                <li role="presentation"><a href="index_page">首页</a></li>
                <li role="presentation" class="active"><a href="ranking">排行榜</a></li>
                <li role="presentation"><a href="vote">投票</a></li>
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

<div class="container" style="margin-top: 20px">
    <div class="row">
        <div class="col-xs-4">
            <h1>菜系排行榜</h1>
            <div>
                <ul class="list-group" id="dishes">
                </ul>
            </div>
        </div>
        <div class="col-xs-4">
            <h1>菜品收藏榜</h1>
            <div>
                <ul class="list-group" id="favorites">
                </ul>
            </div>
        </div>
        <div class="col-xs-4">
            <h1>菜品排行榜</h1>
            <div>
                <ul class="list-group" id="food">
                </ul>
            </div>
        </div>
    </div>


</div>
</body>
<script type="text/javascript">
    $(function () {
        dishesRank();
        favoriteRank();
        foodRank();
    });

    function dishesRank() {
        $.ajax({
            url:"${APP_PATH}/selectdishes",
            type:"GET",
            success:function (result) {
                build_dishes_info(result);
            }
        })
    }

    function build_dishes_info(result) {
        $("#dishes").empty();
        var question = result.extend.pageInfo;
        $.each(question, function (index, item) {
            $("#dishes").append($("<li></li>").addClass("rank")).append($("<a></a>").append(item.type))
        });
    }

    function favoriteRank() {
        $.ajax({
            url:"${APP_PATH}/selectfavorite",
            type:"GET",
            success:function (result) {
                build_favorites_info(result);
            }
        })
    }

    function build_favorites_info(result) {
        $("#favorites").empty();
        var question = result.extend.pageInfo;
        $.each(question, function (index, item) {
            $("#favorites").append($("<li></li>").addClass("rank")).append($("<a></a>").attr("href", "details?id=" + item.dishName.id).append(item.dishName.name))
        });
    }

    function foodRank() {
        $.ajax({
            url:"${APP_PATH}/selectfood",
            type:"get",
            success:function (result) {
                console.log(result)
                build_food_info(result)
            }
        })
    }

    function build_food_info(result) {
        $("#food").empty();
        var question = result.extend.pageInfo;
        $.each(question, function (index, item) {
            $("#food").append($("<li></li>").addClass("rank")).append($("<a></a>").attr("href", "details?id=" + item.dishName.id).append(item.dishName.name))
        });
    }

</script>
</html>
