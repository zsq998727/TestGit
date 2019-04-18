<%--
  Created by IntelliJ IDEA.
  User: zsq
  Date: 2019/3/12
  Time: 19:41
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
    <title>提问</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            font-size: 16px;
        }

        .list {
            margin-left: 30px;
        }

        ul {
            list-style: none
        }

        .wrap {
            width: 500px;
            font-size: 14px;
            margin: 50px auto
        }

        .countTxt {
            display: block;
            text-align: right;
            padding-bottom: 10px;
        }

        .countTxt em {
            font-size: 16px;
            font-weight: bold;
            font-style: normal;
            padding: 0 5px
        }

        .countTxt .red {
            color: red;
        }

        textarea {
            padding: 10px;
            display: block;
            width: 480px;
            resize: none;
            height: 100px;
            border: 1px solid #ccc;
            font-size: 14px
        }

        .commonBtn {
            height: 40px;
            width: 100px;
            border: 1px solid #ccc;
            margin: 10px 0 0 380px
        }

        hr {
            margin: 20px 0
        }

        .talkList li {
            border: 1px solid #ccc;
            padding: 35px 20px 20px;
            border-radius: 10px;
            position: relative;
            margin-bottom: 20px
        }

        .talkList li p {
            min-height: 50px;
            margin-bottom: 10px;
            word-break: break-all
        }

        .talkList li .toolsBar {
            text-align: right
        }

        .talkList li .toolsBar span {
            margin-left: 20px;
            cursor: pointer
        }

        .talkList li time {
            position: absolute;
            top: 10px;
            right: 15px;
            color: #ccc;
        }

        #comment {
            position: absolute;
            top: 10px;
            left: 15px;
            color: #000000;
        }
    </style>
</head>
<body>
<div class="modal fade" id="peoUpdateModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">回答问题</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <div class="col-sm-10">
                            <p class="form-control-static" id="huifu"></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <textarea name="" id="aa" cols="30" rows="10" style="margin-left: 60px"
                                  placeholder="来说两句吧……"></textarea>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="subb">发布</button>
            </div>
        </div>
    </div>
</div>


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
                        <a class="list on"><span class="glyphicon glyphicon-question-sign"></span>提问</a>
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
                                        <li><a class="my_favorites_page" href="#">我的收藏</a></li>
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

<div>

    <!-- Nav tabs -->
    <ul class="nav nav-tabs" role="tablist" style="margin: 30px 20%;font-size: 20px">
        <li role="presentation" class="active"><a href="question">用户提问</a></li>
        <li role="presentation"><a href="allquestions_page">全部问题</a></li>
    </ul>

    <!-- Tab panes -->
    <div class="tab-content" style="margin: 30px 20%">
        <div role="tabpanel" class="tab-pane active" id="home">
            <div class="row">
                <div class="wrap">
                    <form id="form">
                        <span class="countTxt">您还可以输入<em>140</em>字</span>
                        <textarea id="Content" name="content"></textarea>
                        <c:choose>
                            <c:when test="${userInfo == 'null'}">
                                <input type="hidden" id="usern" value="访客">
                            </c:when>
                            <c:otherwise>
                                <input type="hidden" id="usern" value="${userInfo.name}">
                            </c:otherwise>
                        </c:choose>
                        <button type="button" class="commonBtn" disabled>提问</button>
                    </form>
                    <hr>
                </div>
            </div>
        </div>
        <div role="tabpanel" class="tab-pane" id="profile">
            <ul class="talkList">
            </ul>
        </div>
    </div>

</div>
</body>
</html>
<script src="http://pv.sohu.com/cityjson?ie=utf-8"></script>
<script>
    function isChinese(str) {//判断是不是中文 中文：true 字符：false
        var reCh = /[u00-uff]/;
        return !reCh.test(str);
    }

    $("textarea").on("input", function () {
        var txtval = $(this).val();

        $(".commonBtn").prop("disabled", txtval == "" ? true : false);//设定按钮

        var str_length = 0;//初始定义长度为0；

        for (var i = 0; i < txtval.length; i++) {
            if (isChinese(txtval.charAt(i))) {
                str_length = str_length + 2
            }//中文为2个字符
            else {
                str_length = str_length + 1
            }//英文为1个字符
        }
        str_length = Math.ceil(str_length / 2);//中英文相加除2 向下取整数（一个中文 + 一个英文）

        var count = 140 - str_length;
        if (count < 0) {
            $(".countTxt").html('超出<em class="red">' + Math.abs(count) + '</em>字');
            $(".commonBtn").prop("disabled", true);
        } else {
            $(".countTxt").html("您还可以输入<em>" + count + "</em>字")
        }
    })

    $(".commonBtn").click(function () {
        var Content = $("#Content").val()
        var Usern = $("#usern").val()
        alert(Content+" "+Usern)
        $.ajax({
            url: "${APP_PATH}/infor",
            type: "POST",
            data:{content:Content, usern:Usern},
            success: function () {
                alert("提问成功")
            }
        })
        $("textarea").val("");
        $(".commonBtn").prop("disabled", true);
        count = 140;
        $(".countTxt").html("您还可以输入<em>" + count + "</em>字");
    })
</script>