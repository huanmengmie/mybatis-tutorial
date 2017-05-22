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
var DEFAULT_USERNAME="<shiro:principal/>";
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
        
                    <th>学生名称</th>
                    <th>学生邮箱</th>
                    <th>学生状态</th>
                    <th>注册日期</th>
                </tr>
                <c:forEach var="list" items="${list }">
                <tr>
                 
                    <td width="30%"><a href="javascript:void(0);" class="item_title" title="${list.userName }">${list.userName }</a>
                    </td>
                    <td width="20%"><a href="javascript:void(0);">${list.email }</a></td>
                    <td width="10%">
                    <c:choose>
                     	<c:when test="${list.status eq 1}">启用</c:when>
                     	<c:otherwise>禁用</c:otherwise>
                    </c:choose>
                    </td>
                    <td width="20%"><fmt:formatDate value="${list.addTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
                </tr>
                </c:forEach>
            </table>
             <!-- 分页导航引入 -->
			    ${toolBar}
        </div>
</div>
<!-- E CONTENT -->

<!-- 个人信息 -->
<jsp:include page="common/myinfo.jsp"></jsp:include>
</body>
</html>