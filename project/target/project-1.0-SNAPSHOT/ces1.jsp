<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2018/5/19
  Time: 17:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
    Date date = new Date();
    String nowDate = sdf.format(date);
%>
<html>
<head>
    <title>Title</title>
    <%--<link rel="stylesheet" href="<%=basePath%>/public/layui/src/css/layui.css"/>--%>
    <%--<link rel="stylesheet" href="<%=basePath%>/public/bootstrap/bootstrap.min.css"/>--%>
    <%--<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/public/css/bootstrap.min.css">--%>
    <%--<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/public/css/nprogress.css">--%>
    <%--<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/public/css/style.css">--%>
    <%--<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/public/css/font-awesome.min.css">--%>
    <%--<link rel="apple-touch-icon-precomposed" href="<%=request.getContextPath()%>/public/images/icon.png">--%>
    <%--<link rel="shortcut icon" href="<%=request.getContextPath()%>/public/images/favicon.ico">--%>

    <link rel="stylesheet" type="text/css" href="static/bootstrap/css/bootstrap.min.css">

    <script type="text/javascript" src="static/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="static/bootstrap/js/bootstrap.min.js"></script>


<%--图片css--%>
    <link rel="stylesheet" type="text/css"
          href="<%=request.getContextPath()%>/public/content/publishContent/css/picture.css">

</head>
<body>

<%--显示信息--%>
<div class="title">
    <h3>内容信息：</h3>
    <div class="more">
        <li><a data-cont="消息页" title="消息页"
               href="<%=request.getContextPath()%>/user/message?userid=${sessionScope.user.userid}">我的消息</a></li>
        <a href="<%=request.getContextPath()%>/user/selectPage" title="全部分享">全部分享</a>
        <a href="<%=request.getContextPath()%>/user/selectPage?otherid=${sessionScope.user.userid}"
           title="别人的分享">别人的分享</a>
        <a href="<%=request.getContextPath()%>/user/selectPage?userid=${sessionScope.user.userid}" title="我的分享">我的分享</a>
        <a href="<%=request.getContextPath()%>/user/publishContent" title="发布分享">发布分享</a>
    </div>
</div>
<article class="excerpt excerpt-${content.userid}" style="">
    <a class="focus" href="<%=request.getContextPath()%>/user/selectPage?userid=content.userid" title="分享圈"
       target="_blank">
        <div class="imgs"><img class="img" src="<%=request.getContextPath()%>/public/images/head.jpg"/></div>
    </a>

    <header>

        <h2><a href="#" title="用户" target="_blank">${content.userid}</a>
        </h2>
    </header>
    <p class="meta">
        <time class="time"><i class="glyphicon glyphicon-time"></i> ${content.createtime}</time>
        <span class="views"> <a class="comment" id="${content.id}" onclick="niceDetail(this.id)" title="点赞"
                                target="_blank"><i class="glyphicon glyphicon-comment" id="${content.id}"></i><span
                id="nice_${content.id}">${content.nice}</span> </a></span>
    </p>
    <p class="note">${content.content}</p>


    <%--图片--%>
    <div class="spu_img" id="spu_img">
        <div id="spu_img_div_0">
            <c:if test="${content.pic1 !=null }">
                <img id="img_1}" src="http://localhost:8089/SharedImageServer/contentpic/${content.pic1}" width="80px"
                     height="80px"/>
            </c:if>
            <c:if test="${content.pic2 !=null }">
                <img id="img_2" src="http://localhost:8089/SharedImageServer/contentpic/${content.pic2}" width="80px"
                     height="80px"/>
            </c:if>
            <c:if test="${content.pic3 !=null }">
                <img id="img_3}" src="http://localhost:8089/SharedImageServer/contentpic/${content.pic3}" width="80px"
                     height="80px"/>
            </c:if>
        </div>
    </div>
</article>

<!-- 留言的表单 -->
<form class="layui-form" action="<%=request.getContextPath()%>/user/addcomment" method="post" style="width:80%;">
    <input name="cUserid" value="${sessionScope.user.userid}" hidden="hidden"/>
    <input name="cOtherid" value="${content.userid}" hidden="hidden"/>
    <input name="cContentid" value="${content.id}" hidden="hidden"/>
    <input name="cState" value="0" hidden="hidden"/>
    <div class="layui-input-block" style="margin-left: 0;">
        <textarea id="cContent" name="cContent" placeholder="请输入你的留言" class="layui-textarea"
                  style="height: 150px;"></textarea>
    </div>
    <br/>
    <div class="layui-input-block" style="text-align: left;margin-left: 0;">
        <input type="submit" class="layui-btn" value="留言">
    </div>
</form>
<br/>

<!-- 留言信息列表展示 -->
<div>
    <ul>
        <!-- 先遍历留言信息（一条留言信息，下面的全是回复信息） -->
        <c:forEach items="${requestScope.commentList}" var="comment">
            <!-- 如果留言信息是在本文章下的才显示 -->
            <c:if test="${comment.cContentid eq content.id && comment.cOtherid eq content.userid}">
                <li style="border-top: 1px dotted #01AAED">
                    <br/>
                    <div style="text-align: left;color:#444">
                        <div>
                            <span style="color:#01AAED">${comment.cUserid}</span>
                        </div>
                        <div>${comment.cContent}</div>
                    </div>
                    <div>
                        <div class="comment-parent" style="text-align:left;margin-top:7px;color:#444">
                            <span>${comment.cCreatetime}</span>

                            <p>
                                <a href="javascript:;" style="text-decoration: none;"
                                   onclick="btnReplyClick(this)">回复</a>
                            </p>
                            <hr style="margin-top: 7px;"/>
                        </div>
                        <!-- 回复表单默认隐藏 start-->
                        <div class="replycontainer layui-hide" style="margin-left: 61px;">
                            <form action="<%=request.getContextPath()%>/user/addreply" method="post" class="layui-form">
                                <input name="rContentid" id="rContentid1" value="${content.id}" hidden="hidden"/>
                                <input name="rUserid" id="rUserid1" value="${sessionScope.user.userid}" hidden="hidden"/>
                                <input name="rOtherid" id="rOtherid1" value="${comment.cUserid}" hidden="hidden"/>
                                <input name="rWords" id="rWords1" value="${comment.cId}" hidden="hidden"/>
                                <input name="rState" id="rState" value="0" hidden="hidden"/>
                                <div class="layui-form-item">
                                    <textarea name="rContent" id="rContent" lay-verify="replyContent"
                                              placeholder="请输入回复内容" class="layui-textarea"
                                              style="min-height:80px;"></textarea>
                                </div>
                                <div class="layui-form-item">
                                    <button id="replyBtn" class="layui-btn layui-btn-mini" lay-submit="formReply"
                                            lay-filter="formReply">提交
                                    </button>
                                </div>
                            </form>
                        </div>

                    </div>

                    <!-- 以下是回复信息 -->
                    <c:forEach items="${requestScope.replyList}" var="reply">
                        <!-- 每次遍历出来的留言下存在回复信息才展示（本条回复信息是本条留言下的就显示在当前留言下） -->
                        <c:if test="${reply.rContentid eq content.id && reply.rWords eq comment.cId}">
                            <div style="text-align: left;margin-left:61px;color: #444">
                                <div>
                                    <span style="color:#5FB878">${reply.rUserid}  回复${reply.rOtherid}</span>
                                </div>
                                <div>${reply.rContent}</div>
                            </div>
                            <div>
                                <div class="comment-parent"
                                     style="text-align:left;margin-top:7px;margin-left:61px;color:#444">
                                    <span>${reply.rCreatime}</span>

                                    <p>
                                        <a href="javascript:;" style="text-decoration: none;"
                                           onclick="btnReplyClick(this)">回复</a>
                                    </p>
                                    <hr style="margin-top: 7px;"/>
                                </div>
                                <!-- 回复表单默认隐藏 -->
                                <div class="replycontainer layui-hide" style="margin-left: 61px;">
                                    <form action="<%=request.getContextPath()%>/user/addreply" method="post"
                                          class="layui-form">
                                        <input name="rContentid" id="rContentid" value="${content.id}" hidden="hidden"/>
                                        <input name="rUserid" id="rUserid" value="${sessionScope.user.userid}"
                                               hidden="hidden"/>
                                            <%--  <input name="rCreatime" id="rCreatime" value="<%=nowDate%>" hidden="hidden"/>--%>
                                        <input name="rOtherid" id="rOtherid" value="${comment.cUserid}"
                                               hidden="hidden"/>
                                        <input name="rWords" id="rWords" value="${comment.cId}" hidden="hidden"/>
                                            <%--<input name="rId" id="rId" value="${reply.rId}" hidden="hidden"/>--%>
                                        <div class="layui-form-item">
                                            <textarea name="rContent" id="rContent" lay-verify="replyContent"
                                                      placeholder="请输入回复内容" class="layui-textarea"
                                                      style="min-height:80px;"></textarea>
                                        </div>
                                        <div class="layui-form-item">
                                            <button id="replyBtn1" class="layui-btn layui-btn-mini"
                                                    lay-submit="formReply" lay-filter="formReply">提交
                                            </button>
                                        </div>
                                    </form>
                                </div>

                            </div>
                        </c:if>
                    </c:forEach>
                </li>
            </c:if>
        </c:forEach>
    </ul>
</div>

</body>
<script src="<%=basePath%>/public/js/jquery-3.2.1.min.js"></script>
<!-- 加载Layui的配置 -->
<script src="<%=basePath%>/public/layui/src/layui.js"></script>
<script type="text/javascript">
    layui.use('element', function () {
        var element = layui.element;
    });
</script>
<script type="text/javascript">
    function btnReplyClick(elem) {
        var $ = layui.jquery;
        if ($(this)) {
        } else if (!$(this)) {
            $(elem).parent('p').parent('.comment-parent').siblings('.replycontainer').toggleClass('layui-show');
        }
        $(elem).parent('p').parent('.comment-parent').siblings('.replycontainer').toggleClass('layui-hide');
        if ($(elem).text() == '回复') {
            $(elem).text('收起')
        } else {
            $(elem).text('回复')
        }
    }

    $("#replyBtn").click(function () {
        var rContentid = $("#rContentid1").val();
        var rUserid = $("#rUserid1").val();
        var rOtherid = $("#rOtherid1").val();
        var rContent = $("#rContent11").val();
        var rWords = $("#rWords1").val();
        var rState = $("#rState").val();
        $.ajax({
            url: '<%=request.getContextPath()%>/user/addreply',
            type: 'POST',
            data: [{
                rContentid: rContentid,
                rUserid: rUserid,
                rOtherid: rOtherid,
                rContent: rContent,
                rWords: rWords,
                rState: rState
            }],
            success: function (data) {
                layer.open({
                    title: '提示信息',
                    content: '留言成功',
                    btn: ['确定'],
                    /* btn1: function(index){
                       /!*  $("body").html(data);*!/
                     }*/
                });
            },
            error: function () {
                layer.open({
                    title: '提示信息',
                    content: '出现未知错误'
                });
            }
        });
    });

</script>
<script src="<%=request.getContextPath()%>/public/content/publishContent/js/content.js"></script>
<script type="text/javascript">

    //用户点赞操作
    function niceDetail(id) {
        var userid = $("#userid").val();
        $.ajax({
            type: 'post',
            url: '<%=request.getContextPath()%>/user/niceDetail',
            data: {contentid: id, userid: userid},
            success: function (data) {
                $("#nice_" + id).text(data);
            }
        });
    };

    //用户关注操作
    function followUser(id) {
        alert(id);
        var userid = $("#userid").val();
        alert(userid);
        newid = id.replaceAll("@qq.com", "");
        alert(newid);
        $("#" + id).attr("id", newid);

        $.ajax({
            type: 'post',
            url: '<%=request.getContextPath()%>/user/followsUser',
            data: {followuser: id, fromuser: userid},
            success: function (data) {
                alert(data);
                $("#" + newid).text(data);

            }
        });
    };


</script>

</html>