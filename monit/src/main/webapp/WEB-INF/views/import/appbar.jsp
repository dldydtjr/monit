<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/monit/resources/css/appbar.css" type="text/css">
</head>
<body>
    <header class="d-flex flex-wrap sticky-top align-items-center justify-content-center justify-content-between py-1" style="background-color: #BCF5A9;">
<!--     <header class="d-flex flex-wrap sticky-top align-items-center justify-content-center justify-content-between py-1"> -->
      <a href="/monit/integrate" class="d-flex align-items-center text-dark text-decoration-none">
        <svg class="bi me-2" width="30" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"/></svg>
		<span class="fs-4" style="font-weight: bold;">전력모니터링 시스템</span>
      </a>
	  <button class="navbar-toggler position-absolute d-lg-none collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="false" aria-label="Toggle navigation"
	  	style="top: 50px; right: 0; background-color: black;"
	  >
	    <span class="navbar-toggler-icon"></span>
	  </button>
      <div class="text-end">
        <a class="nav-link px-5" href="/monit/logout">Sign out</a>
      </div>
    </header>
</body>
</html>