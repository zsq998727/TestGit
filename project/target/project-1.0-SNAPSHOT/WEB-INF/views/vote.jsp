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

    <title>投票</title>
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

        .vote {
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
        <div class="collapse navbar-collapse navbar-ex1-collapse">
            <ul class="nav nav-tabs">
                <li role="presentation"><a href="index_page">首页</a></li>
                <li role="presentation"><a href="ranking">排行榜</a></li>
                <li role="presentation" class="active"><a href="vote">投票</a></li>
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

<div class="container" style="margin-top: 20px;">
    <div class="row">
        <div class="col-xs-5">
            <h1>菜系投票</h1>
            <form id="form">
                <input type="hidden" id="userna" name="user">
                <ul class="list-group">
                    <li class="vote"><input type="radio" name="type" value="湘菜" checked="checked">湘菜</li>
                    <li class="vote"><input type="radio" name="type" value="粤菜">粤菜</li>
                    <li class="vote"><input type="radio" name="type" value="川菜">川菜</li>
                    <li class="vote"><input type="radio" name="type" value="鲁菜">鲁菜</li>
                    <li class="vote"><input type="radio" name="type" value="苏菜">苏菜</li>
                    <li class="vote"><input type="radio" name="type" value="闽菜">闽菜</li>
                    <li class="vote"><input type="radio" name="type" value="浙菜">浙菜</li>
                    <li class="vote"><input type="radio" name="type" value="徽菜">徽菜</li>
                </ul>
                <input type="button" style="margin-left: 50px" class="btn btn-primary" value="投票" id="voteType">
            </form>
        </div>
        <div class="col-xs-7">
            <h1>菜品投票</h1>
            <div>
                <input type="text" class="form-control" placeholder="食谱id" style="width: 200px; margin-top: 50px" id="id">
                <br>
                <input type="button" style="margin-left: 50px" class="btn btn-primary" value="投票" id="voteFood">
            </div>
        </div>
    </div>
    <div>

    </div>
</div>

</body>
<script src="http://pv.sohu.com/cityjson?ie=utf-8"></script>
<script type="text/javascript">
    $("#voteType").click(function () {
        // var n = (returnCitySN["cip"])
        // $("#userna").val(n)
        var name = $("input[name='type']:checked").val();
        $.ajax({
            url: "${APP_PATH}/voteinfo/" + name,
            type: "POST",
            success: function (result) {
                if (result.code == 100) {
                    alert("投票成功")
                } else {
                    alert("您已参与投票")
                }
            }
        })
    })

    $("#voteFood").click(function () {
        var Id = $("#id").val();
       $.ajax({
           url: "${APP_PATH}/votefood",
           data:{id:Id},
           type:"post",
           success:function (result) {
               if(result.code == 100){
                   $("#id").val("")
                   alert("投票成功")
               }else{
                   alert("食谱不存在");
               }
           }
       })
    })
</script>
</html>