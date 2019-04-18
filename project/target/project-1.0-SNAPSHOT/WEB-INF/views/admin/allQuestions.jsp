<%--
  Created by IntelliJ IDEA.
  User: zsq
  Date: 2019/3/22
  Time: 20:28
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

    <title>评论管理</title>
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
                <li><a href="admin_allDN">查看所有菜谱</a></li>
            </ul>
            <div class="nav-header" data-toggle="collapse" data-target="#accounts-menu1">评论管理</div>
            <ul id="accounts-menu1" class="nav nav-list collapse in">
                <li><a href="admin_allQues">查看所有评论</a></li>
            </ul>
        </div>
        <div class="col-xs-10">
            <h1 class="page-title" style="text-align: center">所有评论</h1>
            <div role="tabpanel" class="tab-pane" id="allUser">
                <table class="table table-bordered table-striped table-hover" id="ques_table">
                    <thead>
                    <tr>
                        <th>#</th>
                        <th>内容</th>
                        <th>评论时间</th>
                        <th>评论用户</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>

                    </tbody>
                </table>
                <div class="col-md-6" id="page_info_area"></div>
                <!-- 分页条信息 -->
                <div class="col-md-6" id="page_nav_area"></div>
            </div>
        </div>
    </div>

</div>
</body>
<script type="text/javascript">
    $(function () {
        to_user_page(1)
    })

    function to_user_page(pn) {
        $.ajax({
            url:"${APP_PATH}/selectAllQues",
            data: "pn=" + pn,
            type:"GET",
            success:function (result) {
                build_ques_table(result)

                build_page_info(result);

                build_page_nav(result)
            }
        })
    }

    function build_ques_table(result) {
        $("#ques_table tbody").empty();
        var question = result.extend.pageInfo.list;
        $.each(question, function (index, item) {
            var time = timestampToTime(item.createTime)

            var IdTd = $("<td></td>").append(item.id);
            var ContentTd = $("<td></td>").append(item.content);
            var timeTd = $("<td></td>").append(time);
            var userTd = $("<td></td>").append(item.fromUname);


            var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
            delBtn.attr("del-id", item.id);
            var btnTd = $("<td></td>").append(delBtn);
            $("<tr></tr>")
                .append(IdTd)
                .append(ContentTd)
                .append(timeTd)
                .append(userTd)
                .append(btnTd)
                .appendTo("#ques_table tbody");
        });
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

    function build_page_info(result) {
        $("#page_info_area").empty();
        $("#page_info_area").append("当前" + result.extend.pageInfo.pageNum + "页,总" +
            result.extend.pageInfo.pages + "页,总" + result.extend.pageInfo.total + "条记录")
        totalRecord = result.extend.pageInfo.total;
        currentPage = result.extend.pageInfo.pageNum;
    }

    function build_page_nav(result) {
        //page_nav_area
        $("#page_nav_area").empty();
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
                to_user_page(0);
            });
            prePageLi.click(function () {
                to_user_page(result.extend.pageInfo.pageNum - 1);
            });
        }

        var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
        var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href", "#"));
        if (result.extend.pageInfo.hasNextPage == false) {
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        } else {
            nextPageLi.click(function () {
                to_user_page(result.extend.pageInfo.pageNum + 1);
            });
            lastPageLi.click(function () {
                to_user_page(result.extend.pageInfo.pages);
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
                to_user_page(item);
            });
            ul.append(numLi);
        });
        //添加下一页和末页 的提示
        ul.append(nextPageLi).append(lastPageLi);

        //把ul加入到nav
        var navEle = $("<nav></nav>").append(ul);
        navEle.appendTo("#page_nav_area");
    }

    $(document).on("click", ".delete_btn", function () {
        var empName = $(this).parents("tr").find("td:eq(3)").text();
        var contentId = $(this).attr("del-id");
        if (confirm("确认删除用户【" + empName + "】的评论吗？")) {
            $.ajax({
                url: "${APP_PATH}/deleteContent/" + contentId,
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
