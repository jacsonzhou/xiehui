<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <meta charset="UTF-8">
  <title>新闻公告详情页</title>
  <link rel="stylesheet" href="/shop2015/assets/css/layout.css">
</head>
<body>
<article>
  <header class="header">
    <a href="javascript:history.go(-1)" class="left_btn back"></a>
  </header>
  <!--//header-->

  <div class="detail">
    <div class="rule">
      <div class="title">${document.title}</div>
      <div class="time">
        ${fn:substring(document.publishDate, 0, 10)}
        <c:if test="${not empty document.name}">
        <strong>${document.name}</strong>
        </c:if>
        <c:if test="${empty document}">
        <strong>efeiyi</strong>
        </c:if>

      </div>
      ${document.documentContent.content}
    </div>
  </div>
  <footer class="footer">
    <div class="content">
      <div class="title"><span>合作机构</span></div>
      <div class="partner">
        <a class="link" href="http://en.unesco.org/ "><span>联合国教科文组织</span></a>
        <a class="link" href="http://www.zgysyjy.org.cn/show/zgysyjy/html/index.html "><span>中国艺术研究院</span></a>
        <a class="link" href="http://www.mcprc.gov.cn/"><span>中华人民共和国文化部</span></a>
        <a class="link" href="http://www.efeiyi.com"><span>非物质文化遗产互联网平台</span></a>
      </div>
    </div>
    <!--//content-->
    <div class="copyright">
      <p>Copyright@2012-2022</p>
      <p>中国非物质文化遗产保护协会版权所有—京ICP备16047258号</p>
    </div>
  </footer>
</article>


</body>
</html>