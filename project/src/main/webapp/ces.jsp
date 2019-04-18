<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    pageContext.setAttribute("APP_PATH", request.getContextPath());
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>

    <script type="text/javascript" src="static/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="static/bootstrap/js/bootstrap.min.js"></script>
    <style>

    </style>
</head>
<body>

<input list="cars" id="input" onchange="inputSelect()"/>
<datalist id="cars">
    <option value="111" data-value="111" data-id="1">
    <option value="122" data-value="122" data-id="2">
    <option value="1222" data-value="1222" data-id="4">
</datalist>
</body>
<script>
    function inputSelect() {
    var input_select = $("#input").val();
    var option_length = $("option").length;
    var option_id = '';
    for (var i = 0; i < option_length; i++) {
        var option_value = $("option").eq(i).attr('value');
        if (input_select == option_value) {
            option_id = $("option").eq(i).attr('data-id');
            break;
        }
    }
    console.log(input_select, option_length, option_id);
}
</script>

</html>
