<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/10/8
  Time: 10:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="ming800" uri="http://java.ming800.com/taglib" %>
<!doctype html>
<html class="no-js">

<head>
  <title>中国非物质文化遗产保护协会-申报状态</title>
</head>
<body>
<div class="main-right">
  <div class="title">申报查询</div>
  <div class="div-list" id="div-list">
    <div class="div-tab-btn">
      <span class="active">传承人<i class="icon"></i></span>
      <span>项目<i class="icon"></i></span>
    </div>
    <div class="div-tab-box" style="display: block;">
      <form action="<c:url value='/protection/protection.checkDeclareState.do'/>">
        <span>传承人姓名</span>
        <input type="hidden" name="type" value="masterApply">
        <input type="text" class="txt" name="name" placeholder="姚慧芬">
        <input type="submit" class="btn" value="查询">
      </form>
    </div>
    <!-- //End--传承人-->
    <div class="div-tab-box">
      <form action="<c:url value='/protection/protection.checkDeclareState.do'/>">
        <span>项目名称</span>
        <input type="hidden" name="type" value="projectApply">
        <input type="text" class="txt"  name="name" placeholder="乱针绣">
        <input type="submit" class="btn"  value="查询">
      </form>
    </div>
    <!-- //End--项目-->
  </div>
  <div class="examined">
    <c:if test="${empty object}">
      <c:if test="${type == 'masterApply'}">
        <div class="title" style="font-size: 14px;color: #666">所查询的申报传承人不存在!</div>
      </c:if>
      <c:if test="${type == 'projectApply'}">
        <div class="title" style="font-size: 14px;color: #666">所查询的申报项目不存在!</div>
      </c:if>
    </c:if>
    <c:if test="${not empty object}">
      <div class="title">
        <ming800:status name="status" dataType="document.status" checkedValue='${object.status}' type="normal"/>
      </div>
      <div class="txt-info">
        <p></p>
        <c:if test="${type == 'masterApply'}">
          <p>申报传承人：${object.name}</p>
        </c:if>
        <c:if test="${type == 'projectApply'}">
          <p>申报项目：${object.name}</p>
        </c:if>
        <p></p>
        <p class="ps">PS:请保持通话畅通,工作人员会及时与您联系!</p>
      </div>
    </c:if>
  </div>
</div>

<script type="text/javascript">
   var type = '${type}';
   $(function() {

     $('.div-tab-btn>span').removeClass("active");
     var divList=$('#div-list');
     var divTabBox=divList.find('.div-tab-box');
     if(type == 'masterApply'){
       $('.div-tab-btn>span').eq(0).addClass("active");
       divTabBox.eq(0).show().siblings('.div-tab-box').hide();
     } else {
       $('.div-tab-btn>span').eq(1).addClass("active");
       divTabBox.eq(1).show().siblings('.div-tab-box').hide();
     }
   });

  </script>
<!-- //End--slide-right-->
</body>
</html>
