<%--
  Created by IntelliJ IDEA.
  User: zsq
  Date: 2018/12/3
  Time: 9:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="static/bootstrap/css/bootstrap.min.css">

    <script type="text/javascript" src="static/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="static/bootstrap/js/bootstrap.min.js"></script>

    <title>我的厨房</title>
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

        .thumbnail img {
            width: 100%;
            height: 160px;
        }

        body {
            overflow-y: scroll;
        }
    </style>
</head>
<body>
<div class="modal fade" id="updateModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" id="form">
                    <div class="form-group">
                        <label style="font-size: 16px; font-family: 'arial'">菜&nbsp名</label>
                        <div>
                            <p class="form-control-static" id="dish_update"></p>
                            <input type="hidden" id="id" name="id">
                        </div>
                    </div>
                    <div class="form-group" style="margin-top: 10px">
                        <label style="font-size: 16px; font-family: 'arial'">分&nbsp类</label>
                        <select class="form-control" style="width: 192px" name="type" id="type">
                            <option value="湘菜">湘菜</option>
                            <option value="粤菜">粤菜</option>
                            <option value="川菜">川菜</option>
                            <option value="鲁菜">鲁菜</option>
                            <option value="苏菜">苏菜</option>
                            <option value="闽菜">闽菜</option>
                            <option value="浙菜">浙菜</option>
                            <option value="徽菜">徽菜</option>
                        </select>
                    </div>
                    <%--<div class="form-group" style="margin-top: 10px">--%>
                        <%--<label style="font-size: 16px; font-family: 'arial'" id="">材&nbsp料</label>--%>
                    <%--</div>--%>
                    <div class="form-group" style="margin-top: 10px">
                        <label style="font-size: 16px; font-family: 'arial'">描&nbsp述</label>
                        <textarea class="form-control" rows="5" style="margin-top: 10px"
                                  name="introduction" id="introduction"></textarea>
                        <span class="help-block"></span>
                    </div>
                    <div class="form-group" style="margin-top: 10px">
                        <label style="font-size: 16px; font-family: 'arial'">做&nbsp法</label>
                        <textarea class="form-control" rows="5" style="margin-top: 10px" name="practices"
                                  id="practices"></textarea>
                        <span class="help-block"></span>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="save">更新</button>
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
                                                  data-toggle="tab">我的厨房</a></li>
    </ul>

    <div class="container" id="home" style="margin-top: 30px">
        <div class="row" id="infor"></div>

        <div class="row">
            <!--分页文字信息  -->
            <div class="col-md-6" id="page_info_area"></div>
            <!-- 分页条信息 -->
            <div class="col-md-6" id="page_nav_area">

            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    $(function () {
        to_page(1)
    });

    function to_page(pn) {
        $.ajax({
            url: "my_page",
            data: {"pn": pn, "name": ${userInfo.name}},
            type: "get",
            success: function (result) {
                console.log(result);
                build_img(result);
                build_page_info(result);
                build_page_nav(result)
            }
        })
    }

    function build_img(result) {
        $("#infor").empty();
        var food = result.extend.pageInfo.list;
        $.each(food, function (index, item) {
            var editBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");

            editBtn.attr("edit-id", item.id);
            var delBtn = $("<button></button>").addClass("btn btn-danger btn-sm delete_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
            delBtn.attr("del-id", item.id);

            var btnTd = $("<p>").addClass("text-center").append(editBtn).append(" ").append(delBtn);

            var div = $("<div></div>").addClass("col-lg-3 col-md-4 col-sm-6").append($("<a></a>").attr("href", "details?id=" + item.id).append
            ($("<div></div>").addClass("thumbnail").append($("<img>").attr("src", item.img)).append($("<div></div>").addClass("caption").append
            ($("<p>").addClass("text-center").append(item.name))))).append(btnTd);
            $("#infor").append(div);
        });
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
                to_page(0);
            });
            prePageLi.click(function () {
                to_page(result.extend.pageInfo.pageNum - 1);
            });
        }


        var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
        var lastPageLi = $("<li></li>").append($("<a></a>").append("末页").attr("href", "#"));
        if (result.extend.pageInfo.hasNextPage == false) {
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        } else {
            nextPageLi.click(function () {
                // alert(result.extend.pageInfo.pageNum +1)
                to_page(result.extend.pageInfo.pageNum + 1);
            });
            lastPageLi.click(function () {
                to_page(result.extend.pageInfo.pages);
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
                to_page(item);
            });
            ul.append(numLi);
        });
        //添加下一页和末页 的提示
        ul.append(nextPageLi).append(lastPageLi);

        //把ul加入到nav
        var navEle = $("<nav></nav>").append(ul);
        navEle.appendTo("#page_nav_area");
    }

    $("#searchbox").on("input", function () {
        $("#inforlist").empty();
        var name = $(this).val()
        if ($(this).val().length > 0) {
            $.ajax({
                url: "search_list",
                data: "name=" + name,
                type: "post",
                success: function (result) {
                    build_search_info(result);

                }
            });
        }
    })

    function build_search_info(result) {
        $("#inforlist").empty();
        var list = result.extend.listInfo.list;
        $.each(list, function (index, item) {
            if (index == 8)
                return false
            var option = $("<option></option>").addClass("option1").append($("<a></a>").addClass("a").attr("href", "details?id=" + item.id).append(item.name))
            $("#inforlist").append(option)
        })
    }

    $(document).on("click", ".delete_btn", function () {
        var dishName = $(this).parent().parent().find("p:eq(0)").text()
        var dishId = $(this).attr("del-id");
        if (confirm("确认删除【" + dishName + "】吗？")) {
            $.ajax({
                url: "${APP_PATH}/deleteById/" + dishId,
                type: "DELETE",
                success: function (result) {
                    alert(result.msg)
                    to_page(currentPage);
                }
            })
        }
    })

    $(document).on("click", ".edit_btn", function () {
        var dishId = $(this).attr("edit-id")
        $.ajax({
            url: "${APP_PATH}/selectId/" + dishId,
            type: "GET",
            success: function (result) {
                console.log(result)
                var dishData = result.extend.pageInfo;
                $("#id").val(dishData.id)
                $("#dish_update").html(dishData.name);
                // var ingredients = dishData.ingredients.split('/')
                // $.each(ingredients, function (index, item) {
                //     alert(item)
                //     var strArray = item.split(':');
                //     alert(strArray)
                //     var n = $("<input>").addClass('form-control').val(strArray[0])
                //     $("#introduction").append(n)
                //
                // })
                $("#introduction").val(dishData.introduction)
                $("#type").val(dishData.type)
                $("#practices").val(dishData.practices)

            }
        })
        $("#updateModel").modal({
            backdrop: "static"
        })
    })

    $("#save").click(function () {
       $.ajax({
           url:"updateDish",
           type:"POST",
           data:{type:$("#type").val(), introduction:$("#introduction").val(), practices:$("#practices").val(), id:$("#id").val()},
           success:function (result) {
               alert(result.msg)
               $("#updateModel").modal('hide');
           }
       })
    })


</script>
</html>
