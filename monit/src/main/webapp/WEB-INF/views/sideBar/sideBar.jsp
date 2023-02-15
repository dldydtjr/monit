<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<html>
	<meta charset="EUC-KR">
	<title>Insert title here</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css" integrity="sha512-mSYUmp1HYZDFaVKK//63EcZq4iFWFjxSL+Z3T/aCt4IO9Cejm03q3NKKYN6pFQzY0SBOr8h+eCIAZHPXcpZaNw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<link rel="stylesheet" href="/edms/resources/css/main.css" type="text/css">
	<head>
		
	<style>		
		:root {
		    --nav--width: 92px;
		
		    /* Colores */
		    --first-color: #0c5df4;
		    --bg-color: #12192c;
		    --sub-color: #b6cefc;
		    --white-color: #fff;
		
		    /* Fuente y tipografia */
		    --body-font: 'Poppins', sans-serif;
		    --normal-font-size: 1rem;
		    --small-font-size: .875rem;
		
		    /* z index */
		    --z-fixed: 100;
		}
		
		/* BASE */
		*, ::before, ::after {
		    box-sizing: border-box;
		}
		
		body {
		    position: relative;
		    margin: 0;
		    padding: 2rem 0 0 6.75rem;
		    font-family: var(--body-font);
		    font-size: var(--normal-font-size);
		    transition: .5s;
		}
		
		h1 {
		    margin: 0;
		}
		
		ul {
		    margin: 0;
		    padding: 0;
		    list-style: none;
		}
		
		a {
		    text-decoration: none;
		}
		
		/* l NAV */
		.l-navbar {
		    position: fixed;
		    top: 0;
		    left: 0;
		    width: var(--nav--width);
		    height: 100vh;
		    background-color: var(--bg-color);
		    color: var(--white-color);
		    padding: 1.5rem 1.5rem 2rem;
		    transition: .5s;
		    z-index: var(--z-fixed);
		}
		
		/* NAV */
		.nav {
		    height: 100%;
		    display: flex;
		    flex-direction: column;
		    justify-content: space-between;
		    overflow: hidden;
		}
		
		.nav__brand {
		    display: grid;
		    grid-template-columns: 1fr 3fr;
		    justify-content: space-between;
		    align-items: center;
		    margin-bottom: 2rem;
		}
		.nav__brand__padding {
			display: grid;		   
		    grid-template-columns: 1fr 4fr;
		    justify-content: space-between;
		    align-items: left;
		    margin-left: 25%;
		}
		
		.nav__toggle {
		    font-size: 1.25rem;
		    padding: .75rem;
		    cursor: pointer;
		}
		
		#close{
			cursor: pointer;
		}
		.nav__logo {
		    color: var(--white-color);
		    font-weight: 600;
		}
		
		.nav__link {
		    display: grid;
		    grid-template-columns: 20px max-content 1fr;
		    align-items: center;
		    column-gap: .75rem;
		    padding: .75rem;
		    color: var(--white-color);
		    border-radius: .5rem;
		    margin-bottom: 1rem;
		    transition: .3s;
		    cursor: pointer;
		}
		.nav__link2 {
		    align-items: center;
		    column-gap: .75rem;
		    padding: 2px;
		    color: var(--white-color);
		    border-radius: .5rem;
		    transition: .3s;
		    cursor: pointer;
		    width: 100px;		    
		}
		.nav__link3 {
		    display: grid;
		    grid-template-columns: 20px 2fr 1fr;
		    align-items: center;
		    column-gap: .75rem;
		    padding: .75rem;
		    color: var(--white-color);
		    border-radius: .5rem;
		    margin-bottom: 1rem;
		    transition: .3s;
		    cursor: pointer;
		}
		.nav__link:hover {
			color: var(--white-color);
		    background-color: rgba(255, 0, 0, 0.2);
		}
		.nav__icon {
		    font-size: 1.25rem;
		}
		
		.nav_name {
		    font-size: var(--small-font-size);
		}
		
		/* Expander menu */
		.expander {
		    width: calc(var(--nav--width) + 9.25rem);
		}
		
		/* Add padding body*/
		.body-pd {
		    padding: 2rem 0 0 16rem;
		}
		
		/* Active links menu */
		.active {
		    background-color: var(--first-color);
		}

		.collapse__link {
		    justify-self: flex-end;
		    transition: .5;
		}
		
		.collapse__menu {
		    display: none;
		    padding: .75rem 2.25rem;
		}
		
		.collapse__sublink {
		    color: var(--sub-color);
		    font-size: var(--small-font-size);
		}
		
		.collapse__sublink:hover {
		    color: var(--white-color);
		    background-color: rgba(255, 0, 0, 0.2);
		}
		
		/* Show collapse */
		.showCollapse {
		    display: block;
		}
		
		/* Rotate icon */
		.rotate {
		    transform: rotate(180deg);
		    transition: .5s;
		}

	</style>
	
	
	</head>
	<body id="body-pd">
		
<!-- navbar -->
		<div class="l-navbar" id="navbar">
	        <nav class="nav">
	            <div>
	                <div class="nav__list">
	                	<a href="sideBar" class="nav__link">
	                        <ion-icon name="home-outline" class="nav__icon"></ion-icon>
	                        <span class="nav_name">통합모니터링</span>
	                    </a>
	                
	                    <a href="page1" class="nav__link">
	                        <ion-icon name="home-outline" class="nav__icon"></ion-icon>
	                        <span class="nav_name">모니터링</span>
	                    </a> 
	                    
	                                       
						<div href="#" class="nav__link3">						
							<ion-icon name="people-outline" class="nav__icon icon"></ion-icon>
	                        <span class="aaa">통계</span>
	                        <ion-icon name="chevron-down-outline" class="collapse__link" ></ion-icon>
							
	                        <div class="collapse__menu">
	                            <div href="#" class="collapse__sublink nav__link2">Data</div>
	                            <div href="#" class="collapse__sublink nav__link2">Group</div>
	                            <div href="#" class="collapse__sublink nav__link2">Members</div>
	                        </div>
	                    </div>
	                    
	                  
	                    <div href="#" class="nav__link3">
	                        <ion-icon name="folder-outline" class="nav__icon icon"></ion-icon>
	                        <span class="aaa">보고서</span>
	                        <ion-icon name="chevron-down-outline" class="collapse__link"></ion-icon>
	
	                        <div class="collapse__menu">
	                            <div href="#" class="collapse__sublink nav__link2">Data</div>
	                            <div href="#" class="collapse__sublink nav__link2">Group</div>
	                            <div href="#" class="collapse__sublink nav__link2">Members</div>
	                        </div>
	                    </div>
	
	                    <a href="#" class="nav__link">
	                        <ion-icon name="pie-chart-outline" class="nav__icon"></ion-icon>
	                        <span class="nav_name">운영</span>
	                    </a>
	                    
						<a href="#" class="nav__link">
	                        <ion-icon name="chatbubbles-outline" class="nav__icon"></ion-icon>
	                        <span class="nav_name">정보</span>
	                    </a>
	                    
	                    <a href="#" class="nav__link">
	                        <ion-icon name="settings-outline" class="nav__icon"></ion-icon>
	                        <span class="nav_name">로그아웃</span>
	                    </a>
	                </div>
	                <div class="nav__brand">
                    	<ion-icon name="chevron-forward-outline" class="nav__toggle" id="nav-toggle"></ion-icon>                    	
                    	<span id="close">접기</span>                 
                	</div>
	            </div>
	        </nav>
	    </div>
<!-- navbar -->





<!-- 위 -->
		<div>
			<div style="width:20%; float: left; height:300px;">
				<p>현재 소비전력</p>
				<div>
					<div style=" width:50%; float: left;">
						<p>현재 전력</p>
						<p>1,250 KW</p>
					</div>
					<div style=" width:50%; float: left;">
						<p>목표 전력</p>
						<!-- <p>3,000 KW</p> -->
						<%-- <c:forEach items="${ list }" var="m">
							<p>${ m.pt_target }</p>							 
						</c:forEach> --%>
						<p>${ sessionScope.data }</p>
					</div>
					<div>
						<canvas id="myChart" height="100px"></canvas>
					</div>
				</div>
			</div>
			<div style="width:20%; float: left; height:300px;">
				<img src="resources/img/alarm.png" style="width: 80px; height: 80px;">
				<p>2,458kW</p>
			</div>
			<div style="width:20%; float: left; height:300px;">
				c
			</div>
			<div style="width:20%; float: left; height:300px;">
				d
			</div>
			<div style="width:20%; float: left; height:300px;">
				<div style="display: flex;">
					<div style="width:75%;">경부하</div>
					<div style="float: right; width:25%;">150kW</div>
				</div>
				<canvas id="myChart4" height="20px"></canvas>
				
				<div style="display: flex;">
					<div style="width:75%;">중부화</div>
					<div style="float: right; width:25%;">50kW</div>
				</div>
				<canvas id="myChart5" height="20px"></canvas>
				
				<div style="display: flex;">
					<div style="width:75%;">최대부하</div>
					<div style="float: right; width:25%;">328kW</div>
				</div>
				<canvas id="myChart6" height="20px"></canvas>
			</div>
		</div>
<!-- 위 -->    
<!-- 아래 -->
		<div>
			<div style="width:20%; float: left; height:300px;">
				<p>15분 단위 소비전력</p>
				<div>
					<canvas id="myChart2" height="100px"></canvas>
				</div>
					
				<div style="display: flex;">
					<div style="width:75%;">기준 전력</div>
					<div style="float: right; width:25%;">745kW</div>
				</div>
				<div style="display: flex;">
					<div style="width:75%;">목표 전력</div>
					<div style="float: right; width:25%;">548kW</div>
				</div>
				<div style="display: flex;">
					<div style="width:75%;">예상 전력</div>
					<div style="float: right; width:25%;">745kW</div>
				</div>
				<div style="display: flex;">
					<div style="width:75%;">15분전 전력</div>
					<div style="float: right; width:25%;">548kW</div>
				</div>
			</div>
			<div style="width:80%; float: left; height:300px;">
				<p>일간 소비전력</p>
				
				<div style="float: left; width:25%; border-right: thick double #32a1ce;">
					<div style="float: left; width:75%;">오늘 최대수요 전력</div>
					<div style="float: right; width:25%;">548kW</div>
				</div>
				<div style="float: left; width:25%; border-right: thick double #32a1ce;">
					<div style="float: left; width:75%;">어제 최대수요 전력</div>
					<div style="float: right; width:25%;">745kW</div>
				</div>
				<div style="float: left; width:25%; border-right: thick double #32a1ce;">
					<div style="float: left; width:75%;">오늘 소비전력</div>
					<div style="float: right; width:25%;">548kW</div>
				</div>
				<div style="float: left; width:25%;">
					<div style="float: left; width:75%;">어제 소비전력</div>
					<div style="float: right; width:25%;">745kW</div>
				</div>
				
				<div>
					<canvas id="myChart3" height="50px"></canvas>
				</div>
			</div>
		</div>
<!-- 아래 -->         
		
		
		<script src="<c:url value='/resources/js/jquery.min.js'/>"></script>
		<script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
        <!-- chart.js -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
       
				
		<script>			
			/* EXPANDER MENU */
			const padding = document.querySelector('.nav__brand')
			const showMenu = (toggleId, closeId, navbarId, bodyId) => {
			    const toggle = document.getElementById(toggleId),
			    	  close = document.getElementById(closeId),
			    	  navbar = document.getElementById(navbarId),
			    	  bodypadding = document.getElementById(bodyId)
	
			    if( toggle && navbar ) {
			        toggle.addEventListener('click', ()=>{
			            navbar.classList.toggle('expander');			           
			            bodypadding.classList.toggle('body-pd');
						toggle.classList.toggle('rotate');
						padding.classList.toggle("nav__brand__padding");
			        });			        			        
			    }
			    if( close && navbar ) {
			    	close.addEventListener('click', ()=>{
			            navbar.classList.toggle('expander');			           
			            bodypadding.classList.toggle('body-pd');
						toggle.classList.toggle('rotate');
						padding.classList.remove('nav__brand__padding');
			        });			        			        
			    }
			    
			}
	
			showMenu('nav-toggle', 'close', 'navbar', 'body-pd')
	
			/* LINK ACTIVE */
			const linkColor = document.querySelectorAll('.nav__link')
			const linkColor2 = document.querySelectorAll('.nav__link2')
			
			function colorLink() {
			    linkColor.forEach(l=> l.classList.remove('active'))
			    this.classList.add('active')
			}
			linkColor.forEach(l=> l.addEventListener('click', colorLink))
			
			function colorLink2() {
			    linkColor2.forEach(l=> l.classList.remove('active'))
			    this.classList.add('active')
			}
			linkColor2.forEach(l=> l.addEventListener('click', colorLink2))
	
			/* COLLAPSE MENU */
			const linkCollapse = document.getElementsByClassName('collapse__link')
			const linkCollapse2 = document.getElementsByClassName('aaa')
			const linkCollapse3 = document.getElementsByClassName('icon')
			var i
	
			for(i=0;i<linkCollapse.length;i++) {
			    linkCollapse[i].addEventListener('click', function(){
			        const collapseMenu = this.nextElementSibling
			        collapseMenu.classList.toggle('showCollapse')
	
			        const rotate = collapseMenu.previousElementSibling
			        rotate.classList.toggle('rotate')
			    });
			}
			for(i=0;i<linkCollapse2.length;i++) {
			    linkCollapse2[i].addEventListener('click', function(){
			        const collapseMenu2 = this.nextElementSibling			        
			        collapseMenu2.nextElementSibling.classList.toggle('showCollapse')
			        
			        const rotate = collapseMenu2.nextElementSibling.previousElementSibling
			        rotate.classList.toggle('rotate')
			    });
			}
			for(i=0;i<linkCollapse3.length;i++) {
			    linkCollapse3[i].addEventListener('click', function(){
			        const collapseMenu3 = this.nextElementSibling			        
			        collapseMenu3.nextElementSibling.nextElementSibling.classList.toggle('showCollapse')
			        
			        const rotate = collapseMenu3.nextElementSibling.nextElementSibling.previousElementSibling
			        rotate.classList.toggle('rotate')
			    });
			}			
		</script>
		
		<script type="text/javascript">
		var data = {				
				labels: [0,5,10,15,20,25,30,35,40,45,50,55,60], // X축 
  		    	datasets: [{
  		    	    data: [100, 200, 260, 300, 333, 300, 400, 370, 250, 345, 600, 500, 299],
  		  //  	    label: "2",
  		    	    borderColor: "#a853bb",
  		    	    pointBackgroundColor: 'red',
		    	    pointRadius: 3,//점 크기 숫자 높을 수록 커짐
  		    	    fill: false  
  		    	}]	
		}
		var config = {					
				type: 'line',
  		    	data: data,
  		    	options:{
  		    		legend:{
  		    			display: false,       //label 안보이게		    			
  		    		}  		    		
  		    	}
		}
	
		const myChart = new Chart(
			    document.getElementById('myChart'),
			    config
		);
		
		
////////////////////////////////////////////////////////////////////////////////////////////////		
		
		
		
		var data2 = {				
				labels: [0,5,10,15,20,25,30,35,40,45,50,55,60], // X축 
  		    	datasets: [{
  		    	    data: [100, 200, 260, 300, 333, 300, 400, 370, 250, 345, 600, 500, 299],
  		  //  	    label: "2",
  		    	    borderColor: "#a853bb",
  		    	    pointBackgroundColor: 'red',
		    	    pointRadius: 3,//점 크기 숫자 높을 수록 커짐
  		    	    fill: false  
  		    	},{
  		    		data: [150, 220, 360, 100, 533, 300, 470, 310, 223, 145, 432, 567, 200],
  		  		    borderColor: "#543649",
  		  		    pointBackgroundColor: 'blue',
  				    pointRadius: 3,//점 크기 숫자 높을 수록 커짐
  		  		    fill: false
  		    	}]	
		}
		var config2 = {					
				type: 'line',
  		    	data: data2,
  		    	options:{
  		    		legend:{
  		    			display: false       //label 안보이게
  		    		}  		    		
  		    	}
		}
	
		const myChart2 = new Chart(
			    document.getElementById('myChart2'),
			    config2
		);
		
		
////////////////////////////////////////////////////////////////////////////////////////////////		
		
		var data3 = {				
				labels: [0,5,10,15,20,25,30,35,40,45,50,55,60], // X축 
  		    	datasets: [{
  		    		type: 'line',
  		    		label: "오늘 최대수요전력",
  		    		data: [100, 200, 260, 300, 333, 300, 400, 370, 250, 345, 600, 500, 299], 
  		    	    borderColor: "#a853bb",
  		    	    pointBackgroundColor: 'red',
		    	    pointRadius: 3,//점 크기 숫자 높을 수록 커짐
  		    	    fill: false  
  		    	},{
  		    		type: 'line',
  		    		label: "어제 최대수요 전력",
  		    		data: [150, 220, 360, 100, 533, 300, 470, 310, 223, 145, 432, 567, 200],
  		  		    borderColor: "#543649",
  		  		    pointBackgroundColor: 'blue',
  				    pointRadius: 3,//점 크기 숫자 높을 수록 커짐
  		  		    fill: false
  		    	},{
  		    		type: 'bar',
  		    		label: "오늘 소비전력",
  		    		data: [111, 222, 333, 333, 444, 222, 111, 555, 543, 321, 235, 533, 238],
  		    		backgroundColor: '#1ab4c6', 		  		   
  		    	},{
  		    		type: 'bar',
  		    		label: "어제 소비전력",
  		    		data: [497, 307, 379, 375, 586, 275, 532, 425, 252, 522, 521, 325, 159],
  		    		backgroundColor: '#154ba1',	  		   
  		    	}]	
		}
		var config3 = {					
				type: 'bar',
  		    	data: data3,
  		    	options:{
  		    		legend:{ 		    			
  		 				position: 'bottom', 		 				
  		    		}, 		    		
  		    	} 		    	
		}
		
		const myChart3 = new Chart(
			    document.getElementById('myChart3'),
			    config3
		);
		
////////////////////////////////////////////////////////////////////////////////////////////////		
		
		var data4 = {
  		    	datasets: [{ 		    		
  		    	    data: [10],
  		    	    backgroundColor: 'green',	  		    	
  		    	}]	
		}
		var config4 = {					
				type: 'horizontalBar',	//수평 막대			
  		    	data: data4,
  		    	options:{
  		    		tooltips: {
 		    	         enabled: false		//툴팁 안보이게 버전에 따라 쓰는 법 다름
 		    	    },
  		    		legend:{
  		    			display: false,       //label 안보이게		    			
  		    		},  		    				    							
  		    		scales:{						   
					    yAxes:[{					    	
					    	display: false//뒤 실선 안보이게
					    }],
					    xAxes:[{					    
					    	display: false,
					    	ticks:{
					    		max: 20,
					    		min: 0,
					    		stepSize: 5
					    	}
					    }]
					    
					},
					
  		    	}
		}	
		const myChart4 = new Chart(
			    document.getElementById('myChart4'),
			    config4
		);
		
		
		
////////////////////////////////////////////////////////////////////////////////////////////////		
		
		var data5 = {
  		    	datasets: [{ 		    		
  		    	    data: [3],
  		    	    backgroundColor: 'red',	  		    	
  		    	}]	
		}
		var config5 = {					
				type: 'horizontalBar',	//수평 막대			
  		    	data: data5,
  		    	options:{
  		    		tooltips: {
 		    	         enabled: false		//툴팁 안보이게 버전에 따라 쓰는 법 다름
 		    	    },
  		    		legend:{
  		    			display: false,       //label 안보이게		    			
  		    		},  		    				    							
  		    		scales:{						   
					    yAxes:[{					    	
					    	display: false//뒤 실선 안보이게
					    }],
					    xAxes:[{					    
					    	display: false,
					    	ticks:{
					    		max: 20,
					    		min: 0,
					    		stepSize: 5
					    	}
					    }]
					    
					},
					
  		    	}
		}	
		const myChart5 = new Chart(
			    document.getElementById('myChart5'),
			    config5
		);		
		
////////////////////////////////////////////////////////////////////////////////////////////////		
		
		var data6 = {
  		    	datasets: [{ 		    		
  		    	    data: [8],
  		    	    backgroundColor: 'yellow',	  		    	
  		    	}]	
		}
		var config6 = {					
				type: 'horizontalBar',	//horizontalBar : 수평 막대			
  		    	data: data6,
  		    	maintainAspectRatio :false,//그래프의 비율 유지 
  		    	options:{
  		    		tooltips: {
  		    	         enabled: false		//툴팁 안보이게 버전에 따라 쓰는 법 다름
  		    	    },
  		    		legend:{
  		    			display: false,       //label 안보이게		    			
  		    		},  		    				    							
  		    		scales:{						   
					    yAxes:[{					    	
					    	display: false//뒤 실선 안보이게
					    }],
					    xAxes:[{					    
					    	display: false,
					    	ticks:{
					    		max: 20,
					    		min: 0,
					    		stepSize: 5
					    	}
					    }]					    
					},

  		    	}
		}	
		const myChart6 = new Chart(
			    document.getElementById('myChart6'),
			    config6
		);		
		
		

		
		
		
		
		
		
		
		
		
		
		
		</script>
	</body>
</html>