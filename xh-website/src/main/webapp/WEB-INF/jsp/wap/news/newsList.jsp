<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html lang="en">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta charset="UTF-8">
    <title>新闻公告列表页</title>
    <link rel="stylesheet" href="/shop2015/assets/css/layout.css">
</head>
<body>
<article>
    <header class="header">
        <a href="javascript:history.go(-1)" class="left_btn back"></a>
        <h1>新闻公告</h1>
    </header>
    <!--//header-->


    <div class="list">
        <ul class="content2">

            <c:forEach items="${newList}" var="note" varStatus="status">
                <li>
                    <a href="<c:url value="/wap/details/"/>${note.id}">
                            <p class="name">
                                <c:if test="${fn:length(note.title)>40}">
                                    ${fn:substring(note.title,0,36)}...
                                </c:if>
                                <c:if test="${fn:length(note.title)<=40}">
                                    ${note.title}
                                </c:if>
                            </p>
                    </a>
                            <p class="desc">
                          ${note.sampleContent}
                            </p>
                            <p class="time">${fn:substring(note.publishDate, 0, 10)}</p>

                </li>
            </c:forEach>
            <c:forEach items="${noteList}" var="note" varStatus="status">
                <li>
                    <a href="<c:url value="/wap/details/"/>${note.id}">
                        <p class="name">${note.title}</p>
                    </a>
                        <p class="desc">${note.sampleContent}...</p>
                        <p class="time">${fn:substring(note.publishDate, 0, 10)}</p>
                    </a>
                </li>
            </c:forEach>
            <c:forEach items="${organizationNewsList}" var="note" varStatus="status">
                <li>
                    <a href="<c:url value="/wap/details/"/>${note.id}">
                            <p class="name">${note.title}</p>
                    </a>
                            <p class="desc">${note.sampleContent}...</p>
                            <p class="time">${fn:substring(note.publishDate, 0, 10)}</p>
                    </a>
                </li>
            </c:forEach>
        </ul>
    </div>
    <!--//list-->

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
    <!--//footer-->
</article>
</body>

</html>