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
<%@include file="/layouts/public.jsp" %>
<html>
<head>
    <title></title>
</head>
<body>
<div style="text-align: left;margin-left: 10px;">
    <button onclick="window.location.href='<c:url
            value="/myDocument/newDocument.do?qm=direct2JspUploadDocPic_newDocument&group=${group}&resultPage=/myDocument/newDocument.do?qm=direct2JspUploadDocPic_newDocument"/>'"
            class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only"><span class="am-icon-trash-o"></span>上传附件
    </button>
</div>
<div class="am-g">
    <table class="am-table am-table-bordered am-table-radius am-table-striped">
        <tr>
            <td>操作</td>
            <td>附件名称</td>
            <td>申请类型</td>
            <td>附件说明</td>
            <td>附件</td>
            <td>创建时间</td>
        </tr>

        <c:forEach items="${documentList}" var="document">
            <tr>
                <td>
                    <div class="am-btn-toolbar">
                        <div class="am-btn-group am-btn-group-xs" style="width: 100%;">
                            <button onclick="window.location.href='<c:url
                                    value="/myDocument/newDocument.do?qm=direct2JspUploadAttach_newDocument&group=${group}&id=${document.id}&resultPage=/myAttachment/attachment.do?qm=${requestScope.qm}"/>'"
                                    class="am-btn am-btn-default am-btn-xs am-hide-sm-only"><span
                                    class="am-icon-edit"></span> 编辑
                            </button>
                            <button onclick="myConfirm('<c:url
                                    value="/myDocument/removeDocument.do?qm=removeContent&id=${document.id}&resultPage=/myAttachment/attachment.do?qm=${requestScope.qm}"/>','D')"
                                    class="am-btn am-btn-default am-btn-xs am-text-danger am-hide-sm-only"><span
                                    class="am-icon-trash-o"></span> 删除
                            </button>
                            <input value="${document.id}"
                                   name="${document.id}" metaProperty="id" type="hidden"/>
                            <input value="${document.documentContent.id}"
                                   name="${document.id}" metaProperty="documentContent.id" type="hidden"/>
                            <input value="${document.documentOrder}"
                                   name="${document.id}" metaProperty="documentOrder" type="hidden"/>
                            <input value="${document.keywords}"
                                   name="${document.id}" metaProperty="keywords" type="hidden"/>
                            <input value="${document.sampleContent}"
                                   name="${document.id}" metaProperty="sampleContent" type="hidden"/>
                            <input value="<fmt:formatDate value="${document.theDatetime}" pattern="yyyy-MM-dd"/>"
                                   name="${document.id}" metaProperty="theDatetime" type="hidden"/>
                            <input value="<fmt:formatDate value="${document.publishDate}" pattern="yyyy-MM-dd"/>"
                                   name="${document.id}" metaProperty="publishDate" type="hidden"/>
                            <input value="${document.status}"
                                   name="${document.id}" type="hidden" metaProperty="status"/>
                            <input value="${document.group}"
                                   name="${document.id}" metaProperty="group" type="hidden"/>
                            <input value='${document.documentContent.content}' metaProperty="documentContent.content"
                                   name="${document.id}" type="hidden"/>
                        </div>
                    </div>
                </td>
                <td>
                    <div name="title">${document.title}</div>
                    <input type="hidden" id="${document.id}10" name="${document.id}" value="${document.title}"
                           metaProperty="title">
                </td>
                <td>
                    <div name="keywords"><ming800:status name="keywords" dataType="document.keywords"
                                                      checkedValue="${document.keywords}"
                                                      type="normal"/></div>
                    <input type="hidden" id="${document.id}11" name="${document.id}" value="${document.keywords}"
                           metaProperty="keywords">
                </td>
                <td>
                    <div name="sampleContent">${document.sampleContent}</div>
                    <input type="hidden" id="${document.id}11" name="${document.id}" value="${document.sampleContent}"
                           metaProperty="sampleContent">
                </td>
                <td>
                    <c:set var="attachSize" value="0" scope="page"/>

                    <div id="${document.id}12" name="${document.id}" href="${document.documentAttachmentList}">
                        <c:forEach items="${document.documentAttachmentList}">
                            <c:set var="attachSize" value="${attachSize = attachSize + 1}" scope="page"/>
                        </c:forEach>${attachSize}</div>
                </td>
                <td>
                    <div id="${document.id}13"><fmt:formatDate value="${document.publishDate}"
                                                               pattern="yyyy-MM-dd"/></div>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
<jsp:include page="/layouts/myConfirm.jsp"/>
<div style="clear: both">
    <c:url value="/myDocument/doc.do" var="url"/>
    <ming800:pcPageList bean="${requestScope.pageInfo.pageEntity}" url="${url}">
        <ming800:pcPageParam name="qm" value="${requestScope.qm}"/>
        <ming800:pcPageParam name="conditions" value="${requestScope.conditions}"/>
    </ming800:pcPageList>
</div>
</body>
</html>
