<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>菜品上传</title>
    <link rel="stylesheet" type="text/css" href="static/bootstrap/css/bootstrap.min.css">

    <script type="text/javascript" src="static/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="static/bootstrap/js/bootstrap.min.js"></script>
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

        .btn dropdown-toggle btn-default {
            height: 20px;
            width: 100px;
        }

    </style>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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

<div class="container" style="margin-top: 10px;">

    <ul class="nav nav-tabs" role="tablist" style="margin: 30px 10%;font-size: 20px">
        <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab"
                                                  data-toggle="tab">菜品上传</a></li>
    </ul>


    <div role="tabpanel" class="tab-pane active" id="home" style="margin: 30px 20%">
        <form action="onefile"
              method="post" enctype="multipart/form-data" >
            <input type="hidden" name="user" value="${userInfo.name}">
            <div class="form-group" style="margin-top: 10px">
                <label style="font-size: 16px; font-family: 'arial'">标&nbsp题</label>
                <input type="text" class="form-control" id="dishName" style="margin-top: 10px" name="name">
                <span class="help-block"></span>
            </div>
            <div class="form-group" style="margin-top: 10px">
                <label style="font-size: 16px; font-family: 'arial'">分&nbsp类</label>
                <select class="form-control" style="width: 192px" name="type">
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
            <div class="form-group" style="margin-top: 10px">
                <label style="font-size: 16px; font-family: 'arial'">描&nbsp述</label>
                <textarea class="form-control" rows="10" cols="30" style="margin-top: 10px; height: 120px" placeholder="说说这道菜背后的小故事"
                          name="introduction" id="introduction"></textarea>
                <span class="help-block"></span>
            </div>
            <div class="form-group" style="margin-top: 10px">
                <label style="font-size: 16px; font-family: 'arial';">材&nbsp料</label>
                <div class="input-group" id="infor">
                    <input type="text" class="form-control" placeholder="如：青菜"
                           style="width: 200px; margin-top: 10px" id="food">
                    <input type="text" class="form-control" placeholder="如：250克"
                           style="width: 100px; margin: 10px 20px">
                    <input type="hidden" id="ingredients" name="ingredients">
                </div>
                <button class="btn btn-primary" style="margin-top: 20px" id="add"><span
                        class="glyphicon glyphicon-plus"></span>点击继续添加
                </button>
            </div>
            <div class="form-group" style="margin-top: 10px">
                <label style="font-size: 16px; font-family: 'arial'">做&nbsp法</label>
                <textarea class="form-control" rows="10" cols="30"style="margin-top: 10px; height: 120px" name="practices"
                          id="practices"></textarea>
                <span class="help-block"></span>
            </div>
            <div class="form-group">
                <label style="font-size: 16px; font-family: 'arial'">封&nbsp面</label>
                <%--<input type="file" name="file"/>--%>
                <img id="cropedBigImg" value='custom' data-address='' title="自定义背景"
                     style="width: 200px; height: 200px; display: none" name="img"/>
                <input type="file" id="chooseImage" name="file" style="margin-top: 5px">
            </div>
            <div class="text-center">
                <input type="submit" class="btn btn-warning" id="onload" value="上 传"/>
                <span class="help-block"></span>
            </div>
        </form>
    </div>
</div>
</body>
<script type="text/javascript">
    $("#add").click(function () {
        $("#infor").append("<input type=\"text\" class=\"form-control\" style=\"width: 200px; margin-top: 10px\"> <input type=\"text\" class=\"form-control\"  style=\"width: 100px; margin:10px 20px\">");
        return false;
    })

    $("#onload").click(function () {
        if ($("#food").val().length == 0) {
            show_validate_msg("#onload", "error", "材料不能为空")
            $("#onload").attr("ajax-va", "error")
        } else {
            $("#onload").attr("ajax-va", "success")
        }

        if ($("#chooseImage").val().length == 0) {
            show_validate_msg("#onload", "error", "请上传图片")
            $("#onload").attr("ajax-va", "error")
        } else {
            $("#onload").attr("ajax-va", "success")
        }
        var name = '';
        $("#infor input[type=text]").each(function (i) {
            if (this.value != "") {
                name += this.value;
                if (i % 2 == 0) {
                    name += ":"
                } else {
                    name += "/"
                }
            }
            $("#ingredients").attr({"value": name})
        })
        if ($(this).attr("ajax-va") == "error") {
            return false;
        }else{
            alert(1)
            window.location.href = "index.jsp"
        }
    })

    $('#chooseImage').on('change', function () {
        var filePath = $(this).val();         //获取到input的value，里面是文件的路径
        var fileFormat = filePath.substring(filePath.lastIndexOf(".")).toLowerCase();
        // 检查是否是图片
        if (!fileFormat.match(/.png|.jpg|.jpeg/)) {
            error_prompt_alert('上传错误,文件格式必须为：png/jpg/jpeg');
            return;
        }
        var src = window.URL.createObjectURL(this.files[0]); //转成可以在本地预览的格式
        $("#cropedBigImg").css("display", "block")
        $('#cropedBigImg').attr('src', src);
    });

    $("#dishName").blur(function () {
        if ($(this).val().length == 0) {
            show_validate_msg("#dishName", "error", "不能为空")
            $("#onload").attr("ajax-va", "error")
        } else {
            show_validate_msg("#dishName", "success", "")
            $("#onload").attr("ajax-va", "success")
        }
    })

    $("#introduction").blur(function () {
        if ($(this).val().length == 0) {
            show_validate_msg("#introduction", "error", "不能为空")
            $("#onload").attr("ajax-va", "error")
        } else {
            show_validate_msg("#introduction", "success", "")
            $("#onload").attr("ajax-va", "success")
        }
    })

    $("#practices").blur(function () {
        if ($(this).val().length == 0) {
            show_validate_msg("#practices", "error", "不能为空")
            $("#onload").attr("ajax-va", "error")
        } else {
            show_validate_msg("#practices", "success", "")
            $("#onload").attr("ajax-va", "success")
        }
    })


    function show_validate_msg(ele, status, msg) {
        //清除当前元素的校验状态
        $(ele).parent().removeClass("has-success has-error");
        $(ele).next("span").text("");
        if ("success" == status) {
            $(ele).parent().addClass("has-success");
            $(ele).next("span").text(msg);
        } else if ("error" == status) {
            $(ele).parent().addClass("has-error");
            $(ele).next("span").text(msg);
        }
    }
</script>
</html>