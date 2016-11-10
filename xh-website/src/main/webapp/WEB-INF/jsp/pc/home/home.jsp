<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/9/24
  Time: 11:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html class="no-js">
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="baidu-site-verification" content="qQxMl1z8AX" />
    <meta name="renderer" content="webkit">
    <meta name="keywords" content="中国非遗协会,中国非物质文化遗产保护协会,非遗协会,非物质文化遗产,非遗,中国非物质文化遗产战略发展联盟,非遗战略发展联盟,非遗联盟,中国非遗备案中心,非遗备案,文化遗产,非遗官网,非遗联盟官网,e飞蚁"/>
    <title>中国非物质文化遗产保护协会-首页</title>
    <link rel="stylesheet" href="/shop2015/css/layouts.css">

</head>
<jsp:include flush="true"
             page="/xh/getMenu.do?jmenuId=AssociationMenu&resultPage=/jmenu/manageTemplateLeft&match=${requestScope['javax.servlet.forward.servlet_path']}%3F${fn:replace(pageContext.request.queryString,'&','%26')}"/>
<body>
<!--//End header-->
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
            <input class="txt" type="text" style="width: 186px" name='q'value="">
            <input class="btn" type="submit" value="">
        </form>
    </div>
</div>
<!--//End head-->

<!--Start header-->
<div class="bd header">
    <div class="nav hd">
        <ul>
            <li><a class="link" href="<c:url value="/init/home.do"/>" title="">首页<i class="line"></i></a></li>
            <li><a class="link" href="<c:url value="/association/association.do?qm=plistAssociationIntroduction_default"/>" title="">协会概况<i class="line"></i></a></li>
            <li><a class="link" href="<c:url value="/organization/organization.committee.do?qm=plistCommitteeAssociation_default"/>" title="">下属机构<i class="line"></i></a></li>
            <li><a class="link" href="<c:url value="/news/news.do?qm=plistNewsOrganization_default"/>" title="">新闻公告<i class="line"></i></a></li>
            <li><a class="link" href="<c:url value="/protection/protection.do?qm=plistLaw_default"/>" title="">政策法规<i class="line"></i></a></li>
            <li><a class="link" href="http://minglu.efeiyi.com" target="_blank" title="">非遗百科</a></li>
        </ul>
    </div>
</div>

<!--Start main-->
<div class="bd home">
    <div class="hd">
        <!--Start main-left-->
        <div class="main-left">
            <!--start focus-->
            <div class="bd focus">
                <div id="focus">
                    <ul>
                        <c:if test="${bannerList != null}">
                            <c:forEach items="${bannerList}" var="banner">
                                <li><a href="${banner.directUrl}" target="_blank"><img src="${banner.imageUrl}"/></a></li>
                            </c:forEach>
                        </c:if>
                    </ul>
                    <div class="text">
                        <c:if test="${bannerList != null}">
                            <c:forEach items="${bannerList}" var="banner">
                                <p>${banner.title}</p>
                            </c:forEach>
                        </c:if>
                    </div>
                </div>
            </div>
            <!--//End focus-->

            <!--start news-->
            <div class="bd news">
                <div class="list fl">
                    <div class="title">非遗要闻<a class="more" href="<c:url value='/news/news.do?qm=plistNewsIndustry_default'/>">更多</a></div>
                    <ul>
                        <c:if test="${newList!=null}">
                            <c:forEach items="${newList}" var="news" begin="0" end="4">
                        <li><a href="javascript:void(0)" onclick="homeMatchJNodes('${news.id}', 8,'SubordinateInstitutionManagement')" target="_parent">${news.title}</a></li>
                            </c:forEach>
                        </c:if>
                    </ul>
                </div>
                <div class="list fr">
                    <div class="title">重要通知<a class="more" href="<c:url value='/news/news.Bulletin.do?qm=plistNewsNote_default'/>">更多</a></div>
                    <ul>
                        <c:if test="${noteList!=null}" >
                            <c:forEach items="${noteList}" var="note" begin="0" end="4">

                        <li><a href="javascript:void(0)" onclick="homeMatchJNodes('${note.id}', 8,'SubordinateInstitutionManagement')" target="_parent">${note.title}</a></li>
                                <%--<li><a href="<c:url value=""/>"  target="_parent">${note.title}</a></li>--%>
                            </c:forEach>
                        </c:if>
                    </ul>
                </div>
            </div>
            <!--//End news-->

            <%--<!--start ad-->--%>
            <div class="ad">
                <c:if test="${centerList!=null&&centerList.size()>0}">
                <a href="${centerList.get(0).redirect}"><img src="http://ec-efeiyi.oss-cn-beijing.aliyuncs.com/${centerList.get(0).img}" alt=""></a>
                </c:if>
            </div>
            <%--<!--//End ad-->--%>

            <!--start master-->
            <div class="bd slideroll master">
                <div class="title">非遗大师<a class="more" href="http://master.efeiyi.com" target="_blank">更多</a></div>
                <div class="list" id="masterRoll">
                    <ul>
                        <c:if test="${masterList!=null}">
                            <c:forEach items="${masterList}" var="master">
                        <li><a href="http://${master.name}.efeiyi.com" target="_blank"><img src="http://tenant.efeiyi.com/${master.favicon}@!xh-master-picture" alt=""><p>${master.fullName}</p></a></li>
                            </c:forEach>
                        </c:if>
                    </ul>
                    <a href="javascript:;" class="btn prev"></a>
                    <a href="javascript:;" class="btn next"></a>
                </div>
            </div>
            <!--//End master-->

            <!--start wiki-->
            <div class="bd slideroll wiki">
                <div class="title">非遗百科<a class="more" target="_blank" href="http://minglu.efeiyi.com">更多</a></div>
                <div class="list" id="wikiRoll">
                    <ul>
                        <c:if test="${artistryList!=null}">
                            <c:forEach items="${artistryList}" var="artistry">

                            <li><a href="http://minglu.efeiyi.com/minglu/project/${artistry.id}" target="_blank"><img src="http://wiki-oss.efeiyi.com/${artistry.getMainPicture().pictureUrl}@!xh-artistry-picture"><p>${artistry.name}</p></a></li>
                            </c:forEach>
                        </c:if>
                    </ul>
                    <a href="javascript:;" class="btn prev"></a>
                    <a href="javascript:;" class="btn next"></a>
                </div>
            </div>
            <!--//End wiki-->
        </div>
        <!--//End main-left-->

        <!--Start main-right-->
        <div class="main-right">
            <!--start service-->
            <div class="bd service">
                <div class="title">在线服务</div>
                <div class="bd btns">
                    <a href="<c:url value='/protection/protection.declare.do?qm=plistMaterial_default'/>"><i class="icon1"></i>在线申报</a>
                    <a href="<c:url value='/project/project.do?qm=plistProject_default&provinceid=-1&type=-1'/>"><i class="icon2"></i>非遗名录</a>
                    <a href="<c:url value='/protection/protection.list.do?qm=plistPolicy_default" title="政策法规'/>"><i class="icon3"></i>政策法规</a>
                    <a href="<c:url value='/organization/organization.committee.do?qm=plistCommitteeAssociation_default'/>"><i class="icon4"></i>下属机构</a>
                </div>
            </div>
            <!--//End service-->

            <!--start service-->
            <div class="bd ad">
                <c:if test="${bannerRightList!=null&&bannerRightList.size()>0}">
                    <c:forEach items="${bannerRightList}" var="right">
                <a href="${right.redirect}"><img src="http://ec-efeiyi.oss-cn-beijing.aliyuncs.com/${right.img}" alt=""></a>
                    </c:forEach>
                    </c:if>
            </div>
            <!--//End service-->
        </div>
        <!--//End main-right-->
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

        <div class="copyright"><h2>技术支持：永新华韵文化发展有限公司</h2>
            <h3>Copyright@2012-2022中国非物质文化遗产保护协会版权所有—京ICP备16047258号</h3>
        </div>
    </div>
</div>
<script src="/shop2015/js/jquery.min.js"></script>
<script src="/shop2015/js/system.js"></script>
<script type="text/javascript">
    $(function() {
        $('#focus').slideFocus();
        $('#masterRoll').slideRoll(3);
        $('#wikiRoll').slideRoll(2);
    });
</script>
<script type="text/javascript">
    //获取页面文件名和参数
    function GetPageurl(){
        var url=window.location.href;//获取完整URL地址
        var tmp= new Array();//临时变量，用于保存分割字符串
        tmp=url.split("/");//按照"/"分割
        var cc = tmp[tmp.length-1];//获取最后一部分，即文件名和参数
        tmp=cc.split("?");//把参数和文件名分割开

        //获取参数 给指定的导航加active
        var doName=tmp[0];
        var aLi=$('.header li');
        aLi.eq(0).removeClass('active');
        if(doName == 'home.do'){
            aLi.eq(0).addClass('active')
        }else if (doName == 'association.do') {
            aLi.eq(1).addClass('active')
        }else if (doName == 'organization.committee.do') {
            aLi.eq(2).addClass('active')
        }else if (doName == 'news.do') {
            aLi.eq(3).addClass('active')
        }else if (doName == 'protection.do') {
            aLi.eq(4).addClass('active')
        }
        return tmp[0];//返回值
    }
    GetPageurl();
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
