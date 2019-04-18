<%--
  Created by IntelliJ IDEA.
  User: zsq
  Date: 2019/1/15
  Time: 22:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="static/bootstrap/css/bootstrap.min.css">

    <script type="text/javascript" src="static/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="static/bootstrap/js/bootstrap.min.js"></script>

    <title>登录</title>
    <style type="text/css">
        *{
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

        .form-group {
            margin-top: 30px;
        }

        .damu_carousel .carousel-inner .item img {
            width: 100%;
            height: 300px;
        }

        body {
            overflow-y: scroll;
        }
        .help-block{
            color: red;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-default" style="margin-top: 30px; background-color: #ffffff; border-color: #ffffff">
    <div class="container">
        <div class="row" style="padding: 0px;">
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
                <form class="navbar-form navbar-left">
                    <div class="form" style="margin-right: 30px">
                        <input type="text" class="form-control">
                        <button type="submit" class="btn btn-default">搜索</button>
                        <a class="list"><span class="glyphicon glyphicon-cloud-upload"></span>上传</a>
                        <a class="list" href="question"><span class="glyphicon glyphicon-question-sign"></span>提问</a>
                        <a class="list" href="login_page"><span class="glyphicon glyphicon-user"></span>登录</a>
                        <a class="list" href="register_page"><span class="glyphicon glyphicon-pencil"></span>注册</a>
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

<div style="width: 60%;  margin: 50px 20%; border: 1px solid #eae6e3;">
    <h2 align="center" style="border-bottom: 2px solid #afd9ee; height: 50px">登录</h2>
    <form class="form-horizontal" id="form">
        <div class="form-group">
            <label for="inputName" class="col-sm-2 control-label">用户名</label>
            <div class="col-xs-4">
                <input type="name" class="form-control" id="inputName" placeholder="name" name="name">
            </div>
        </div>
        <div class="form-group">
            <label for="inputPassword" class="col-sm-2 control-label">密码</label>
            <div class="col-xs-4">
                <input type="password" class="form-control" id="inputPassword" placeholder="Password" name="paw">
                <input type="hidden" value="user" name="type">
                <span class="help-block"></span>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <%--<button type="submit" class="btn btn-primary" id="submit">Submission</button>--%>
                <input type="button" class="btn btn-primary" value="Submission" id="submit">
                还没有账户？<a href="register_page">没有立即注册</a>
            </div>

        </div>
    </form>
</div>
</body>
<script type="text/javascript">
    $(function () {
        $(".help-block").text("")
    })

    $("#submit").click(function () {
        $.ajax({
            url: "login",
            data: {name:$("#inputName").val(), paw: $("#inputPassword").val()},
            type: "post",
            success: function (result) {
                if (result.code == 100) {
                    window.location.href = "index_page"
                } else if (result.code == 200) {
                    window.location.href = "admin_page"
                } else {
                    $(".help-block").text("账号或密码错误")
                }
            }
        })
    })

    $(function () {
        $('[data-toggle="popover"]').popover()
    })

    $("#searchbox").on("input", function () {
        $("#inforlist").empty();
        var name = $(this).val()
        if($(this).val().length>0){
            $.ajax({
                url:"search_list",
                data:"name="+name,
                type:"post",
                success:function (result) {
                    build_search_info(result);
                }
            });
        }
    })

    function build_search_info(result){
        $("#inforlist").empty();
        var list = result.extend.listInfo.list;
        $.each(list, function (index, item) {
            if(index == 8)
                return false
            var option = $("<option></option>").addClass("option1").append($("<a></a>").addClass("a").attr("href","details?id="+item.id).append(item.name))
            $("#inforlist").append(option)
        })
    }


</script>
</html>
