<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<html lang="en">
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
  <meta charset="UTF-8">
  <title>在线申报</title>
  <link rel="stylesheet" href="/shop2015/assets/css/layout.css">
</head>
<body>
<article>
  <header class="header">
    <a href="javascript:history.go(-1)" class="left_btn back"></a>
    <h1>在线申报</h1>
  </header>
  <!--//header-->

  <div class="online">
    <div class="tabs">
      <a class="active" href="javascript:;">传承人申报</a>
      <a href="javascript:;" >非遗项目申报</a>
    </div>
    <div class="content" id="master">
      <div class="box">
        <p class="t1">申请步骤：</p>
        <p>1、下载并填写申请表格</p>
        <p>2、上传文件，并确认提交</p>
      </div>
      <!--//end-->
      <div class="box">
        <p class="t1">下载并填写表格：</p>
        <p><a onclick="downloadFileOnPage('<c:forEach items="${projectApply.documentAttachmentList}" var="attachment" end="0">${attachment.path}</c:forEach>')" target="_blank" class="btn">点击下载申请表格</a></p>
        <p><em>* 项目说明，项目论证，项目管理，保护计划表格请在这里下载并填写。</em></p>
      </div>
      <!--//end-->
      <form method="post" action="<c:url value='/attachment/attachmentUpload.do?resultPage=/wap/declare.do?qm=plistMaterial_default&submitResult=true'/>"
            enctype="multipart/form-data">
      <div class="box">
        <p class="t1">上传填写完毕的文件并提交：</p>
        <p><span class="btn"><input type="file" name="file" required>上传文件</span></p>
      </div>
      <!--//end-->
      <div class="box">
        <p class="t1">传承人姓名：</p>
        <p><span class="text"><input type="text" placeholder="请填写传承人姓名：" name="name" required></span></p>
        <p><em>* 项目说明，项目论证，项目管理，保护计划表格请在这里下载并填写。</em></p>
      </div>
      <!--//end-->
        <input name="subGroup" value="masterApply" type="hidden">
        <input name="group" value="attachDown" type="hidden">
      <input class="submit" type="submit" value="提   交">
        </form>
    </div>
    <div class="content" id="project" style="display: none;">
      <div class="box">
        <p class="t1">申请步骤：</p>
        <p>1、下载并填写申请表格</p>
        <p>2、上传文件，并确认提交</p>
      </div>
      <!--//end-->
      <div class="box">
        <p class="t1">下载并填写表格：</p>
        <p><a onclick="downloadFileOnPage('<c:forEach items="${projectApply.documentAttachmentList}" var="attachment" end="0">${attachment.path}</c:forEach>')" target="_blank" class="btn">点击下载申请表格</a></p>
        <p><em>* 项目说明，项目论证，项目管理，保护计划表格请在这里下载并填写。</em></p>
      </div>
      <!--//end-->
      <form method="post" action="<c:url value='/attachment/attachmentUpload.do?resultPage=/wap/declare.do?qm=plistMaterial_default&submitResult=true'/>"
            enctype="multipart/form-data">
        <div class="box">
          <p class="t1">上传填写完毕的文件并提交：</p>
          <p><span class="btn"><input class="file" type="file" name="file" required>上传文件</span></p>
        </div>
        <!--//end-->
        <div class="box">
          <p class="t1">项目名称：</p>
          <p><span class="text"><input type="text" placeholder="请填写项目名称：" name="name" required></span></p>
          <p><em>* 项目说明，项目论证，项目管理，保护计划表格请在这里下载并填写。</em></p>
        </div>
        <!--//end-->
        <input name="subGroup" value="projectApply" type="hidden">
        <input name="group" value="attachDown" type="hidden">

        <input class="submit" type="submit" value="提   交">
      </form>
    </div>
  </div>
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
</article>

<script src=""></script>
<script src="<c:url value='/shop2015/assets/js/common.js'/>"></script>
<script type="text/javascript">
  function downloadFileOnPage(str) {
    var strArray = str.split(";");
    for(var x=0;x<strArray.length;x++){
      window.open(strArray[x]);
    }
  }

  $('.tabs a').on('click',function(){
    var index=$(this).index();
    $(this).addClass('active').siblings('a').removeClass('active');
    $('.content').eq(index).show().siblings('.content').hide();
  })


  if(${not empty submitResult}){
    alert("提交成功");
  }
</script>

</body>
</html>