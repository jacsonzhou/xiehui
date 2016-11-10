<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/9/29
  Time: 9:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="ming800" uri="http://java.ming800.com/taglib" %>
<!doctype html>
<html class="no-js">
<head>
  <title><ming800:status name="group" dataType="document.group" checkedValue="${document.group}" type="normal"/></title>
</head>
<body>

<div class="main-right">
  <div class="article">
    <div class="title">

      <h1>${document.title}</h1>
      <div style="float:right;margin-top:35px"  >
        <c:if test="${not empty document.name}">
          <span>发布人：${document.name}</span>
        </c:if>
        <c:if test="${empty document.name}">
          <span>发布人：e飞蚁</span>
        </c:if>
        <c:if test="${not empty document.publishDate}">
          <span>发布日期：<fmt:formatDate value="${document.publishDate}" pattern="yyyy年MM月dd日"/></span>
        </c:if>
      </div>

    </div>
    <div class="article-con">
      <div class="bd fubiao">
         <%--<c:if test="${not empty document.name}">--%>
        <%--<span>发布人：e飞蚁</span>--%>
         <%--</c:if>--%>
        <%--<c:if test="${not empty document.publishDate}">--%>
          <%--<span>发布日期：<fmt:formatDate value="${document.publishDate}" pattern="yyyy年MM月dd日"/></span>--%>
        <%--</c:if>--%>
        <%--<span>阅读次数：5085次</span>--%>
      </div>
      ${document.documentContent.content}
      <%--<p class="img"><img src="scripts/upload/exp7.jpg" alt=""></p>--%>
      <%--<p>2015年8月16日上午，由中国非物质文化遗产保护协会主办、中国非遗产业研究院、龙仕文化产业集团承办、中国文化智库中心、宜兴市国礼紫砂艺术馆、北京战元国泰拍卖有限公司、北京华艺富家文化有限公司协办的中国非物质文化遗产战略发展联盟成立仪式及其论坛在北京举行，这标志着我国推动非遗保护与发展能 力建设迈出新的战略步伐。来自中国非物质文化遗产保护协会总部以及沉香文化、玉文化、紫砂文化、陶瓷文化、文房四宝、扬州工艺、旗袍设计、砚文化等各领域 的专家学者代表共30余人参加了会议。</p>--%>
      <%--<p>联盟成立仪式上，中国非物质文化遗产保护协会副秘书长华庆先生宣布成立中国非物质文化遗产战略发展联盟的决定并宣布首届理事长、副理事长、秘书长、副秘书 长任命。龙金平女士为理事长，西沐先生为常务副理事长,华庆先生为秘书长，柯俊峰先生为常务副秘书长，黄中、李涛、周鑫、杨清为副秘书长;龙金平、西沐、 张錩、言恭达、张淑芬、张志平、骆礼刚、李庚、丁杰、吕金泉、汪成琼、华庆、杨舒闵、周永平为常务理事。中国非物质文化遗产保护协会副会长、中国非物质文 化遗产保护协会战略发展联盟理事长龙金平女士,中国文化产业智库研究中心首席科学家中国非物质文化遗产保护协会战略发展联盟常务副理事长西沐先生、龙仕文化产业集团董事长、中国非遗战略发展联盟秘书长华庆先生为中国非物质文化遗产战略发展联盟揭牌并先后致辞。同时，中国非遗战略发展联盟常务副理事长西沐 宣布同意成立沉香专业委员会，旗袍专业委员会,扬州工等专业委员会的决定。--%>
      <%--</p>--%>
      <%--<p>在联盟成立仪式之后，会议还专门就非物质文化遗产的理论研究、非遗资源管理、非遗保护与传承、非遗信息与网络建设、非遗文化输出、非遗科技应用,以及联盟 与各专业委员会、理事单位的合作以及评估等主题举办了相应的论坛西沐先生就“重视非遗资源的战略地位与作用”作了主旨发言,故宫博物院张淑芬研究员对 “中国文房四宝非物遗的传承与保护”发表了自己的意见，扬州文联主席也在成立仪式上畅谈了扬州工的历史与未来，华庆秘书长在总结发言中也对与会专家积极建言献策给予了高度评价。</p>--%>
    </div>
  </div>

</div>
<!--//End--home-->
</body>
</html>
