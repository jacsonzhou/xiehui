<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/9/28
  Time: 15:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ taglib prefix="ming800" uri="http://java.ming800.com/taglib" %>
<head>
  <style type="text/css">
    p{
      font-size: 14px;
      color: #333;
      line-height: 140%;
      margin-top: 0.5em;
      margin-bottom: 0.5em;
    }
    h2{
      font-size: 24px;
      line-height: 400%;
    }
  </style>
  <title>中国非物质文化遗产保护协会-非遗法</title>
</head>
<body>
<div class="main-right">
  <c:if test="${not empty documentList&&documentList.size()>0}">
    <c:forEach items="${documentList}" var="document">
    <h1>${document.title}</h1>
    </c:forEach>
  </c:if>
  <div class="div-list">
    <ul class="div-list-ul div-list-txt">
      <c:forEach items="${documentList}" var="document">
        ${document.documentContent.content}
      </c:forEach>
    </ul>
  </div>
  <!-- //End--pages-->
</div>
<!-- //End--slide-right-->
</div>
</div>

<%--<!-- //End--slide-right-->--%>
</div>
</div>

</body>
