<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.caipu.entity.User" %>
<%--
  Created by IntelliJ IDEA.
  User: zsq
  Date: 2019/1/2
  Time: 11:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <link rel="stylesheet" type="text/css" href="static/bootstrap/css/bootstrap.min.css">

    <script type="text/javascript" src="static/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="static/bootstrap/js/bootstrap.min.js"></script>

    <meta charset="UTF-8">
    <title>注册</title>

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
<script type="text/javascript">
    $(function () {
        $('.on').click(function () {
            alert("功能待完善");
        })

        $("#inputName").change(function () {
            var name = $(this).val()
            $.ajax({
                url:"checkUser",
                data:"info="+name,
                type:"post",
                success:function (result) {
                    if(result.code == 100){
                        show_validate_msg("#inputName","success","用户名可用")
                        $("#saveaa").attr("ajax-va","success")
                    }else{
                        show_validate_msg("#inputName","error","用户名不可用")
                        $("#saveaa").attr("ajax-va","error")

                    }
                }
            })
        })

        $("#inputPassword").change(function () {
            var paw = $(this).val();
            if(paw.length > 6){
                show_validate_msg("#inputPassword","success","")
                $("#saveaa").attr("ajax-va","success")
            }else{
                show_validate_msg("#inputPassword","error","密码长度应大于6")
                $("#saveaa").attr("ajax-va","error")
            }
        })

        $("#reInputPassword").change(function () {
            var paw1 = $("#inputPassword").val()
            var paw2 = $(this).val()
            if(paw1 == paw2 && paw2.length > 6){
                show_validate_msg("#reInputPassword","success","")
                $("#saveaa").attr("ajax-va","success")

            }else{
                show_validate_msg("#reInputPassword","error","两次输入密码不一致")
                $("#saveaa").attr("ajax-va","error")
            }
        })

        $("#inputName").blur(function () {
            if($(this).val().length == 0){
                show_validate_msg("#inputName","error","不能为空")
                $("#saveaa").attr("ajax-va","error")
            }
        })

        $("#inputEmail").blur(function () {
           if($(this).val().length != 0){
               show_validate_msg("#inputEmail","success","")
               $("#saveaa").attr("ajax-va","success")
           }else {
               show_validate_msg("#inputEmail","error","不能为空")
               $("#saveaa").attr("ajax-va","error")
           }
        })

        $("#reInputPassword").blur(function () {
            if($(this).val().length == 0){
                show_validate_msg("#reInputPassword","error","不能为空")
                $("#saveaa").attr("ajax-va","error")
            }
        })

        $("#inputPassword").blur(function () {
            if($(this).val().length == 0){
                show_validate_msg("#inputPassword","error","不能为空")
                $("#saveaa").attr("ajax-va","error")
            }
        })



        function show_validate_msg(ele,status,msg){
            //清除当前元素的校验状态
            $(ele).parent().removeClass("has-success has-error");
            $(ele).next("span").text("");
            if("success"==status){
                $(ele).parent().addClass("has-success");
                $(ele).next("span").text(msg);
            }else if("error" == status){
                $(ele).parent().addClass("has-error");
                $(ele).next("span").text(msg);
            }
        }

        function validate(){
            var value1 = $("#inputEmail").val().length
            var value2 = $("#inputName").val().length
            var value3 = $("#inputPassword").val().length
            var value4 = $("#reInputPassword").val().length
            if(value1 != 0){
                show_validate_msg("#inputEmail","success","")
                $("#saveaa").attr("ajax-va","success")
            }else{
                show_validate_msg("#inputEmail","error","不能为空")
                $("#saveaa").attr("ajax-va","error")
            }
            if(value2 == 0){
                show_validate_msg("#inputName","error","不能为空")
                $("#saveaa").attr("ajax-va","error")
            }
            if(value3 == 0){
                show_validate_msg("#inputPassword","error","不能为空")
                $("#saveaa").attr("ajax-va","error")
            }
            if(value4 == 0){
                show_validate_msg("#reInputPassword","error","不能为空")
                $("#saveaa").attr("ajax-va","error")
            }
        }

        $('#saveaa').click(function () {
            validate()
            if ($(this).attr("ajax-va") == "error" ) {
                alert(1)
                return false;
            }
            $.ajax({
                url:"register",
                type:"post",
                // data:$("#form").serialize(),
                data:{email:$("#inputEmail").val(), name:$("#inputName").val(), paw:$("#inputPassword").val(), type:"user"},
                success:function (result) {
                    if(result.code == 100){
                        window.location.href = "login_page"
                    }
                }
            })
        })
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