<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/7/21
  Time: 14:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>首页</title>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="description" content="这是一个 index 页面">
  <meta name="keywords" content="中国非遗协会,中国非物质文化遗产保护协会,非遗协会,非物质文化遗产,非遗,中国非物质文化遗产战略发展联盟,非遗战略发展联盟,非遗联盟,中国非遗备案中心,非遗备案,文化遗产,非遗官网,非遗联盟官网,e飞蚁"/>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <link rel="icon" type="image/png" href="<c:url value='/scripts/images/favicon.png'/>">
    <link rel="apple-touch-icon-precomposed" href="<c:url value='/resources/assets/i/app-icon72x72@2x.png'/>">
    <meta name="apple-mobile-web-app-title" content="Amaze UI"/>
  <link type="text/css" rel="stylesheet" href="<c:url value='/shop2015/css/layouts.css'/>">
  <sitemesh:write property='head'/>
  <style>
    .pal-active {
      background-color: #9a9a9a;
    }
  </style>
</head>
<body>

    <sitemesh:write property='body'/>

</div>
</body>
</html>
