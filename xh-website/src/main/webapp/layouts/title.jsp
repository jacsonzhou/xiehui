<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/8/6
  Time: 13:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
            <li><a class="link" href="<c:url value="/init/home.do"/>" title="">首页<i class="line"></i></a></li>
            <li><a class="link" href="<c:url value="/association/association.do?qm=plistAssociationIntroduction_default"/>" title="">协会概况<i class="line"></i></a></li>
            <li><a class="link" href="<c:url value="/organization/organization.committee.do?qm=plistCommitteeAssociation_default"/>" title="">下属机构<i class="line"></i></a></li>
            <li><a class="link" href="<c:url value="/news/news.do?qm=plistNewsOrganization_default"/>" title="">新闻公告<i class="line"></i></a></li>
            <li><a class="link" href="<c:url value="/protection/protection.do?qm=plistLaw_default"/>" title="">政策法规<i class="line"></i></a></li>
            <li><a class="link" href="http://minglu.efeiyi.com" target="_blank" title="">非遗百科</a></li>
        </ul>
    </div>
</div>
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

<!--//End--header-->
