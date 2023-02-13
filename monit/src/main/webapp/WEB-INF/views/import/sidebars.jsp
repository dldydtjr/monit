<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
<link rel="stylesheet" href="/monit/resources/css/sidebars.css" type="text/css">
</head>
<body>
<c:set var="path" value="${requestScope['javax.servlet.forward.servlet_path']}" /> 
	<div id="sidebarMenu" class="col-xs-3 col-sm-3 col-md-3 col-lg-2 d-lg-block bg-white sidebar collapse">
		<div class="position-sticky pt-3">
			<ul class="list-unstyled ps-0">
				<li class="mb-1" style="background-color: <c:choose> <c:when test="${path=='/integrate'}">#E6F8E0;</c:when> <c:otherwise>inherit;</c:otherwise></c:choose>">
					<button class="btn btn-toggle align-items-center btn-outline-secondary rounded collapsed"
						data-bs-toggle="collapse" data-bs-target="#dashboard-collapse"
						aria-expanded="false" onclick = "location.href = '/monit/integrate'">통합 모니터링</button>
				</li>
				<li class="mb-1" style="background-color: <c:choose> <c:when test="${path=='/monitoring'}">#E6F8E0;</c:when> <c:otherwise>inherit;</c:otherwise></c:choose>">
					<button class="btn btn-toggle align-items-center btn-outline-secondary rounded collapsed"
						data-bs-toggle="collapse" data-bs-target="#dashboard-collapse"
						aria-expanded="false" onclick = "location.href = '/monit/monitoring'">모니터링</button>
				</li>
				<li class="mb-1" style="background-color: <c:choose> <c:when test="${path=='/statistics'}">#E6F8E0;</c:when> <c:otherwise>inherit;</c:otherwise></c:choose>">
					<button class="btn btn-toggle align-items-center btn-outline-secondary rounded collapsed"
						data-bs-toggle="collapse" data-bs-target="#dashboard-collapse"
						aria-expanded="false" onclick = "location.href = '/monit/statistics'">통계</button>
				</li>
			</ul>
		</div>
	</div>
</body>
</html>