<%--
  Created by IntelliJ IDEA.
  User: zsq
  Date: 2019/3/2
  Time: 11:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<html>
<head>

    <link rel="stylesheet" type="text/css" href="static/bootstrap/css/bootstrap.min.css">

    <script type="text/javascript" src="static/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="static/bootstrap/js/bootstrap.min.js"></script>

    <title>查找菜谱</title>
    <style type="text/css">
        .nav-header {
            display: block;
            font-weight: bold;
            color: #333;
            text-shadow: 1px 1px 1px #fff;
            background: #dddddd;
            background: -webkit-gradient(linear, left bottom, left top, color-stop(0, #dddddd), color-stop(1, #ffffff));
            background: -ms-linear-gradient(bottom, #dddddd, #ffffff);
            background: -o-linear-gradient(bottom, #dddddd, #ffffff);
            filter: none;
            filter: progid:dximagetransform.microsoft.gradient(startColorStr='#444444', EndColorStr='#555555');
            -ms-filter: "progid:DXImageTransform.Microsoft.gradient(startColorStr='#ffffff',EndColorStr='#dddddd')";
            -webkit-border-top-right-radius: 3px;
            -webkit-border-bottom-right-radius: 0px;
            -webkit-border-bottom-left-radius: 0px;
            -webkit-border-top-left-radius: 3px;
            -moz-border-radius-topright: 3px;
            -moz-border-radius-bottomright: 0px;
            -moz-border-radius-bottomleft: 0px;
            -moz-border-radius-topleft: 3px;
            border-top-right-radius: 3px;
            border-bottom-right-radius: 0px;
            border-bottom-left-radius: 0px;
            border-top-left-radius: 3px;
            -moz-background-clip: padding;
            -webkit-background-clip: padding-box;
            background-clip: padding-box;
            border-bottom: 1px solid #aaa;
            font-size: 1em;
            line-height: 3em;
            text-transform: none;
            padding: 0em .75em;
            margin-bottom: 0px;
            cursor: pointer;
            border: 1px solid #ccc;
            border-bottom: 1px solid #aaa;
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
                <h4 class="modal-title">用户修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="col-sm-2 control-label">用户名</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="people_update"></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputEmail" class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="inputEmail">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">type</label>
                        <div class="col-sm-4">
                            <select class="form-control">
                                <option value="user" id="option1">user</option>
                                <option value="admin" id="option2">admin</option>
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary">更新</button>
            </div>
        </div>
    </div>
</div>

<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="admin_page">AdminPage</a>
        </div>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false">${name} <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a tabindex="-1" href="#">设置</a></li>
                        <li class="divider"></li>
                        <li><a tabindex="-1" href="exit">退出</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="container-fluid">
    <div class="row">
        <div class="col-xs-2" style="height:100%; background: #101010">
            <div class="nav-header" data-toggle="collapse" data-target="#dashboard-menu">用户管理
            </div>
            <ul id="dashboard-menu" class="nav nav-list collapse in">
                <li><a href="admin_searchUser">查找用户</a></li>
                <li><a href="admin_allUser">查看所有用户</a></li>
            </ul>
            <div class="nav-header" data-toggle="collapse" data-target="#accounts-menu">菜品管理</div>
            <ul id="accounts-menu" class="nav nav-list collapse in">
                <li><a href="admin_searchDN">查找菜谱</a></li>
                <li class="active"><a href="admin_allDN">查看所有菜谱</a></li>
            </ul>
            <div class="nav-header" data-toggle="collapse" data-target="#accounts-menu1">评论管理</div>
            <ul id="accounts-menu1" class="nav nav-list collapse in">
                <li><a href="admin_allQues">查看所有评论</a></li>
            </ul>
        </div>
        <div class="col-xs-10">
            <div role="tabpanel" class="tab-pane" id="searchDN">
                <div class="text-center">
                    <p>
                    <h1>查找菜谱</h1></p>
                    <p style="margin-top: 50px">
                        <input type="text" id="textfood">
                        <span class="help-block"></span>
                    </p>
                    <button type="button" class="btn btn-primary" id="subfood">查找</button>
                </div>
                <div style="margin-top: 50px; display: none;" id="foodInfo">
                    <table class="table table-bordered table-striped table-hover" id="condition_food_table">
                        <thead>
                        <tr>
                            <th>#</th>
                            <th>邮箱</th>
                            <th>用户名</th>
                            <th>密码</th>
                            <th>用户类型</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>

                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

</div>
</body>
<script type="text/javascript">
    function fun() {
        var name = $("#textfood").val()
        if (name.length == 0) {
            $("#textfood").next("span").text("不能为空值")
        } else {
            $.ajax({
                url: "${APP_PATH}/likeFood/" + name,
                type: "GET",
                success: function (result) {
                    console.log(result)
                    build_condition_food_table(result)
                }
            })
        }
    }

    $("#subfood").click(function () {
        fun()
    })

    function build_condition_food_table(result) {
        $("#foodInfo").css("display", "block")
        $("#textfood").next("span").text("")
        $("#condition_food_table tbody").empty();
        var food = result.extend.pageInfo;
        $.each(food, function (index, item) {
            var foodId = $("<td></td>").append(item.id);
            var foodName = $("<td></td>").append(item.name);
            var foodUser = $("<td></td>").append(item.user);
            var foodIntro = $("<td></td>").append(item.introduction);
            var foodType = $("<td></td>").append(item.type);

            var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_food_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
            delBtn.attr("del-id", item.id);
            var btnTd = $("<td></td>").append(delBtn);
            $("<tr></tr>")
                .append(foodId)
                .append(foodName)
                .append(foodUser)
                .append(foodIntro)
                .append(foodType)
                .append(btnTd)
                .appendTo("#condition_food_table tbody");
        });
    }

    $(document).on("click", ".delete_food_btn", function () {
        var foodName = $(this).parents("tr").find("td:eq(1)").text();
        var foodId = $(this).attr("del-id");
        if (confirm("确认删除【" + foodName + "】吗？")) {
            $.ajax({
                url: "deleteFood/" + foodId,
                type: "DELETE",
                success: function (result) {
                    alert(result.msg)
                    fun()
                }
            });
        }
    })
</script>
</html>
