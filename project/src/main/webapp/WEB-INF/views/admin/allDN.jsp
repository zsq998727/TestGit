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
    <div class="row" >
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
                <li class="active"><a href="admin_allDN">查看所有菜谱</a></li>
            </ul>
            <div class="nav-header" data-toggle="collapse" data-target="#accounts-menu1">评论管理</div>
            <ul id="accounts-menu1" class="nav nav-list collapse in">
                <li><a href="admin_allQues">查看所有评论</a></li>
            </ul>
        </div>
        <div class="col-xs-10" style="text-align: center">
            <h1 class="page-title" style="text-align: center">所有菜谱</h1>
            <div role="tabpanel" class="tab-pane" id="allDN">
                <table class="table table-bordered table-striped table-hover" id="dish_table">
                    <thead>
                    <tr>
                        <th>#</th>
                        <th>菜名</th>
                        <th>上传用户</th>
                        <th>简介</th>
                        <th>菜系</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>

                    </tbody>
                </table>
                <div class="col-md-6" id="page_info_area1"></div>
                <!-- 分页条信息 -->
                <div class="col-md-6" id="page_nav_area1"></div>
            </div>
        </div>
    </div>

</div>
</body>
<script type="text/javascript">
    $(function () {
        toto_food_page(1);
    });

    function toto_food_page(pn) {
        alert(pn)
        $.ajax({
            url: "${APP_PATH}/selectFoodAll",
            data: "pn=" + pn,
            type: "GET",
            success: function (result) {
                console.log(result)

                build_food_table(result)

                build_page_info1(result);

                build_page_nav1(result)
            }
        });
    }

    function build_food_table(result) {
        $("#dish_table tbody").empty();
        var emps = result.extend.pageInfo.list;
        $.each(emps, function (index, item) {
            var foodIdTd = $("<td></td>").append(item.id);
            var nameTd = $("<td></td>").append(item.name);
            var userName = $("<td></td>").append(item.user);
            var foodIntro = $("<td></td>").append(item.introduction);
            var foodType = $("<td></td>").append(item.type);

            var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_food_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
            delBtn.attr("del-id", item.id);
            var btnTd = $("<td></td>").append(delBtn);
            $("<tr></tr>")
                .append(foodIdTd)
                .append(nameTd)
                .append(userName)
                .append(foodIntro)
                .append(foodType)
                .append(btnTd)
                .appendTo("#dish_table tbody");
        });
    }

    function build_page_info1(result) {
        $("#page_info_area1").empty();
        $("#page_info_area1").append("当前" + result.extend.pageInfo.pageNum + "页,总" +
            result.extend.pageInfo.pages + "页,总" + result.extend.pageInfo.total + "条记录")
        totalRecord = result.extend.pageInfo.total;
        currentPage = result.extend.pageInfo.pageNum;
    }

    function build_page_nav1(result) {
        //page_nav_area
        $("#page_nav_area1").empty();
        var ul = $("<ul></ul>").addClass("pagination");

        //构建元素
        var firstPageLi = $("<li></li>").append($("<a></a>").append("首页").attr("href", "#"));
        var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
        if (result.extend.pageInfo.hasPreviousPage == false) {
            firstPageLi.addClass("disabled");
            prePageLi.addClass("disabled");
        } else {
            //为元素添加点击翻页的事件
            firstPageLi.click(function () {
                toto_food_page(0);
            });
            prePageLi.click(function () {
                toto_food_page(result.extend.pageInfo.pageNum - 1);
            });
        }

        var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
        var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href", "#"));
        if (result.extend.pageInfo.hasNextPage == false) {
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        } else {
            nextPageLi.click(function () {
                toto_food_page(result.extend.pageInfo.pageNum + 1);
            });
            lastPageLi.click(function () {
                toto_food_page(result.extend.pageInfo.pages);
            });
        }

        //添加首页和前一页 的提示
        ul.append(firstPageLi).append(prePageLi);
        //1,2，3遍历给ul中添加页码提示
        $.each(result.extend.pageInfo.navigatepageNums, function (index, item) {

            var numLi = $("<li></li>").append($("<a></a>").append(item));
            if (result.extend.pageInfo.pageNum == item) {
                numLi.addClass("active");
            }
            numLi.click(function () {
                toto_food_page(item);
            });
            ul.append(numLi);
        });
        //添加下一页和末页 的提示
        ul.append(nextPageLi).append(lastPageLi);

        //把ul加入到nav
        var navEle = $("<nav></nav>").append(ul);
        navEle.appendTo("#page_nav_area1");
    }

    $(document).on("click", ".delete_food_btn", function () {
        var foodName = $(this).parents("tr").find("td:eq(1)").text();
        var foodId = $(this).attr("del-id");
        if (confirm("确认删除【" + foodName + "】吗？")) {
            $.ajax({
                url: "${APP_PATH}/deleteFood/" + foodId,
                type: "DELETE",
                success: function (result) {
                    alert(result.msg)
                    to_user_page(currentPage);
                }
            });
        }
    })
</script>

</html>
