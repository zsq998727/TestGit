<%--
  Created by IntelliJ IDEA.
  User: zsq
  Date: 2018/12/3
  Time: 9:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    pageContext.setAttribute("APP_PATH", request.getContextPath());
    pageContext.setAttribute("img","G:\\tupian\\");
%>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="static/bootstrap/css/bootstrap.min.css">

    <script type="text/javascript" src="static/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="static/bootstrap/js/bootstrap.min.js"></script>

    <title>主页</title>
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

        .damu_carousel {
            width: 80%;
            height: 300px;
            margin: 0px 10%;
        }

        .damu_carousel .carousel-inner .item img {
            width: 100%;
            height: 300px;
        }

        .thumbnail img {
            width: 100%;
            height: 160px;
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
                <form class="navbar-form navbar-left" action="search_info">
                    <div class="form-group" style="margin-right: 30px">
                        <input type="text" class="form-control" id="searchbox" list="inforlist">
                        <datalist id="inforlist">
                        </datalist>
                        <button type="submit" class="btn btn-default" id="sub">搜索</button>
                        <a class="list" href="upload"><span class="glyphicon glyphicon-cloud-upload"></span>上传</a>
                        <a class="list" href="question"><span class="glyphicon glyphicon-question-sign"></span>提问</a>
                        <c:choose>
                            <c:when test="${userInfo != 'null'}">
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
                            </c:when>
                            <c:otherwise>
                                <a class="list" href="login_page"><span class="glyphicon glyphicon-user"></span>登录</a>
                                <a class="list" href="register_page"><span class="glyphicon glyphicon-pencil"></span>注册</a>
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
        <div class="collapse navbar-collapse">
            <ul class="nav nav-tabs">
                <li role="presentation" class="active"><a href="index_page">首页</a></li>
                <li role="presentation"><a href="ranking">排行榜</a></li>
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

<div id="carousel-example-generic" class="carousel slide damu_carousel" data-ride="carousel" style="margin-top: 20px">
    <!-- Indicators -->
    <ol class="carousel-indicators">
        <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
        <li data-target="#carousel-example-generic" data-slide-to="1"></li>
        <li data-target="#carousel-example-generic" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
        <div class="item active">
            <img src="img/index.jpg" alt="...">
            <div class="carousel-caption">
                ...
            </div>
        </div>
        <div class="item">
            <img src="img/index1.jpg" alt="...">
            <div class="carousel-caption">
                ...123
            </div>
        </div>
        ...
    </div>

    <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>


<div class="container" style="margin-top: 20px">
    <div class="row" id="infor">

    </div>
</div>
</body>
<script type="text/javascript">

    $(function () {
        $.ajax({
            url: "${APP_PATH}/index",
            success: function (result) {
                build_img(result);
            }
        })
    })

    function build_img(result) {
        $("#infor").empty();
        var emps = result.extend.pageInfo;
        $.each(emps, function (index, item) {
            if (index == 8)
                return false
            var div = $("<div></div>").addClass("col-lg-3 col-md-4 col-sm-6").append($("<a></a>").attr("href", "details?id=" + item.id).append
            ($("<div></div>").addClass("thumbnail").append($("<img>").attr("src",item.img)).append($("<div></div>").addClass("caption").append
            ($("<p>").addClass("text-center").append(item.name)))));
            $("#infor").append(div);
        });
    }


    $('.on').click(function () {
        alert("功能待完善");
    })

    $("#sub").click(function () {
        var name = $("#searchbox").val();
    })

    $("#searchbox").on("input", function () {
        $("#inforlist").empty();
        var name = $(this).val()
        if ($(this).val().length > 0) {
            $.ajax({
                url: "${APP_PATH}/search_list/" + name,
                type: "get",
                success: function (result) {
                    build_search_info(result);

                }
            });
        }
    })

    function build_search_info(result) {
        $("#inforlist").empty();
        var list = result.extend.listInfo.list;
        $.each(list, function (index, item) {
            if (index == 8)
                return false
            // var option = $("<option></option>").addClass("option1").append($("<a></a>").addClass("a").attr("href","details?id="+item.id).append(item.name))
            var option = $("<option></option>").addClass("option").attr("data-id", item.id).attr("value", item.name)
            $("#inforlist").append(option)
        })
    }

    $("#searchbox").on("change", function () {
        var input_select = $("#searchbox").val();
        // var option_length = $(".option").length;
        //
        // var option_id = '';
        // for (var i = 0; i < 10; i++) {
        //     var option_value = $("option").eq(i).attr('value');
        //     if (input_select == option_value) {
        //         option_id = $("option").eq(i).attr('data-id');
        //         break;
        //     }
        // }
    })
</script>
</html>
