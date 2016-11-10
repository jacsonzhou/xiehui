<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/7/16
  Time: 9:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title></title>
</head>
<body>
<br>
<br>
<br>
<br>
<br>
<br>

<div>
    <div align="center">
        <h1><img src="<c:url value='/resources/images/logo.png'/>" width="300" height="136"/></h1>
    </div>
</div>
<br>
<br>
<br>

<div align="center">
    <h1><p style="color: #0000FF;font-size: larger">欢迎使用诚品宝后台管理系统</p></h1>
    <%--<form action="/Label/http.do" method="post" id="formx">--%>
    <div id="params">
    <div>地址：<input type="text" name="url" id="url" value="/Label/test.do"/></div>
    <div>参数:<input type="text" name="param">值:<input type="text" name="val"></div>
    </div>
    <%--</form>--%>
    <div><input type="button" onclick="addParam()" value="添加参数"><input type="button" onclick="mySubmit()" value="提交"></div>
    <div>response：</div>
    <textarea id="result" rows="10" cols="50"></textarea>
</div>
<br>
<br>
<br>
<br>
<br>
<br>
<script type="text/javascript">
    function mySubmit() {
        var params = $("[name='param']");
        var vals = $("[name='val']");
        var finalParam = "?";
        for (var x = 0; x < params.length; x++) {
            console.log(params[x].value);
            if (params[x].value != "") {
                finalParam += params[x].value + "=" + vals[x].value + "&";
            }
        }
        finalParam += "url=" + $("#url").val();
        $.ajax({
            type: "get",
            url: "/Label/http.do" + finalParam,
//            contentType: "application/json; charset=utf-8",
//            cache: false,
//            dataType: "jsonp",
//            jsonp: "callback",
//            jsonpCallback: "jsonpCallback",
            success: function (data) {
                console.log(data);
                $("#result").html(data);
            },
            error: function (a, b, c) {
                console.log(b);
                $("#result").html(data);
            },
        });
    }


    function addParam(){
        var newDiv = $("<div>参数:<input type='text' name='param'>值:<input type='text' name='val'></div>");
        $("#params").append(newDiv);
    }
</script>
</body>
</html>
