<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/9/29
  Time: 14:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<html class="no-js" xmlns="http://www.w3.org/1999/html">--%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>中国非物质文化遗产保护协会-申报提交</title>
    <link rel="stylesheet" href="/shop2015/css/layouts.css">
</head>
<body>
<div class="main-right">
    <div class="title">申报提交</div>
    <div class="div-list" id="div-list">
        <div class="div-tab-btn">
            <span class="active">传承人申报<i class="icon"></i></span>
            <span class="">项目申报<i class="icon"></i></span>
        </div>
        <!-- //End--div-tab-btn-->
        <div class="div-tab-box div-tab-zn" style="display: block;">
            <div class="tbar">申请步骤：</div>
            <div class="img">
                <img class="img1" src="<c:url value="/shop2015/images/exp11.jpg"/>" alt="">
                <img class="img2" src="<c:url value="/shop2015/images/exp12.jpg"/>" alt="">
            </div>
            <form method="post" action="<c:url value='/attachment/attachmentUpload.do?resultPage='/>/protection/protection.declare.do?qm=plistMaterial_default&submitResult=true"
                  enctype="multipart/form-data">
            <ul class="ul-list">
                <li>
                    <p class="t1">1、申请表格下载并填写</p>

                    <p class="t2">
                    <a href="javascript:void(0)" onclick="downloadFileOnPage('<c:forEach items="${masterApply.documentAttachmentList}" var="attachment" end="0">${attachment.path}</c:forEach>')" target="_blank"
                    title="申请表格下载">申请表格下载</a>
                    </p>

                    <p class="t3">* 项目说明，项目论证，项目管理，保护计划表格请在这里下载，填写，并上传。</p>
                </li>
                <li>
                    <p class="t1">2、上传填写完毕后的文件并提交</p>
                    <p class="t2">
                        <a target="_blank" title="上传文件" style="color: red">上传文件</a>
                        <input class="file" type="file" name="file" required/>
                        <%--<span>未上传文件</span>--%>
                        <span class="">传承人姓名<i class="icon"></i></span>
                        <input class="txt" type="text" name="name"  required/>
                    </p>
                </li>
                <li>
                    <input name="subGroup" value="masterApply" type="hidden">
                    <input name="group" value="attachDown" type="hidden">
                    <p class="t1"><input class="txt" type="submit"/></p>
                </li>
            </ul>
             </form>
        </div>
        <!-- //End--传承人申报-->
        <div class="div-tab-box div-tab-zn">
            <div class="tbar">项目申请步骤：</div>
            <div class="img">
                <img class="img1" src="<c:url value ="/shop2015/images/exp11.jpg"/>" alt="">
                <img class="img2" src="<c:url value="/shop2015/images/exp12.jpg"/>" alt="">
            </div>
            <form method="post" action="<c:url value='/attachment/attachmentUpload.do?resultPage=/protection/protection.declare.do?qm=plistMaterial_default&submitResult=true'/>"
                  enctype="multipart/form-data">
            <ul class="ul-list">
                <li>
                    <p class="t1">1、申请表格下载并填写</p>
                    <p class="t2"> <a href="javascript:void(0)" onclick="downloadFileOnPage('<c:forEach items="${projectApply.documentAttachmentList}" var="attachment" end="0">${attachment.path}</c:forEach>')"
    title="申请表格下载">申请表格下载</a></p>
                    <p class="t3">* 项目说明，项目论证，项目管理，保护计划表格请在这里下载，填写，并上传。</p>
                </li>
                <li>
                    <p class="t1">2、上传填写完毕后的文件并提交</p>
                    <p class="t2">
                     <a target="_blank" title="上传文件">上传文件</a>
                     <input class="file" type="file" name="file" required/>
    <%--<span>未上传文件</span>--%>
                      <span class="">项目名称<i class="icon"></i></span>
                     <input class="txt" type="text" name="name" required/>
                      </p>
                </li>
                <li>
                    <input name="subGroup" value="projectApply" type="hidden">
                    <input name="group" value="attachDown" type="hidden">
                    <p class="t1"><input class="txt" type="submit"/></p>
                </li>
            </ul>
            </form>
        </div>
        <!-- //End--项目申报-->
    </div>
</div>

    <%--</div>--%>
<%--</div>--%>
<!--//End main-->




<script src="<c:url value='/scripts/function.js'/>"></script>
<script src="scripts/js/jquery.min.js"></script>
<script src="scripts/js/system.js"></script>
<script type="text/javascript">
    $(function() {
        $('#focus').slideFocus();
        $('#masterRoll').slideRoll(3);
        $('#wikiRoll').slideRoll(2);
    });
    if(${submitResult}){
        alert("提交成功");
    }
</script>
</body>
</html>
