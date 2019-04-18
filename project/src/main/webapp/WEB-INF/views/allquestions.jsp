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

        .li {
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

        .aaa {
            margin-top: 20px;
            text-indent: 2em;
        }

        #comment {
            font-size: 18px;
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
                <form class="form-horizontal" id="form">
                    <div class="form-group">
                        <div class="col-sm-10">
                            <p class="form-control-static" id="huifu"></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <textarea name="replyContent" cols="30" rows="10" style="margin-left: 60px"
                                  placeholder="来说两句吧……" id="reply_cont"></textarea>
                    </div>
                    <div>
                        <input type="hidden" id="reply_id" name="replyId">
                        <input type="hidden" id="content" name="content">
                        <input type="hidden" id="to_user" name="toUname">
                        <input type="hidden" id="time" name="replyTime">
                        <input type="hidden" id="form_user" name="fromUname">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="release">发布</button>
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
                <li role="presentation"><a href="vegetables">蔬菜类</a></li>
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
        <li role="presentation"><a href="question">用户提问</a></li>
        <li role="presentation" class="active"><a href="#">全部问题</a></li>
    </ul>

    <div class="tab-pane" id="profile" style="margin: 30px 20%">
        <ul class="talkList" id="li">
            <%--<li>--%>
            <%--<p>12234gjalkajajsdgasdg</p>--%>
            <%--<div class="toolsBar">--%>
            <%--<button id="reply">回复</button>--%>
            <%--<span>顶<b>0</b></span>--%>
            <%--<span>踩<b>0</b></span>--%>
            <%--</div>--%>
            <%--<time></time>--%>
            <%--<p id="comment">1123</p>--%>
            <%--</li>--%>
        </ul>
    </div>
</div>
</body>
<script src="http://pv.sohu.com/cityjson?ie=utf-8"></script>
<script type="text/javascript">
    $(function () {
        $.ajax({
            url: "${APP_PATH}/selectquestion",
            type: "GET",
            success: function (result) {
                build_question(result);
            }
        })
    })

    function build_question(result) {
        var question = result.extend.pageInfo
        $.each(question, function (index, item) {

            var s = fun(item.fromUname)
            // alert(s)

            var time = timestampToTime(item.createTime)
            // var s = "<div><ul><li>111<li><li>123</li></ul></div>"
            var info = $("<li></li>").addClass("li").append($("<p></p>").addClass("aaa").append(item.content)).append($("<div></div>").addClass("toolsBar").attr("id", item.id).append($("<button></button>").attr("id", "reply").attr("a", item.id).append("回复")).append($("<span></span>").attr("id", "top").append("顶").append($("<b></b>").append(0))).append($("<span></span>").attr("id", "tread").append("踩").append($("<b></b>").append(0)))).append($("<div><div>").append(123)).append($("<time></time>").attr("id", "time").append(time)).append($("<p></p>").attr("id", "comment").append(item.fromUname))
            $("#li").append(info);
        })
    }

    function fun(name) {
        var a = null
        $.ajax({
            url: "ab",
            data: "name=" + name,
            type: "GET",
            success: function (result) {
                var reply = result.extend.reply
                var e = ""
                $.each(reply, function (index, item) {
                    var info = item.fromUname
                    alert(info)
                    e += info;
                })
                console.log(e)
                a = e
            }
        })
        console.log(a)
        return "ss"
    }

    function timestampToTime(timestamp) {
        var date = new Date(timestamp);
// 时间戳为10位需 * 1000，时间戳为13位的话不需乘1000
        Y = date.getFullYear() + '-';
        M = (date.getMonth() + 1 < 10 ? '0' + (date.getMonth() + 1) : date.getMonth() + 1) + '-';
        D = date.getDate() + ' ';
        h = date.getHours() + ':';
        m = date.getMinutes() + ':';
        s = date.getSeconds();
        return Y + M + D + h + m + s;
    }

    $(document).on("click", "#top", function () {
        var i = $(this).children("b").text();
        i++;
        $(this).children("b").text(i);
    })

    $(document).on("click", "#tread", function () {
        var i = $(this).children("b").text();
        i++;
        $(this).children("b").text(i);
    })


    function getComment(id) {
        $.ajax({
            url: "${APP_PATH}/selectcomment/" + id,
            type: "GET",
            success: function (result) {
                console.log(result)
                var problem = result.extend.problem;
                $("#reply_id").val(problem.id)
                $("#content").val(problem.content)
                $("#to_user").val(problem.fromUname)
                var n = (returnCitySN["cip"])
                $("#form_user").val(n)
            }
        })
    }

    $(document).on("click", "#reply", function () {
        $("#aa").val("")
        getComment($(this).attr("a"))
        var text = $(this).parents("li").find("p:eq(0)").text();
        $("#huifu").html(text)
        $("#peoUpdateModel").modal({
            backdrop: "static"
        })
    })

    $("#release").click(function () {
        alert($("#reply_cont").val())
        $.ajax({
            url: "${APP_PATH}/insertreply",
            data: {
                replyid: $("#reply_id").val(),
                content: $("#content").val(),
                toUname: $("#to_user").val(),
                reply_cont: $("#reply_cont").val(),
                formuser: $("#form_user").val()
            },
            type: "POST",
            success: function () {
                alert(1)
            }
        })
        // $(".toolsBar").after(($("<div></div>")).append(text))
        $("#peoUpdateModel").modal('hide');
    })
</script>
</html>


