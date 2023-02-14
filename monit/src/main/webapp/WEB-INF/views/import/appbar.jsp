<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/monit/resources/css/appbar.css" type="text/css">
</head>
<body>
    <header class="d-flex flex-wrap sticky-top align-items-center justify-content-center justify-content-between py-2">
<!--     <header class="d-flex flex-wrap sticky-top align-items-center justify-content-center justify-content-between py-1"> -->
		<span class="d-flex align-items-center text-dark text-decoration-none fs-5" style="font-weight: bold;">
			<c:set var="path" value="${requestScope['javax.servlet.forward.servlet_path']}" />
			<c:choose> 
				<c:when test="${path=='/integrate'}">통합 모니터링</c:when> 
				<c:when test="${path=='/monitoring'}">소비전력 모니터링</c:when>
				<c:otherwise>소비전력 모니터링</c:otherwise> 
			</c:choose>
		</span>
	  <button class="navbar-toggler position-absolute d-lg-none collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="false" aria-label="Toggle navigation"
	  	style="top: 50px; right: 0; background-color: black;"
	  >
	    <span class="navbar-toggler-icon"></span>
	  </button>
      <div class="text-end"><span class="d-flex align-items-center text-dark text-decoration-none fs-6" >2021-05-03 11시 14분 06초 | 00 00팀 00님</span></div>
    </header>
</body>
</html>