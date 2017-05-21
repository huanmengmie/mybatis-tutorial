<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>学生列表</title>
<c:set var="CTP" value="${pageContext.request.contextPath}"></c:set>
<c:set var="CTP_ADMIN" value="${pageContext.request.contextPath}/resources/admin"></c:set>
<link rel="stylesheet" href="${CTP_ADMIN}/css/indexheader.css" />
<link rel="stylesheet" href="${CTP_ADMIN}/css/list.css"/>
<link rel="stylesheet" href="${CTP_ADMIN}/css/page.css"/>
<script type="text/javascript">
var CTPPATH="${pageContext.request.contextPath}";
</script>

<link rel="stylesheet" href="${CTP_ADMIN}/css/index.css" />
<script type="text/javascript" src="${CTP}/resources/common/js/lib/jquery-1.10.2.min.js" ></script>
<script type="text/javascript" src="${CTP}/resources/common/js/extends/layer-2.4/layer.js"></script>
<script type="text/javascript" src="${CTP_ADMIN }/js/module/common.js"></script>

<script type="text/javascript" src="${CTP_ADMIN }/js/module/lookinfo.js"></script>
</head>
<body>

<!-- S HEADER -->
<jsp:include page="common/header.jsp"></jsp:include>
<!-- E HEADER -->

<!-- S CONTENT -->
<div class="content">
    <div class="new_div3">            
            <table>
                <tr>
                    <th></th>
                    <th>标题</th>
                    <th>作者</th>
                    <th>类别</th>
                    <th>发布日期</th>
                </tr>
                <c:forEach var="list" items="${item }">
                <tr>
                    <td width="5%" align="center"><input type="checkbox" name="info_id" value="${list.id}"/></td>
                    <td width="35%"><a href="${CTP}/admin/distribute/${durl }?id=${list.id}" class="item_title" title="${list.itemTitle }">${list.itemTitle }</a>
                     <c:if test="${list.isPublish eq 0}">
		              <span class="draft-span">草稿</span>
		             </c:if>
                    </td>
                    <td width="20%"><a href="">${list.author }</a></td>
                    <td width="20%"><a href="">${typeName }</a></td>
                    <td width="20%"><fmt:formatDate value="${list.addTime }" pattern="yyyy-MM-dd"/></td>
                </tr>
                </c:forEach>
            </table>
             <!-- 分页导航引入 -->
			    ${toolBar}
        </div>
</div>
<!-- E CONTENT -->
</body>
</html>