<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css" integrity="sha512-mSYUmp1HYZDFaVKK//63EcZq4iFWFjxSL+Z3T/aCt4IO9Cejm03q3NKKYN6pFQzY0SBOr8h+eCIAZHPXcpZaNw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<link rel="stylesheet" href="/monit/resources/css/main.css" type="text/css">

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="<c:url value='/resources/js/jquery.min.js'/>"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js" integrity="sha512-T/tUfKSV1bihCnd+MxKD0Hm1uBBroVYBOYSk1knyvQ9VyZJpc/ALb4P0r6ubwVPSGB2GvjeoMAJJImBG12TiaQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js" integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE" crossorigin="anonymous"></script>
</head>
<body>
<%@ include file="/WEB-INF/views/import/appbar.jsp" %>

<div class="bg-light border py-md-2">
	<%@ include file="/WEB-INF/views/import/sidebars.jsp" %>
	<main class="col-md-12 ms-md-auto col-lg-10 px-md-3">
		<div class="row py-2 dashboard_ml-0" style="width: 100%">
		    <div class="col bg-white border rounded-3 mx-2  dashboard_row3">
			    <div class="p-4">
			    	<div>
			    	</div>
				</div>
		    </div>
		    <div class="col bg-white border rounded-3 mx-2 dashboard_row3">
			    <div class="p-4">
			    	<div>
			    	</div>
				</div>
		    </div>
		    <div class="col bg-white border rounded-3 mx-2 dashboard_row3">
			    <div class="p-4">
			    	<div>
			    	</div>
				</div>
		    </div>
	    </div>
	    <div class="row py-2 dashboard_ml-0" style="width: 100%">
	    	<div class="col bg-white border rounded-3 mx-2" style="width: 100%">
			    <div class="p-5">
				</div>
		    </div>
	    </div>
	</main>

</div>
</body>
</html>