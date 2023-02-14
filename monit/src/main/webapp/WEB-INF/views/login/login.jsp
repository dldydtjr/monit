<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="/monit/resources/css/signin.css" type="text/css">

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css" integrity="sha512-mSYUmp1HYZDFaVKK//63EcZq4iFWFjxSL+Z3T/aCt4IO9Cejm03q3NKKYN6pFQzY0SBOr8h+eCIAZHPXcpZaNw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="<c:url value='/resources/js/jquery.min.js'/>"></script>

<script type="text/javascript">

function login() {
	window.location.href = '/monit/integrate';
	
// 	var id = jQuery("#id").val(); 
// 	var password = jQuery("#password").val(); 
	
//     $.ajax({
// 		type: "POST",
// 		url: "<c:url value='/login'/>",
// 		dataType: "json",
// 		data : { id: id, password: password },
// 		timeout: 10000,
// 		success: function(result) {
// 			console.log(result);
// 			if(result == "0"){
// 				window.location.href = '/monit/integrate';
// 			}else{
// 				alert("로그인 실패");
// 			}
// 		},
// 		error : function(result) {
			
// 		}
//     });
}

</script>

</head>
  <body class="text-center">
    
<main class="form-signin">
    <h1 class="h3 mb-3 fw-normal">Please sign in</h1>

    <div class="form-floating">
      <input type="text" class="form-control" id="id" placeholder="ID">
      <label for="floatingInput">ID</label>
    </div>
    <div class="form-floating">
      <input type="password" class="form-control" id="password" placeholder="Password">
      <label for="floatingPassword">Password</label>
    </div>

    <div class="checkbox mb-3">
<!--       <label> -->
<!--         <input type="checkbox" value="remember-me"> Remember me -->
<!--       </label> -->
    </div>
    <button class="w-100 btn btn-lg btn-primary" onclick="javascript:login();">Sign in</button>
<!--     <p class="mt-5 mb-3 text-muted">&copy; 2017–2021</p> -->
</main>


    
  </body>
</html>