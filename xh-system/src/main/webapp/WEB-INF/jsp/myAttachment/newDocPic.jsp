<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2015/9/7
  Time: 13:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%@ taglib prefix="ming800" uri="http://java.ming800.com/taglib" %>
<html>
<head>
    <title></title>
    <link href="<c:url value="/scripts/upload/uploadify.css"/>" rel="stylesheet"/>
    <script src="<c:url value='/resources/plugins/ckeditor/ckeditor.js'/>"></script>
    <script src="<c:url value="/scripts/upload/jquery.uploadify.js"/>"></script>
    <style type="text/css">
        .line{margin-bottom:20px;}
        /* 复制提示 */
        .copy-tips{position:fixed;z-index:999;bottom:50%;left:50%;margin:0 0 -20px -80px;background-color:rgba(0, 0, 0, 0.2);filter:progid:DXImageTransform.Microsoft.Gradient(startColorstr=#30000000, endColorstr=#30000000);padding:6px;}
        .copy-tips-wrap{padding:10px 20px;text-align:center;border:1px solid #F4D9A6;background-color:#FFFDEE;font-size:14px;}
    </style>
</head>
<body>
<div style="text-align: left;margin-left: 10px;">
    <input onclick="window.history.back()"
           type="button" class="am-btn am-btn-default am-btn-xs"
           style="margin-top: 8px;margin-bottom: 6px;margin-left:2px;height: 35px;"
           value="返回"/>
</div>
<div class="am-cf am-padding">
    <div class="am-fl am-cf">
        <strong class="am-text-primary am-text-lg">添加/编辑<ming800:status name="group" dataType="announcements.group"
                                                                        checkedValue="${object.group}"
                                                                        type="normal"/></strong>
    </div>
</div>
<hr/>
<div class="am-g">
    <div class="am-u-sm-12 am-u-md-4 am-u-md-push-8"><%--少了这个div就出错--%>
    </div>
    <form id="documentForm" action="<c:url value='/myAttachment/saveAttachment.do'/>?qm=${requestScope.qm}"
          onsubmit="return afterSubmitForm('documentForm')"
          method="post" enctype="multipart/form-data" class="am-form am-form-horizontal">
        <input id="id" value="${object.id}" name="id"
               type="hidden"/>
        <%--<input id="documentContent.id" value="${object.documentContent.id}"--%>
        <%--name="documentContent.id"--%>
        <%--type="hidden"/>--%>
        <input id="documentOrder" value="${object.documentOrder}"
               name="documentOrder"
               type="hidden"/>
        <input id="status" value="${object.status}" name="status"
               type="hidden"/>
        <input id="publishDate"
               value="<fmt:formatDate value="${object.publishDate}" pattern="yyyy-MM-dd"/>"
               name="publishDate"
               type="hidden"/>
        <%--<input type="hidden" id="keywords" placeholder="keywords" name="keywords"--%>
        <%--value="${object.keywords}">--%>
        <input type="hidden" id="name" placeholder="name"
               name="name"
               value="${object.name}">
        <c:if test='${empty object.group}'>
            <input type="hidden" id="group" placeholder="group"
                   name="group"
                   value="${group}">
        </c:if>
        <c:if test='${not empty object.group}'><input type="hidden" id="group" placeholder="group"
                                                      name="group"
                                                      value="${object.group}"></c:if>

        <div class="am-form-group">
            <label name="附件名称" for="title" class="am-u-sm-3 am-form-label">附件名称
                <small>*</small>
            </label>

            <div class="am-u-sm-9">
                <input type="text" name="title" id="title" placeholder="附件名称" value="${object.title}" required="true">
            </div>
        </div>
        <div class="am-form-group">
            <label name="附件名称" for="title" class="am-u-sm-3 am-form-label">
                <small>*</small>
            </label>

            <div class="am-u-sm-9">
                <input type="text" name="documentContent.content" id="" placeholder="背景地址" value="${object.title}" required="true">
            </div>
        </div>

        <div class="am-form-group">
            <label  class="am-u-sm-3 am-form-label">内容</label>
            <div class="am-u-sm-9">
                            <input type="text"  name="documentContent.content"
                                      placeholder="输入内容">${object.documentContent.content}
                            </input>
            </div>
        </div>

        <div class="am-form-group">
            <label  class="am-u-sm-3 am-form-label">内容</label>
            <div class="am-u-sm-9">
                            <textarea id="" name="documentContent.content" class="ckeditor"
                                      placeholder="输入内容">${object.documentContent.content}
                            </textarea>
            </div>
        </div>

        <div class="am-form-group">
            <label name="资料类型" for="group" class="am-u-sm-3 am-form-label">资料类型
                <small>&nbsp;&nbsp;</small>
            </label>

            <div class="am-u-sm-9">
                <ming800:status name="webdata" dataType="document.webdata"
                                checkedValue="${object.webdata}"
                                type="select"/>
            </div>
        </div>
        <div class="am-form-group">
            <label for="file" class="am-u-sm-3 am-form-label">文件上传
                <small>&nbsp;&nbsp;</small>
            </label>
            <div class="am-u-sm-9">
                <input type="file" id="file" name="file" placeholder="">
                <c:if test="${not empty object.documentAttachmentList}">
                    <c:forEach items="${object.documentAttachmentList}" var="att" end="0">
                        <a href="<c:url value='${att.path}'/>">${url}</a>
                    </c:forEach>
                </c:if>
            </div>
        </div>

        <div class="am-form-group">
            <label name="serial" class="am-u-sm-3 am-form-label">附件图片</label>

            <div class="am-u-sm-9" style="margin-top: 10px;">

                <a id="btn_upload3"></a>
            </div>
        </div>


        <div class="am-u-md-13">
            <div class="am-panel am-panel-default">
                <div class="am-panel-hd am-cf" data-am-collapse="{target: '#collapse-panel-3'}">
                    <strong> 附件图片</strong>
                    <span class="am-icon-chevron-down am-fr"></span></div>
                <div class="am-panel-bd am-collapse am-in" id="collapse-panel-3" style="height: auto;overflow: hidden">

                    <ul style="width: 100%"  style="list-style:none" id="documentPicture">
                        <c:if test="${!empty object.documentPictureList}">
                            <c:forEach var="documentPicture" items="${object.documentPictureList}">

                                <li style="float: left;margin-right: 10px; width: 200px;"  name="${documentPicture.id}">
                                    <dl style="margin-top: 6px;">
                                        <dt style="width: 100%">
                                            <img width="100%" name=""
                                                 src="http://pro.efeiyi.com/${documentPicture.pictureUrl}@!product-model"
                                                 alt="附件图片"/>
                                            <input type="hidden" name="documentPicture" value="${documentPicture.pictureUrl}">
                                            <input type="hidden" name="flag" value="0">
                                            <input type="hidden" name="spId" value="${documentPicture.id}">
                                        </dt>

                                        <dd style="width: 100%;text-align: center;" >

                                            <a href="javascript:void(0);" onclick="deleteDocumentPicture1(this)">删除</a>
                                        </dd>

                                        <dd style="width: 100%;text-align: center;" >
                                            <a href="javascript:void(0);"  class="copy" url="http://pro.efeiyi.com/${documentPicture.pictureUrl}">复制图片地址</a>
                                        </dd>
                                    </dl>
                                </li>

                            </c:forEach>
                        </c:if>
                    </ul>
                </div>
            </div>

        </div>
        <div class="am-form-group">
            <div class="am-u-sm-9 am-u-sm-push-3">
                <input type="submit" class="am-btn am-btn-primary" value="保存"/>
            </div>
        </div>
    </form>
</div>
<script type="text/javascript" src="<c:url value='/scripts/zclip/jquery.zclip.js'/>"></script>
<script>

    function copyInit(obj){

        $(obj).zclip({
            path: "<c:url value="/scripts/zclip/ZeroClipboard.swf"/>",
            copy: function(){
                return $(this).attr("url");
            },
            beforeCopy:function(){/* 按住鼠标时的操作 */
                $(this).css("color","orange");
            },
            afterCopy:function(){/* 复制成功后的操作 */
                var $copysuc = $("<div class='copy-tips'><div class='copy-tips-wrap'>☺ 复制成功</div></div>");
                $("body").find(".copy-tips").remove().end().append($copysuc);
                $(".copy-tips").fadeOut(3000);
            }
        });


    }

    $(function(){
        CKEDITOR.replace('documentContent.content', {height: '440px', width: '1000px'});
        $(".copy").each(function(){
            copyInit($(this));
        });
        $('#btn_upload3').uploadify({
            uploader: '<c:url value="/document/documentUploadify.do"/>',            // 服务器处理地址
            swf: '<c:url value="/scripts/upload/uploadify.swf"/>',
            buttonText: "上传附件图片",                 //按钮文字
            buttonClass:"am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only",         //按钮样式
            buttonCursor:"hand",                    //鼠标指针悬停在按钮上的样子
            height: 35,                             //按钮高度
            width:145,                              //按钮宽度
            auto : true,                          //自动上传
            multi:true,                            //多个文件上传
            scriptDate:{'status':'3'},
            checkExisting:true,                    //检查文件重复
            successTimeout:1000000,                 //超时
            fileSizeLimit:'20MB',
            removeTimeout:1,                        //移除时间
            fileTypeExts: "*.jpg;*.png;*",           //允许的文件类型
            fileTypeDesc: "请选择图片文件",           //文件说明
            formData: { "imgType": "normal" }, //提交给服务器端的参数
            onUploadSuccess: function (file, data, response) {   //一个文件上传成功后的响应事件处理
//                alert(data)
//                data = data.substring(1,data.length-1);
                var pictureId = "";
                var  imgUrl = data;
                var  url = "";
                var  trueUrl = "";

                url = "http://pro.efeiyi.com/"+imgUrl+"@!product-model";
                trueUrl = "http://pro.efeiyi.com/"+imgUrl;

                ///显示图片
                var img ='<li style="float: left;margin-right: 10px;width:200px;" name="'+pictureId+'">'+
                        '<dl style="margin-top: 6px;" >'+
                        '  <dt  style="width: 100%">'+
                        '   <img width="100%" name="'+pictureId+ '"  src="'+url+'" alt="附件图片">'+
                        '      <input type="hidden" name="documentPicture" value="'+imgUrl+'">'+
                        '      <input type="hidden" name="flag" value="1">'+
                        '      <input type="hidden" name="spId" value="0">'+
                        '  </dt>'+
                        '  <dd style="width: 100%;text-align:center" >'+
                            //      '<a href="javascript:void(0);" onclick="updatePictureStatus(this,\''+data+'\',\'2\')">'+'设为主图片'+'</a>'+
                        '   <a href="javascript:void(0);" onclick="deleteDocumentPicture1(this)">'+
                        ' 删除'+
                        '</a>'+
                        '</dd>'+
                        '<dd style="width: 100%;text-align: center;" >'+
                        '  <a href="javascript:void(0);" onclick="copyInit(this);" class="copy" url="'+trueUrl+'">'+'复制图片地址'+'</a>'+
                        '</dd>'+
                        '</dl>'+
                        '</li>';

                $("#collapse-panel-3 ul").append(img);
//                $("#picUrl").append(tr);

            }
        });
        $("#btn_upload3-button").css({"padding":"0em 0em","text-align":"center"});
    });

    function deleteDocumentPicture1(obj){
        var   spId = $("input[name='spId']",$(obj).parents("li")).val();
        if(spId == "0"){
            $(obj).parents("li").remove();
        }else{
            $("input[name='flag']",$(obj).parents("li")).val("-1");
            $(obj).parents("li").hide();
        }

    }
</script>
<%--<script src="<c:url value='http://libs.baidu.com/jquery/1.11.3/jquery.min.js'/>"></script>--%>
<%--<script src="<c:url value='/resources/plugins/ckeditor/ckeditor.js'/> "></script>--%>


</body>
</html>
