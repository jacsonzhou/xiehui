<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="ming800" uri="http://java.ming800.com/taglib" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/9/12
  Time: 11:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>中国非物质文化遗产保护协会-搜索列表</title>
  <link rel="stylesheet" href="/shop2015/css/layouts.css">
</head>
<body>
<!--Start main-->
<div class="bd listof">
  <div class="hd">
    <div class="search-result">
      <ul>
      <c:if test="${newsList!=null}">
        <c:forEach items="${newsList}" var="news">
        <li>
          <a href="javascript:void(0)" onclick="homeMatchJNodes('${news.id}', 8,'SubordinateInstitutionManagement')" target="_parent" target="_blank" title="">${news.title}</a>
          <p>${news.sampleContent}</p>
        </li>
        </c:forEach>
       </c:if>
      </ul>
    </div>
  </div>
</div>
<!--//End main-->


<script src="/shop2015/js/jquery.min.js"></script>
<script src="/shop2015/js/system.js"></script>
<script type="text/javascript">
  $(function() {
    $('#focus').slideFocus();
    $('#masterRoll').slideRoll(3);
    $('#wikiRoll').slideRoll(2);
    $('.main-left').hide();
  });
</script>
<script type="text/javascript">
  function homeMatchJNodes(id, matchJNode, currentJNode) {
    var jMenu = document.getElementById("jmenu").value;
    var url = ' <c:url value="/view/newView.do"/>' + "?id=" + id + "&jmenu=" + jMenu + "&currentJnode=" + currentJNode + "&matchJnode=" + matchJNode;
    window.location = url;
  }
</script>
</body>
</html>
