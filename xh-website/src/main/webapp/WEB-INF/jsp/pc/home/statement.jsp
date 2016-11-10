<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>搜索-内容</title>
  <link rel="stylesheet" href="/shop2015/css/layouts.css">
</head>
<body>
<!--Start head-->
<div class="bd head">
  <div class="hd">
    <a class="logo" href=""><img src="<c:url value="/shop2015/images/logo.png"/>" alt=""></a>
    <div class="social">
      <a class="icon1"></a>
      <a class="icon2"></a>
      <div class="layer">
        <img style="display: none;" src="<c:url value="/shop2015/images/code_weibo.png"/>" alt="">
        <img style="display: block;" src="<c:url value="/shop2015/images/code_wechat.png"/>" alt="">
      </div>
    </div>
    <form action="<c:url value="/news/search.do"/>">
      <input class="txt" type="text" name='q'value="">
      <input class="btn" type="submit" value="">
    </form>
  </div>
</div>
<!--//End head-->

<!--Start header-->
<div class="bd header">
  <div class="nav hd">
    <ul>
      <li><a class="link" href="<c:url value="/home/home.do"/>" title="">首页<i class="line"></i></a></li>
      <li><a class="link" href="<c:url value="/association/association.do?qm=plistAssociationIntroduction_default"/>" title="">协会概况<i class="line"></i></a></li>
      <li><a class="link" href="<c:url value="/organization/organization.committee.do?qm=plistCommitteeAssociation_default"/>" title="">下属机构<i class="line"></i></a></li>
      <li><a class="link" href="<c:url value="/news/news.do?qm=plistNewsOrganization_default"/>" title="">新闻公告<i class="line"></i></a></li>
      <li><a class="link" href="<c:url value="/protection/protection.do?qm=plistLaw_default"/>" title="">政策法规<i class="line"></i></a></li>
      <li><a class="link" href="http://minglu.efeiyi.com" target="_blank" title="">非遗百科</a></li>
    </ul>
  </div>
</div>
<!--//End header-->

<!--Start main-->
<div class="bd statement">
  <div class="hd">
    <div class="title">
      <h1>网站声明</h1>
    </div>
    <div class="content">
      <c:if test="${documentList!=null && documentList.size()>0}">
        <c:forEach items="${documentList}" var="document" begin="0" end="1">
          ${document.sampleContent}
        </c:forEach>
      </c:if>
    </div>
  </div>
</div>
<!--//End main-->




<div class="bd footer">
  <div class="hd">
    <div class="links">
      <a href="<c:url value="/association/association.do?qm=plistAssociationIntroduction_default"/>" target="_blank" title="关于我们">关于我们</a>
      <a class="line"></a>
      <a href="<c:url value="/association/association.do?qm=plistContact_default"/>" target="_blank" title="联系我们">联系我们</a>
      <a class="line"></a>
      <a href="<c:url value="/web/websiteStatement.do?qm=plistAssociationStatement_default"/>" target="_blank" title="网站声明">网站声明</a>
      <a class="line"></a>
      <a href="<c:url value="/web/websiteStatement.do?qm=plistFeedback_default"/>" target="_blank" title="意见反馈">意见反馈</a>
      <a class="line"></a>
      <a href="<c:url value="/protection/protection.declare.do?qm=plistMaterial_default"/>" target="_blank" title="在线申报">在线申报</a>
      <a class="line"></a>
      <a href="<c:url value="/news/news.do?qm=plistNewsOrganization_default"/>" target="_blank" title="新闻资讯">新闻资讯</a>
    </div>
    <!--//End-->
    <div class="cooperative">
      <div class="title"><i class="line"></i><strong>合作机构</strong><i class="line"></i></div>
      <div class="logos">
        <a href="http://en.unesco.org/ " target="_blank"><i class="icon1"></i><p>联合国教科文组织</p></a>
        <a href="http://www.mcprc.gov.cn/" target="_blank"><i class="icon2"></i><p>中华人民共和国文化部</p></a>
        <a href="http://www.zgysyjy.org.cn/show/zgysyjy/html/index.html " target="_blank"><i class="icon3"></i><p>中国艺术研究院</p></a>
        <a href="http://www.efeiyi.com" target="_blank"><i class="icon4"></i><p>非物质文化遗产互联网平台</p></a>
      </div>
    </div>
    <!--//End-->
    <div class="copyright">Copyright@2012-2022中国非物质文化遗产保护协会版权所有—京ICP备16047258号</div>
  </div>
</div>


<script src="scripts/js/jquery.min.js"></script>
<script src="scripts/js/system.js"></script>
<script type="text/javascript">
  $(function() {
    $('#focus').slideFocus();
    $('#masterRoll').slideRoll(3);
    $('#wikiRoll').slideRoll(2);
  });
</script>

</body>
</html>


