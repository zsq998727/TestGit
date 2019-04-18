<%--
  Created by IntelliJ IDEA.
  User: zsq
  Date: 2019/1/7
  Time: 18:38
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
    <title>苏菜</title>
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
                <li role="presentation" class="active"><a href="sucai">苏菜</a></li>
                <li role="presentation"><a href="mincai">闽菜</a></li>
                <li role="presentation"><a href="zhecai">浙菜</a></li>
                <li role="presentation"><a href="huicai">徽菜</a></li>
            </ul>
        </div>
    </div>
</div>

<div class="container" style="margin-top: 20px;">
    <div class="row">
        <div class="col-xs-12">
            <h2>苏菜</h2>
            <p id="introduction">
                江苏菜系。由徐海、淮扬、南京和苏南四种风味组成，在清代的时候，苏菜流行于全国，相当于现在川菜、粤菜的地位。苏菜中的
                一支——淮扬菜系曾为宫廷菜，目前国宴中的大多数菜肴仍属于淮扬菜。因此，淮扬菜亦称国菜。它起始于南北朝、唐宋时，当时经济发展，推动饮食业的繁荣，苏菜成为“南食”两大台柱之一。明清时期，苏菜南北沿运河、东西沿长江的发展更为迅速。沿海的地理优势扩大了苏菜在海内外的影响。
                江苏菜是由苏州、淮安、南京、镇江四大菜为代表而构成的。其特点是浓中带淡，鲜香酥烂，原汁原汤浓而不腻，口味平和，咸中带甜。
            </p>
            <p><strong>特点：</strong>擅长炖、焖、蒸、炒，重视调汤，保持原汁，风味清鲜，浓而不腻，淡而不薄，酥松脱骨而不失其形，滑嫩爽脆而不失其味。</p>
            <p><h3>经典菜品：</h3><br>水晶肴肉——肉质鲜红，皮白光洁晶莹，卤冻透明，质地醇酥，油润不腻，滋味鲜香。<br>
                推荐指数★★★☆☆<br>
                红烧狮子头——有肥有瘦的肉红润油亮，光看就引动食欲，醇香味浓的肉块与汁液，是令人无法抵挡的顶级美味。<br>
                推荐指数★★★★★
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
            data: {"pn": pn, "type": "苏菜"},
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
