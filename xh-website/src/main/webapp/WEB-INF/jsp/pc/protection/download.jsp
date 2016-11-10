<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2016/9/21
  Time: 16:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>中国非物质文化遗产保护协会-资料下载</title>
</head>
<body>
<!--Start head-->

<!--Start main-->

    <!--//End main-left-->
    <div class="main-right">
      <div class="title">非物质文化遗产相关资料下载</div>
      <div class="down">
        <ul>
          <li><a href="http://pro.efeiyi.com/down/保护非物质文化遗产公约.pdf" target="_blank"><img src="/shop2015/upload/down1.jpg" alt=""><em><i></i></em></a></li>
          <li><a href="http://pro.efeiyi.com/down/世界非遗名录.pdf" target="_blank"><img src="/shop2015/upload/down2.jpg" alt=""><em><i></i></em></a></li>
          <li><a href="http://pro.efeiyi.com/down/中华人民共和国非物质文化遗产法.pdf" target="_blank"><img src="/shop2015/upload/down3.jpg" alt=""><em><i></i></em></a></li>
          <li><a href="http://pro.efeiyi.com/down/中国非遺名录版.pdf" target="_blank"><img src="/shop2015/upload/down4.jpg" alt=""><em><i></i></em></a></li>
          <li><a href="http://pro.efeiyi.com/down/山东省非物质文化遗产名录.pdf" target="_blank"><img src="/shop2015/upload/down5.jpg" alt=""><em><i></i></em></a></li>
          <li><a href="http://pro.efeiyi.com/down/联合国教育，科学以及文化组织.pdf" target="_blank"><img src="/shop2015/upload/down6.jpg" alt=""><em><i></i></em></a></li>
          <li><a href="http://pro.efeiyi.com/down/【北京市】市级非物质文化遗产名录.pdf" target="_blank"><img src="/shop2015/upload/down7.jpg" alt=""><em><i></i></em></a></li>

        </ul>
      </div>
    </div>

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
  $('li').click(function(){
    $(this).addClass();

  })
</script>

</body>
</html>
