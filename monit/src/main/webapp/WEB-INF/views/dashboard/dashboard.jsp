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

<link rel="stylesheet" href="/edms/resources/css/main.css" type="text/css">
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
			    		<h2>실시간 현황정보</h2>
			    		<p></p>
			    		<p></p>
			    		<ul>
			    			<li id="baseDatetime"></li>
			    			<li id="T1H"></li>
			    			<li id="RN1"></li>
			    			<li id="SKY"></li>
			    		</ul>
			    	</div>
				</div>
		    </div>
		    <div class="col bg-white border rounded-3 mx-2 dashboard_row3">
			    <div class="p-4">
			    	<div>
			    		<h3>실시간 전력수급현황</h3>
			    		<p></p>
			    		<p></p>
			    		<ul>
			    			<li id="suppAbility">공급능력</li>
			    			<li id="currPwrTot">현재수요</li>
			    			<li id="suppReservePwr">공급예비력</li>
			    			<li id="suppReserveRate">공급예비율</li>
			    		</ul>
			    	</div>
				</div>
		    </div>
		    <div class="col bg-white border rounded-3 mx-2 dashboard_row3">
			    <div class="p-4">
			    	<div>
			    		<h3>실시간 운영전력현황</h3>
			    		<p></p>
			    		<p></p>
			    		<ul>
			    			<li id="forecastLoad">최대예측수요</li>
			    			<li id="operReservePwr">운영예비력</li>
			    			<li id="operReserveRate">운영예비율</li>
			    		</ul>
			    	</div>
				</div>
		    </div>
<!-- 		    <div class="col bg-white border rounded-3 mx-2 dashboard_row3"> -->
<!-- 			    <div class="p-4"> -->
<%-- 			    	<canvas id="myChart6"></canvas> --%>
<!-- 				</div> -->
<!-- 		    </div> -->
	    </div>
	    <div class="row py-2 dashboard_ml-0" style="width: 100%">
	    	<div class="col bg-white border rounded-3 mx-2" style="width: 100%">
			    <div class="p-5">
			    	<canvas id="myChart"></canvas>
				</div>
		    </div>
	    </div>
<!--    		<div class="row py-2 dashboard_ml-0" style="width: 100%"> -->
<!-- 		    <div class="col bg-white border rounded-3 mx-2" style="width: 48%"> -->
<!-- 			    <div class="py-4"> -->
<%-- 			    	<canvas id="myChart"></canvas> --%>
<!-- 				</div> -->
<!-- 		    </div> -->
<!-- 		    <div class="col bg-white border rounded-3 mx-2" style="width: 48%"> -->
<!-- 			    <div class="py-4"> -->
<%-- 			    	<canvas id="myChart2"></canvas> --%>
<!-- 				</div> -->
<!-- 		    </div> -->
<!-- 	    </div> -->
	</main>

</div>
  

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="<c:url value='/resources/js/jquery.min.js'/>"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js" integrity="sha512-T/tUfKSV1bihCnd+MxKD0Hm1uBBroVYBOYSk1knyvQ9VyZJpc/ALb4P0r6ubwVPSGB2GvjeoMAJJImBG12TiaQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js" integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE" crossorigin="anonymous"></script>
<script>

jQuery('.datePicker')
	.datepicker({
		format: 'yyyy-mm-dd', //데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 ) 
		startDate: '-10d', //달력에서 선택 할 수 있는 가장 빠른 날짜. 이전으로는 선택 불가능 ( d : 일 m : 달 y : 년 w : 주) 
		endDate: '+10d', //달력에서 선택 할 수 있는 가장 느린 날짜. 이후로 선택 불가 ( d : 일 m : 달 y : 년 w : 주) 
		autoclose: true, //사용자가 날짜를 클릭하면 자동 캘린더가 닫히는 옵션 
		calendarWeeks: false, //캘린더 옆에 몇 주차인지 보여주는 옵션 기본값 false 보여주려면 true 
		clearBtn: false, //날짜 선택한 값 초기화 해주는 버튼 보여주는 옵션 기본값 false 보여주려면 true 
		datesDisabled: ['2019-06-24', '2019-06-26'], //선택 불가능한 일 설정 하는 배열 위에 있는 format 과 형식이 같아야함. 
		daysOfWeekDisabled: [0, 6], //선택 불가능한 요일 설정 0 : 일요일 ~ 6 : 토요일 
// 		daysOfWeekHighlighted: [3], //강조 되어야 하는 요일 설정 
		disableTouchKeyboard: false, //모바일에서 플러그인 작동 여부 기본값 false 가 작동 true가 작동 안함. 
		immediateUpdates: false, //사용자가 보는 화면으로 바로바로 날짜를 변경할지 여부 기본값 :false 
		multidate: false, //여러 날짜 선택할 수 있게 하는 옵션 기본값 :false 
		multidateSeparator: ',', //여러 날짜를 선택했을 때 사이에 나타나는 글짜 2019-05-01,2019-06-01 
		templates: { leftArrow: '&laquo;', rightArrow: '&raquo;', }, //다음달 이전달로 넘어가는 화살표 모양 커스텀 마이징 
		showWeekDays: true, // 위에 요일 보여주는 옵션 기본값 : true 
// 		title: '테스트', //캘린더 상단에 보여주는 타이틀 
		todayHighlight: true, //오늘 날짜에 하이라이팅 기능 기본값 :false 
		toggleActive: true, //이미 선택된 날짜 선택하면 기본값 : false인경우 그대로 유지 true인 경우 날짜 삭제 
		weekStart: 0, //달력 시작 요일 선택하는 것 기본값은 0인 일요일 
		language: 'ko', //달력의 언어 선택, 그에 맞는 js로 교체해줘야한다. 
	}) .on('changeDate', function (e) { 
		/* 이벤트의 종류 */ 
		//show : datePicker가 보이는 순간 호출 
		//hide : datePicker가 숨겨지는 순간 호출 
		//clearDate: clear 버튼 누르면 호출 
		//changeDate : 사용자가 클릭해서 날짜가 변경되면 호출 (개인적으로 가장 많이 사용함) 
		//changeMonth : 월이 변경되면 호출 
		//changeYear : 년이 변경되는 호출 
		//changeCentury : 한 세기가 변경되면 호출 ex) 20세기에서 21세기가 되는 순간 
		console.log(e); 
		// e.date를 찍어보면 Thu Jun 27 2019 00:00:00 GMT+0900 (한국 표준시) 위와 같은 형태로 보인다. 
	});


//   const labels = ['00:00','00:15','00:30','00:45'
//   					,'01:00','01:15','01:30','01:45'
//   					,'02:00','02:15','02:30','02:45'
//   					,'03:00','03:15','03:30','03:45'
//   					,'04:00','04:15','04:30','04:45'
//   					,'05:00','05:15','05:30','05:45'
//   					,'06:00','06:15','06:30','06:45'
//   					,'07:00','07:15','07:30','07:45'
//   					,'08:00','08:15','08:30','08:45'
//   					,'09:00','09:15','09:30','09:45'
//   					,'10:00','10:15','10:30','10:45'
//   					,'11:00','11:15','11:30','11:45'
//   					,'12:00','12:15','12:30','12:45'
//   					,'13:00','13:15','13:30','13:45'
//   					,'14:00','14:15','14:30','14:45'
//   					,'15:00','15:15','15:30','15:45'
//   					,'16:00','16:15','16:30','16:45'
//   					,'17:00','17:15','17:30','17:45'
//   					,'18:00','18:15','18:30','18:45'
//   					,'19:00','19:15','19:30','19:45'
//   					,'20:00','20:15','20:30','20:45'
//   					,'21:00','21:15','21:30','21:45'
//   					,'22:00','22:15','22:30','22:45'
//   					,'23:00','23:15','23:30','23:45'
//   					,'24:00'
// 	  ];

	  const labels = [
		  '00:00','00:05','00:10','00:15','00:20','00:25','00:30','00:35','00:40','00:45','00:50','00:55'
		  ,'01:00','01:05','01:10','01:15','01:20','01:25','01:30','01:35','01:40','01:45','01:50','01:55'
		  ,'02:00','02:05','02:10','02:15','02:20','02:25','02:30','02:35','02:40','02:45','02:50','02:55'
		  ,'03:00','03:05','03:10','03:15','03:20','03:25','03:30','03:35','03:40','03:45','03:50','03:55'
		  ,'04:00','04:05','04:10','04:15','04:20','04:25','04:30','04:35','04:40','04:45','04:50','04:55'
		  ,'05:00','05:05','05:10','05:15','05:20','05:25','05:30','05:35','05:40','05:45','05:50','05:55'
		  ,'06:00','06:05','06:10','06:15','06:20','06:25','06:30','06:35','06:40','06:45','06:50','06:55'
		  ,'07:00','07:05','07:10','07:15','07:20','07:25','07:30','07:35','07:40','07:45','07:50','07:55'
		  ,'08:00','08:05','08:10','08:15','08:20','08:25','08:30','08:35','08:40','08:45','08:50','08:55'
		  ,'09:00','09:05','09:10','09:15','09:20','09:25','09:30','09:35','09:40','09:45','09:50','09:55'
		  ,'10:00','10:05','10:10','10:15','10:20','10:25','10:30','10:35','10:40','10:45','10:50','10:55'
		  ,'11:00','11:05','11:10','11:15','11:20','11:25','11:30','11:35','11:40','11:45','11:50','11:55'
		  ,'12:00','12:05','12:10','12:15','12:20','12:25','12:30','12:35','12:40','12:45','12:50','12:55'
		  ,'13:00','13:05','13:10','13:15','13:20','13:25','13:30','13:35','13:40','13:45','13:50','13:55'
		  ,'14:00','14:05','14:10','14:15','14:20','14:25','14:30','14:35','14:40','14:45','14:50','14:55'
		  ,'15:00','15:05','15:10','15:15','15:20','15:25','15:30','15:35','15:40','15:45','15:50','15:55'
		  ,'16:00','16:05','16:10','16:15','16:20','16:25','16:30','16:35','16:40','16:45','16:50','16:55'
		  ,'17:00','17:05','17:10','17:15','17:20','17:25','17:30','17:35','17:40','17:45','17:50','17:55'
		  ,'18:00','18:05','18:10','18:15','18:20','18:25','18:30','18:35','18:40','18:45','18:50','18:55'
		  ,'19:00','19:05','19:10','19:15','19:20','19:25','19:30','19:35','19:40','19:45','19:50','19:55'
		  ,'20:00','20:05','20:10','20:15','20:20','20:25','20:30','20:35','20:40','20:45','20:50','20:55'
		  ,'21:00','21:05','21:10','21:15','21:20','21:25','21:30','21:35','21:40','21:45','21:50','21:55'
		  ,'22:00','22:05','22:10','22:15','22:20','22:25','22:30','22:35','22:40','22:45','22:50','22:55'
		  ,'23:00','23:05','23:10','23:15','23:20','23:25','23:30','23:35','23:40','23:45','23:50','23:55'
		  ,'24:00'
		  ];

  const data = {
    labels: labels,
    datasets: [
    	{
	      label: '실시간 전력수급 그래프 (MW)',
	      backgroundColor: 'rgb(223, 0, 0)',
	      borderColor: 'rgb(223, 0, 0)',
	      data: [52000, 52000, 52000, 52000, 52000, 52000, 52000, 52000, 52000, 52000, 52000, 52000],
	      pointRadius: 1
	    },
    ]
  };

  const config = {
    type: 'line',
    data: data,
    options: {
        scales: {
            x: {
              ticks: {
                // For a category axis, the val is the index so the lookup via getLabelForValue is needed
                callback: function(val, index) {
                  // Hide every 2nd tick label
                  return index % 12 === 0 ? this.getLabelForValue(val) : '';
                },
              }
            }
          }
    }
  };
  
  const myChart = new Chart(
    document.getElementById('myChart'),
    config
  );
  
//   const data2 = {
// 		  labels: [
// 		    '난방보일러',
// 		    '냉동기',
// 		    '지열시스템',
// 		    'EHP'
// 		  ],
// 		  datasets: [{
// 		    label: 'My First Dataset',
// 		    data: [33.27, 33.29, 33.32, 0.12],
// 		    backgroundColor: [
// 	 	      'rgb(255, 99, 132)',
// 		      'rgb(54, 162, 235)',
// 		      'rgb(255, 205, 86)',
// 		      'rgb(0, 153, 0)',
// 		    ],
// 		    hoverOffset: 4,
// 		  }]
// 		};
	  
// 	  const config2 = {
// 		  type: 'doughnut',
// 		  data: data2,
// 		  options: {
// 			  maintainAspectRatio: false
// 		  }
// 		};
	  
// 	  const myChart6 = new Chart(
// 	    document.getElementById('myChart6'),
// 	    config2
// 	  );
	  
// 	var tt = 20;
	
// 	function test(){
// 		tt = tt==20?50:20;
// 		myChart3.data.datasets[0].data[3] = tt;
// 		myChart3.update();
// 	}
	
	
	function getLocation() {
// 		  if (navigator.geolocation) { // GPS를 지원하면
// 		    navigator.geolocation.getCurrentPosition((position) => {
// // 		      console.log(position.coords.latitude + ' ' + position.coords.longitude);
// 		        var xy = dfs_xy_conv("toXY", position.coords.latitude, position.coords.longitude);
// // 		        console.log(xy.x + ", " + xy.y );
		        
// 		        var date = new Date();
// 		        var year = date.getFullYear().toString();
// 		        var month = date.getMonth()+1;
// 		        month = month < 10 ? '0'+month.toString() : month.toString();
// 		        var day = date.getDate();
// 		        day = day < 10 ? '0'+day.toString() : day.toString();
		        
// 		        var min = date.getMinutes();
// 		        var hour = date.getHours();
// 		        hour = min < 45 ? hour-1 : hour;
// 		        hour = hour < 10 ? '0'+hour.toString() : hour.toString();
// 		        min = '00';
		        
// 		        $.ajax({
// 					type: "POST",
// 					url: "<c:url value='/dashboard/getWeather'/>",
// 					dataType: "json",
// 					data : { x: xy.x, y: xy.y, base_date: year+month+day, base_time: hour+min },
// 					timeout: 10000,
// 					success: function(result) {
// // 						console.log(result.data);
// 						var dataArray = result.data;
// 						for(var i=0; i<dataArray.length; i++){
// 							jQuery("#"+dataArray[i].category).html(dataArray[i].name+" : "+dataArray[i].obsrValue+" "+dataArray[i].unit);
// 						}
// 					},
// 					error : function(result) {
						
// 					}
// 		        });
// // 		        var ll = dfs_xy_conv("toLL", xy.x, xy.y);
// // 		        console.log(ll.lat + ", " + ll.lng);
		        
// 		    }, function(error) {
// 		      console.error(error);
// 		    }, {
// 		      enableHighAccuracy: false,
// 		      maximumAge: 0,
// 		      timeout: Infinity
// 		    });
// 		  } else {
// 		    alert('GPS를 지원하지 않습니다');
// 		  }
		        var xy = dfs_xy_conv("toXY", 37.534783, 126.876292);
// 		        console.log(xy.x + ", " + xy.y );
		        
		        var date = new Date();
		        var year = date.getFullYear().toString();
		        var month = date.getMonth()+1;
		        month = month < 10 ? '0'+month.toString() : month.toString();
		        var day = date.getDate();
		        day = day < 10 ? '0'+day.toString() : day.toString();
		        
		        var min = date.getMinutes();
		        var hour = date.getHours();
		        hour = min < 45 ? hour-1 : hour;
		        hour = hour < 10 ? '0'+hour.toString() : hour.toString();
		        min = '00';
		        
		        $.ajax({
					type: "POST",
					url: "<c:url value='/dashboard/getWeather'/>",
					dataType: "json",
					data : { x: xy.x, y: xy.y, base_date: year+month+day, base_time: hour+min },
					timeout: 10000,
					success: function(result) {
// 						console.log(result.data);
						var dataArray = result.data;
						for(var i=0; i<dataArray.length; i++){
							jQuery("#"+dataArray[i].category).html(dataArray[i].name+" : "+dataArray[i].obsrValue+" "+dataArray[i].unit);
						}
					},
					error : function(result) {
						
					}
		        });
	}
	
	
    // 기상청 홈페이지에서 발췌한 변환 함수
    //
    // LCC DFS 좌표변환을 위한 기초 자료
    //
    var RE = 6371.00877; // 지구 반경(km)
    var GRID = 5.0; // 격자 간격(km)
    var SLAT1 = 30.0; // 투영 위도1(degree)
    var SLAT2 = 60.0; // 투영 위도2(degree)
    var OLON = 126.0; // 기준점 경도(degree)
    var OLAT = 38.0; // 기준점 위도(degree)
    var XO = 43; // 기준점 X좌표(GRID)
    var YO = 136; // 기1준점 Y좌표(GRID)
	
	 // LCC DFS 좌표변환 ( code : 
	//  "toXY"(위경도->좌표, v1:위도, v2:경도), 
	//  "toLL"(좌표->위경도,v1:x, v2:y) )
	function dfs_xy_conv(code, v1, v2) {
		var DEGRAD = Math.PI / 180.0;
		var RADDEG = 180.0 / Math.PI;
		
		var re = RE / GRID;
		var slat1 = SLAT1 * DEGRAD;
		var slat2 = SLAT2 * DEGRAD;
		var olon = OLON * DEGRAD;
		var olat = OLAT * DEGRAD;
		
		var sn = Math.tan(Math.PI * 0.25 + slat2 * 0.5) / Math.tan(Math.PI * 0.25 + slat1 * 0.5);
		sn = Math.log(Math.cos(slat1) / Math.cos(slat2)) / Math.log(sn);
		var sf = Math.tan(Math.PI * 0.25 + slat1 * 0.5);
		sf = Math.pow(sf, sn) * Math.cos(slat1) / sn;
		var ro = Math.tan(Math.PI * 0.25 + olat * 0.5);
		ro = re * sf / Math.pow(ro, sn);
		var rs = {};
		if (code == "toXY") {
		    rs['lat'] = v1;
		    rs['lng'] = v2;
		    var ra = Math.tan(Math.PI * 0.25 + (v1) * DEGRAD * 0.5);
		    ra = re * sf / Math.pow(ra, sn);
		    var theta = v2 * DEGRAD - olon;
		    if (theta > Math.PI) theta -= 2.0 * Math.PI;
		    if (theta < -Math.PI) theta += 2.0 * Math.PI;
		    theta *= sn;
		    rs['x'] = Math.floor(ra * Math.sin(theta) + XO + 0.5);
		    rs['y'] = Math.floor(ro - ra * Math.cos(theta) + YO + 0.5);
		}
		else {
		    rs['x'] = v1;
		    rs['y'] = v2;
		    var xn = v1 - XO;
		    var yn = ro - v2 + YO;
		    ra = Math.sqrt(xn * xn + yn * yn);
		    if (sn < 0.0) - ra;
		    var alat = Math.pow((re * sf / ra), (1.0 / sn));
		    alat = 2.0 * Math.atan(alat) - Math.PI * 0.5;
		    
		    if (Math.abs(xn) <= 0.0) {
		        theta = 0.0;
		    }
		    else {
		        if (Math.abs(yn) <= 0.0) {
		            theta = Math.PI * 0.5;
		            if (xn < 0.0) - theta;
		        }
		        else theta = Math.atan2(xn, yn);
		    }
		    var alon = theta / sn + olon;
		    rs['lat'] = alat * RADDEG;
		    rs['lng'] = alon * RADDEG;
		}
		return rs;
	}
    
	function getData() {
		// ajax
        var date = new Date();
        var year = date.getFullYear().toString();
        var month = date.getMonth()+1;
        month = month < 10 ? '0'+month.toString() : month.toString();
        var day = date.getDate();
        day = day < 10 ? '0'+day.toString() : day.toString();
        
	    var hour = date.getHours();
	    hour = hour < 10 ? '0'+hour.toString() : hour.toString();
	    var min = date.getMinutes();
	    min = min < 5 ? '00' : min < 10 ? '05' : min < 15 ? '10' : min < 20 ? '15' : min < 25 ? '20' : min < 30 ? '25' :
	    	min < 35 ? '30' : min < 40 ? '35' : min < 45 ? '40' : min < 50 ? '45' : min < 55 ? '50' : min <= 59 ? '55' : '0'; 
// 	    min = min < 10 ? '0'+min.toString() : min.toString();
     
        var data = [];
        $.ajax({
			type: "POST",
			url: "<c:url value='/dashboard/getData'/>",
			dataType: "json",
			data : { searchDate: year+month+day, searchTime: hour+":"+min },
			timeout: 10000,
			async: false,
			success: function(result) {
				data = result.ptValue;
			},
			error : function(result) {
				
			}
        });
// 		myChart.data.datasets[0].label = "전력 수요 모니터링(15분 데이터)";
// 		myChart.data.labels = ['10:00', '11:00', '12:00', '13:00', '14:00', '15:00', '16:00', '17:00', '18:00'];
		myChart.data.datasets[0].data = data;
		myChart.update();
		
		return;
	}
    
    
	function getCurrData() {
		// ajax
        var date = new Date();
        var year = date.getFullYear().toString();
        var month = date.getMonth()+1;
        month = month < 10 ? '0'+month.toString() : month.toString();
        var day = date.getDate();
        day = day < 10 ? '0'+day.toString() : day.toString();
        
	    var hour = date.getHours();
	    hour = hour < 10 ? '0'+hour.toString() : hour.toString();
	    var min = date.getMinutes();
	    min = min < 5 ? '00' : min < 10 ? '05' : min < 15 ? '10' : min < 20 ? '15' : min < 25 ? '20' : min < 30 ? '25' :
    	min < 35 ? '30' : min < 40 ? '35' : min < 45 ? '40' : min < 50 ? '45' : min < 55 ? '50' : min <= 59 ? '55' : '0'; 
	    
        $.ajax({
			type: "POST",
			url: "<c:url value='/dashboard/getCurrData'/>",
			dataType: "json",
			data : { searchDate: year+month+day+hour+min+'00' },
			timeout: 10000,
			async: false,
			success: function(result) {
				console.log(result);
				jQuery("#baseDatetime").text("실시간 현황 : "+result.baseDatetime);
				jQuery("#baseDatetime").text(result.baseDatetime);
				
				jQuery("#suppAbility").text("공급능력 : "+result.suppAbility+" MW");
				jQuery("#currPwrTot").text("현재수요 : "+result.currPwrTot+" MW");
				jQuery("#suppReservePwr").text("공급예비력 : "+result.suppReservePwr+" MW");
				jQuery("#suppReserveRate").text("공급예비율 : "+result.suppReserveRate+" %");
				
				
				jQuery("#forecastLoad").text("최대예측수요 : "+result.forecastLoad+" MW");
				jQuery("#operReservePwr").text("운영예비력 : "+result.operReservePwr+" MW");
				jQuery("#operReserveRate").text("운영예비율 : "+result.operReserveRate+" %");
				
   			},
			error : function(result) {
				
			}
        });
		return;
	}
	
	getLocation();
	getData();
	getCurrData();
</script>
</body>
</html>