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

    <title>Title</title>
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
<nav class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">AdminPage</a>
        </div>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
                       aria-expanded="false">${name}  <span class="caret"></span></a>
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
                <li class="active"><a href="admin_allUser">查看所有用户</a></li>
            </ul>
            <div class="nav-header" data-toggle="collapse" data-target="#accounts-menu">菜品管理</div>
            <ul id="accounts-menu" class="nav nav-list collapse in">
                <li><a href="admin_searchDN">查找菜谱</a></li>
                <li><a href="admin_allDN">查看所有菜谱</a></li>
            </ul>
            <div class="nav-header" data-toggle="collapse" data-target="#accounts-menu1">评论管理</div>
            <ul id="accounts-menu1" class="nav nav-list collapse in">
                <li><a href="admin_allQues">查看所有评论</a></li>
            </ul>
        </div>
        <%--<div class="col-xs-10">--%>
            <%--<div role="tabpanel" class="tab-pane active" id="searchUser">--%>
                <%--<div class="text-center">--%>
                    <%--<p>--%>
                    <%--<h1>查找用户</h1></p>--%>
                    <%--<p style="margin-top: 50px">--%>
                        <%--<input type="text" id="textuser">--%>
                        <%--<span class="help-block"></span>--%>
                    <%--</p>--%>
                    <%--<button type="button" class="btn btn-primary" id="subUser">查找</button>--%>
                <%--</div>--%>
                <%--<div style="margin-top: 50px; display: none;" id="info">--%>
                    <%--<table class="table table-bordered table-striped table-hover" id="condition_emps_table">--%>
                        <%--<thead>--%>
                        <%--<tr>--%>
                            <%--<th>#</th>--%>
                            <%--<th>email</th>--%>
                            <%--<th>name</th>--%>
                            <%--<th>password</th>--%>
                            <%--<th>type</th>--%>
                            <%--<th>operation</th>--%>
                        <%--</tr>--%>
                        <%--</thead>--%>
                        <%--<tbody>--%>
                        <%--</tbody>--%>
                    <%--</table>--%>
                <%--</div>--%>
            <%--</div>--%>
        <%--</div>--%>
    </div>

</div>
</body>
<%--<script type="text/javascript">--%>
    <%--$("#subUser").click(function () {--%>
        <%--alert(1)--%>
        <%--var name = $("#textuser").val()--%>
        <%--if (name.length == 0) {--%>
            <%--$("#textuser").next("span").text("不能为空值")--%>
        <%--} else {--%>
            <%--$.ajax({--%>
                <%--url: "${APP_PATH}/likeName/" + name,--%>
                <%--type: "get",--%>
                <%--success: function (result) {--%>
                    <%--console.log(result)--%>
                    <%--build_condition_emps_table(result)--%>
                <%--}--%>
            <%--})--%>
        <%--}--%>
    <%--})--%>

    <%--function build_condition_emps_table(result) {--%>
        <%--$("#info").css("display", "block")--%>
        <%--$("#condition_emps_table tbody").empty();--%>
        <%--var emps = result.extend.pageInfo;--%>
        <%--$.each(emps, function (index, item) {--%>
            <%--var empIdTd = $("<td></td>").append(item.id);--%>
            <%--var emailTd = $("<td></td>").append(item.email);--%>
            <%--var empNameTd = $("<td></td>").append(item.name);--%>
            <%--var empPaw = $("<td></td>").append(item.paw);--%>
            <%--var empType = $("<td></td>").append(item.type);--%>

            <%--var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")--%>
                <%--.append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");--%>
            <%--//为编辑按钮添加一个自定义的属性，来表示当前员工id--%>
            <%--editBtn.attr("edit-id", item.id);--%>
            <%--var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")--%>
                <%--.append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");--%>
            <%--delBtn.attr("del-id", item.id);--%>
            <%--var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);--%>
            <%--$("<tr></tr>")--%>
                <%--.append(empIdTd)--%>
                <%--.append(emailTd)--%>
                <%--.append(empNameTd)--%>
                <%--.append(empPaw)--%>
                <%--.append(empType)--%>
                <%--.append(btnTd)--%>
                <%--.appendTo("#condition_emps_table tbody");--%>
        <%--});--%>
    <%--}--%>

    <%--$(document).on("click", ".delete_btn", function () {--%>
        <%--var empName = $(this).parents("tr").find("td:eq(2)").text();--%>
        <%--var empId = $(this).attr("del-id");--%>
        <%--if (confirm("确认删除【" + empName + "】吗？")) {--%>
            <%--$.ajax({--%>
                <%--url: "deleteUser/" + empId,--%>
                <%--type: "DELETE",--%>
                <%--async: false,--%>
                <%--success: function (result) {--%>
                    <%--alert(result.msg)--%>
                    <%--to_user_page(currentPage);--%>
                <%--}--%>
            <%--});--%>
        <%--}--%>
    <%--})--%>

    <%--function getPeople(id) {--%>
        <%--$.ajax({--%>
            <%--url: "${APP_PATH}/peo/" + id,--%>
            <%--type: "GET",--%>
            <%--success: function (result) {--%>
                <%--// console.log(result)--%>
                <%--var peoData = result.extend.people;--%>
                <%--$("#people_update").val(peoData.name);--%>
                <%--$("#inputEmail").val(peoData.email)--%>
                <%--if (peoData.type == "admin") {--%>
                    <%--$("#option2").prop("selected", 'selected')--%>
                <%--} else {--%>
                    <%--$("#option1").prop("selected", 'selected')--%>
                <%--}--%>
            <%--}--%>
        <%--})--%>
    <%--}--%>

    <%--$(document).on("click", ".edit_btn", function () {--%>
        <%--getPeople($(this).attr("edit-id"));--%>
        <%--$("#peoUpdateModel").modal({--%>
            <%--backdrop: "static"--%>
        <%--})--%>
    <%--})--%>


<%--</script>--%>
</html>
