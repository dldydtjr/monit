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
      <div class="text-end">
      	<span id="clock"></span>
      </div>
    </header>
</body>
<script type="text/javascript">
function currentTime() {
	  const date = new Date(); 
	  let year = date.getFullYear();
	  let mon = date.getMonth()+1;
	  let day = date.getDate();
	  let hh = date.getHours();
	  let mm = date.getMinutes();
	  let ss = date.getSeconds();

	  if (hh > 12) {
	    session = "PM";
	  }

	  hh = (hh < 10) ? "0" + hh : hh;
	  mm = (mm < 10) ? "0" + mm : mm;
	  ss = (ss < 10) ? "0" + ss : ss;

	  const time = year + "-" + (("00"+mon.toString()).slice(-2)) + "-" + day + " " + hh + "시 " + mm + "분 " + ss + "초 | 00 00팀 00님";

	  document.getElementById("clock").innerText = time;

	  setTimeout(() => currentTime(), 1000);
	}

	currentTime();
</script>
</html>