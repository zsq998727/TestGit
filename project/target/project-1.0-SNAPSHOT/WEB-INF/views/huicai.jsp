<%--
  Created by IntelliJ IDEA.
  User: zsq
  Date: 2019/1/7
  Time: 18:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="static/bootstrap/css/bootstrap.min.css">

    <script type="text/javascript" src="static/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="static/bootstrap/js/bootstrap.min.js"></script>

    <script type="text/javascript" src="static/js/vue.js"></script>
    <title>徽菜</title>
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

        .thumbnail img  {
            width: 100%;
            height: 160px;
        }

        .damu_carousel .carousel-inner .item img {
            width: 100%;
            height: 300px;
        }

        body {
            overflow-y: scroll;
        }
        #introduction{
            text-indent:2em;
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
        <div class="collapse navbar-collapse" >
            <ul class="nav nav-tabs">
                <li role="presentation" ><a href="index_page">首页</a></li>
                <li role="presentation"><a href="ranking">排行榜</a></li>
                <li role="presentation"><a href="vote">投票</a></li>
                <li role="presentation"><a href="xiangcai">湘菜</a></li>
                <li role="presentation"><a href="yuecai">粤菜</a></li>
                <li role="presentation"><a href="chuancai">川菜</a></li>
                <li role="presentation"><a href="lucai">鲁菜</a></li>
                <li role="presentation"><a href="sucai">苏菜</a></li>
                <li role="presentation"><a href="mincai">闽菜</a></li>
                <li role="presentation"><a href="zhecai">浙菜</a></li>
                <li role="presentation" class="active"><a href="huicai">徽菜</a></li>
            </ul>
        </div>
    </div>
</div>

<div class="container" style="margin-top: 20px;">
    <div class="row" id="row">
        <div class="col-xs-12">
            <h2>徽菜</h2>
            <p id="introduction">
                徽菜是指徽州菜，起源于黄山麓下的歙县（古徽州）。后来，由于新安江畔的屯溪小镇成为"祁红"、"屯绿"等名茶和徽墨、
                歙砚等土特产品的集散中心，商业兴起，饮食业发达，徽菜也随之转移到了屯溪，并得到了进一步发展。徽菜以烹制山珍野味而著称。
            </p>
            <p><strong>特点：</strong>擅长烧、炖、蒸，而爆、炒菜少，重油、重色，重火功</p>
            <p><h3>经典菜品：</h3><br>腌鲜鳜鱼——菜香鲜透骨，鱼肉酥烂，风味独特<br>
                推荐指数★★★★★<br>
                红烧果子狸——菜色金黄，汤汁稠亮，狸肉细烂浓香，味鲜甜带有微咸，是冬季时菜中的珍品。<br>
                推荐指数★★★★☆<br>
            </p>
        </div>
    </div>
    <hr/>
    <div class="row" id="infor"></div>

    <div class="row">
        <!--分页文字信息  -->
        <div class="col-md-6" id="page_info_area"></div>
        <!-- 分页条信息 -->
        <div class="col-md-6" id="page_nav_area">

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
            url: "page",
            data: {"pn": pn, "type": "徽菜"},
            type: "get",
            success: function (result) {
                if(result.extend.pageInfo.pageNum == 1){
                    build_img_one(result);
                }else{
                    build_img_two(result);
                }
                build_page_info(result);
                build_page_nav(result)
            }
        });
    }

    function build_img_one(result) {
        $("#row").css("display", "block")
        $("#infor").empty();
        var emps = result.extend.pageInfo.list;
        $.each(emps, function (index, item) {
            var div = $("<div></div>").addClass("col-lg-3 col-md-4 col-sm-6").append($("<a></a>").attr("href", "details?id=" + item.id).append
            ($("<div></div>").addClass("thumbnail").append($("<img>").attr("src", item.img)).append($("<div></div>").addClass("caption").append
            ($("<p>").addClass("text-center").append(item.name)))));
            $("#infor").append(div);
        });
    }

    function build_img_two(result) {
        $("#row").css("display", "none")
        $("#infor").empty();
        var emps = result.extend.pageInfo.list;
        $.each(emps, function (index, item) {
            var div = $("<div></div>").addClass("col-lg-3 col-md-4 col-sm-6").append($("<a></a>").attr("href", "details?id=" + item.id).append
            ($("<div></div>").addClass("thumbnail").append($("<img>").attr("src", item.img)).append($("<div></div>").addClass("caption").append
            ($("<p>").addClass("text-center").append(item.name)))));
            $("#infor").append(div);
        });
    }


    function build_page_info(result) {
        $("#page_info_area").empty();
        $("#page_info_area").append("当前" + result.extend.pageInfo.pageNum + "页,总" +
            result.extend.pageInfo.pages + "页,总" + result.extend.pageInfo.total + "条记录")

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
    $(function () {
        $('#carousel-example-generic').carousel({
            interval: 2000
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
