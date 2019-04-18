<%--
  Created by IntelliJ IDEA.
  User: zsq
  Date: 2019/3/18
  Time: 20:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="static/bootstrap/css/bootstrap.min.css">

    <script type="text/javascript" src="static/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="static/bootstrap/js/bootstrap.min.js"></script>

    <title>修改</title>

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



        .damu_carousel .carousel-inner .item img {
            width: 100%;
            height: 300px;
        }

        body {
            overflow-y: scroll;
        }

        .top{
            margin-top: 30px;
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
                                        <li><a class="on" href="#">我的收藏</a></li>
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

<div style="width: 60%;  margin: 50px 20%; border: 1px solid #eae6e3;" id="abc">
    <h2 align="center" style="border-bottom: 2px solid #afd9ee; height: 50px">注册</h2>
    <form class="form-horizontal" id="form">
        <div class="form-group top">
            <label class="col-sm-2 control-label">邮箱</label>
            <div class="col-xs-4">
                <input type="email" class="form-control" id="inputEmail" placeholder="E-mail" name="email">
                <span class="help-block" ></span>
            </div>
        </div>
        <div class="form-group top">
            <label for="inputName" class="col-sm-2 control-label">用户名</label>
            <div class="col-xs-4">
                <input type="text" class="form-control" id="inputName" placeholder="Name" name="name">
                <span class="help-block"></span>
            </div>
        </div>
        <div class="form-group top">
            <label for="inputName" class="col-sm-2 control-label">密码</label>
            <div class="col-xs-4">
                <input type="password" class="form-control" id="inputPassword" placeholder="Password" name="paw">
                <span class="help-block"></span>
            </div>
        </div>
        <div class="form-group top">
            <label for="inputName" class="col-sm-2 control-label">确认密码</label>
            <div class="col-xs-4">
                <input type="password" class="form-control" id="reInputPassword" placeholder="Confirm Password" name="repaw">
                <span class="help-block"></span>
                <input type="hidden" name="type" value="user">
            </div>
        </div>
        <div class="form-group top">
            <div class="col-sm-offset-2 col-sm-10">
                <%--<button type="submit" class="btn btn-primary" id="saveaa">Submission</button>--%>
                <input type="button" class="btn btn-primary" value="Submission" id="saveaa">
            </div>
        </div>
    </form>
</div>

</body>
</html>
