<%--
  Created by IntelliJ IDEA.
  User: zsq
  Date: 2018/12/3
  Time: 9:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="static/bootstrap/css/bootstrap.min.css">

    <script type="text/javascript" src="static/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="static/bootstrap/js/bootstrap.min.js"></script>

    <title>我的信息</title>
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

        .thumbnail img  {
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
                <a class="navbar-brand" href="#" style="font-size: 30px; font-family: '华文楷体'">香飘十里</a>
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
                            <c:when test="${userInfo == null}">
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
        <div class="collapse navbar-collapse" s>
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

<div class="container" style="margin-top: 10px;">

    <ul class="nav nav-tabs" role="tablist" style="margin: 30px 10%;font-size: 20px">
        <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab"
                                                  data-toggle="tab">信息修改</a></li>
    </ul>

    <div class="tab-pane active" id="home" style="margin: 30px 20%">
        <form id="formBox">
            <div class="form-group" style="margin-top: 10px">
                <label style="font-size: 16px; font-family: 'arial'">用户名</label>
                <input type="text" class="form-control" id="name" style="margin-top: 10px; width: 200px" name="name"
                       value="${userInfo.name}" readonly="readonly">
            </div>
            <div class="form-group" style="margin-top: 10px">
                <label style="font-size: 16px; font-family: 'arial'">修改密码</label>
                <input type="password" class="form-control" id="paw" style="margin-top: 10px; width: 200px" name="paw">
                <span class="help-block"></span>
            </div>
            <div class="form-group" style="margin-top: 10px">
                <label style="font-size: 16px; font-family: 'arial'">确认密码</label>
                <input type="password" class="form-control" id="repaw" style="margin-top: 10px; width: 200px">
                <span class="help-block"></span>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="submit" class="btn btn-primary" id="submit">Submission</button>
                </div>
            </div>
        </form>
    </div>
</div>
</body>
<script type="text/javascript">
    $("#paw").change(function () {
        if ($(this).val().length > 6) {
            show_validate_msg("#paw", "success", "")
            $("#saveaa").attr("ajax-va", "success")
        } else {
            show_validate_msg("#paw", "error", "密码长度应大于6")
            $("#saveaa").attr("ajax-va", "error")
        }
    })

    $("#repaw").change(function () {
        var paw = $("#paw").val();
        var paw1 = $(this).val();
        if (paw != paw1) {
            show_validate_msg("#repaw", "error", "两次密码不一致")
            $("#saveaa").attr("ajax-va", "error")
        } else {
            show_validate_msg("#repaw", "success", "")
            $("#saveaa").attr("ajax-va", "success")
        }
    })

    $("#submit").click(function () {
        alert($("#paw").val())
        if($(this).attr("ajax-va") == "error"){
            return false;
        }else{
            $.ajax({
                url:"update_infor",
                type:"post",
                data:{name:$("#name").val(), paw:$("#paw").val()},
                success:function (result) {
                    alert()
                }
            })
        }
    })

    function show_validate_msg(ele, status, msg) {
        //清除当前元素的校验状态
        $(ele).parent().removeClass("has-success has-error");
        $(ele).next("span").text("");
        if ("success" == status) {
            $(ele).parent().addClass("has-success");
            $(ele).next("span").text(msg);
        } else if ("error" == status) {
            $(ele).parent().addClass("has-error");
            $(ele).next("span").text(msg);
        }
    }
</script>

</html>
