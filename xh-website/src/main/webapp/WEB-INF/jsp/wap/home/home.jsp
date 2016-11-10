<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <meta charset="UTF-8">
  <title>首页</title>
  <link rel="stylesheet" href="<c:url value="/shop2015/assets/css/layout.css"/>">
</head>
<body>
<article>
  <header class="header">
    <a href="" class="left_btn menu" id="menu"></a>
    <a href="http://chinaich.org" class="logo"></a>
  </header>
  <!--//header-->

  <div class="swiper-container">
    <div class="swiper-wrapper">
      <c:if test="${bannerList != null}">
        <c:forEach items="${bannerList}" var="banner">
          <div class="swiper-slide"><a href="${banner.directUrl}" target="_blank"><img src="${banner.imageUrl}@!home1-banner" alt=""></a></div>
        </c:forEach>
      </c:if>
    </div>
    <div class="swiper-pagination"></div>
  </div>
  <!--//swiper-container-->

  <div class="list">
    <div class="title">
      <h3>协会新闻</h3>
      <a href="<c:url value="/wap/newsList"/>" class="more">更多&gt;</a>
    </div>
    <ul class="content2">
      <c:if test="${newList!=null}">
      <c:forEach items="${newList}" var="news" begin="0" end="4">
      <li>
        <a href="<c:url value="/wap/details/"/>${news.id}">
            <p class="name">${news.title}</p>
        </a>
            <p class="desc">${news.sampleContent}...</p>
            <p class="time">
                ${fn:substring(news.publishDate, 0, 10)}
            </p>
        </a>
      </li>
      </c:forEach>
      </c:if>
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

<div class="drawer" id="drawer">
  <div class="nav">
    <a href="" class="close" id="close"></a>
    <a class="active" href="<c:url value="/init/home.do"/>">首页</a>
    <a href="<c:url value ="/wap/statement?qm=plistAssociationIntroduction_default"/>">协会概况</a>
    <a href="<c:url value ="/wap/newsList"/>">新闻公告</a>
    <a href="<c:url value ="/wap/poliAndReguList"/>">政策法规</a>
    <a href="<c:url value ="/wap/declare.do?qm=plistMaterial_default"/>">在线申报</a>
    <a href="http://minglu.efeiyi.com/minglu">非遗百科</a>
    <a href="http://master.efeiyi.com">非遗大师</a>
    <a href="<c:url value ="/wap/statement?qm=plistOrganization_default"/>">组织机构</a>
    <a href="<c:url value ="/wap/statement?qm=plistContact_default"/>">联系我们</a>
  </div>
  <div class="overbg"></div>
</div>




<script src="/shop2015/assets/js/common.js"></script>
<script src="/shop2015/assets/js/system.js"></script>
<script style="">

</script>
</body>
</html>