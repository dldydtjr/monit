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
</head>
<body>
<%@ include file="/WEB-INF/views/import/appbar.jsp" %>

<div class="bg-light border py-md-2">
	<%@ include file="/WEB-INF/views/import/sidebars.jsp" %>
	<main class="col-md-12 ms-md-auto col-lg-10 px-md-3">
		<div class="row">
		    <div class="col bg-white border rounded-3 mx-3">
		          <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center py-2 border-bottom">
			        <h1 class="h5">일간 소비전력</h1>
			      </div>
   		          <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-2">
   		          	<div class="btn-toolbar m-2">
	  			        <div class="btn-toolbar m-2" style="width: 120px;">
				        	<label for="exampleFormControlInput1" class="main_label">오늘 최대수요 전력</label>
					        <input type="text" class="form-control" value="" id="currDt" readonly="readonly"/>
				        </div>
				        <div class="btn-toolbar m-2" style="width: 120px;">
				        	<label for="exampleFormControlInput1" class="main_label">어제 최대수요 전력</label>
					        <input type="text" class="form-control" value="" id="currVal" readonly="readonly"/>
				        </div>
				        <div class="btn-toolbar m-2" style="width: 120px;">
				        	<label for="exampleFormControlInput1" class="main_label">오늘 소비전력</label>
					        <input type="text" class="form-control" value="" id="btn1T" readonly="readonly"/>
				        </div>
				        <div class="btn-toolbar m-2" style="width: 120px;">
				        	<label for="exampleFormControlInput1" class="main_label">어제 소비전력</label>
					        <input type="text" class="form-control" value="" id="btn2T" readonly="readonly"/>
				        </div>
   		          	</div>
			      </div>
			    <div id="container" class="d-flex flex-wrap flex-md-nowrap align-items-center p-5">
			    	<canvas id="myChart"></canvas>
				</div>
		    </div>
	    </div>
   	    <div class="row" style="margin-top: 8px;">
		    <div class="col bg-white border rounded-3 mx-3">
				<div class="justify-content-between flex-wrap flex-md-nowrap align-items-center py-4">
				    <div class="btn-toolbar m-2" style="justify-content: center;">
					    <table class="table table-hover" id="testTbl">
						</table>
					    <nav aria-label="Page navigation">
					       <ul class="pagination" id="pagination"></ul>
					   </nav>
				    </div>
				</div>
		    </div>
	    </div>
	</main>

</div>
  

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="<c:url value='/resources/js/jquery.min.js'/>"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js" integrity="sha512-T/tUfKSV1bihCnd+MxKD0Hm1uBBroVYBOYSk1knyvQ9VyZJpc/ALb4P0r6ubwVPSGB2GvjeoMAJJImBG12TiaQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js" integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE" crossorigin="anonymous"></script>
<!-- jspdf -->
<script src="<c:url value='/resources/js/jspdf.debug.js'/>"></script>
<!-- SheetJS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.14.3/xlsx.full.min.js"></script>
<!--FileSaver [savaAs 함수 이용] -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/FileSaver.js/1.3.8/FileSaver.min.js"></script>
<!-- moment -->
<script src="<c:url value='/resources/js/my_moment.js'/>"></script>
<!-- excel_pdf -->
<script src="<c:url value='/resources/js/my_excel_pdf.js'/>"></script>
<!-- page -->
<script src="<c:url value='/resources/js/jquery.twbsPagination.js'/>"></script>
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
  var interval = 0;
  
// 	  const labels = [
// 		  '00:00','00:05','00:10','00:15','00:20','00:25','00:30','00:35','00:40','00:45','00:50','00:55'
// 		  ,'01:00','01:05','01:10','01:15','01:20','01:25','01:30','01:35','01:40','01:45','01:50','01:55'
// 		  ,'02:00','02:05','02:10','02:15','02:20','02:25','02:30','02:35','02:40','02:45','02:50','02:55'
// 		  ,'03:00','03:05','03:10','03:15','03:20','03:25','03:30','03:35','03:40','03:45','03:50','03:55'
// 		  ,'04:00','04:05','04:10','04:15','04:20','04:25','04:30','04:35','04:40','04:45','04:50','04:55'
// 		  ,'05:00','05:05','05:10','05:15','05:20','05:25','05:30','05:35','05:40','05:45','05:50','05:55'
// 		  ,'06:00','06:05','06:10','06:15','06:20','06:25','06:30','06:35','06:40','06:45','06:50','06:55'
// 		  ,'07:00','07:05','07:10','07:15','07:20','07:25','07:30','07:35','07:40','07:45','07:50','07:55'
// 		  ,'08:00','08:05','08:10','08:15','08:20','08:25','08:30','08:35','08:40','08:45','08:50','08:55'
// 		  ,'09:00','09:05','09:10','09:15','09:20','09:25','09:30','09:35','09:40','09:45','09:50','09:55'
// 		  ,'10:00','10:05','10:10','10:15','10:20','10:25','10:30','10:35','10:40','10:45','10:50','10:55'
// 		  ,'11:00','11:05','11:10','11:15','11:20','11:25','11:30','11:35','11:40','11:45','11:50','11:55'
// 		  ,'12:00','12:05','12:10','12:15','12:20','12:25','12:30','12:35','12:40','12:45','12:50','12:55'
// 		  ,'13:00','13:05','13:10','13:15','13:20','13:25','13:30','13:35','13:40','13:45','13:50','13:55'
// 		  ,'14:00','14:05','14:10','14:15','14:20','14:25','14:30','14:35','14:40','14:45','14:50','14:55'
// 		  ,'15:00','15:05','15:10','15:15','15:20','15:25','15:30','15:35','15:40','15:45','15:50','15:55'
// 		  ,'16:00','16:05','16:10','16:15','16:20','16:25','16:30','16:35','16:40','16:45','16:50','16:55'
// 		  ,'17:00','17:05','17:10','17:15','17:20','17:25','17:30','17:35','17:40','17:45','17:50','17:55'
// 		  ,'18:00','18:05','18:10','18:15','18:20','18:25','18:30','18:35','18:40','18:45','18:50','18:55'
// 		  ,'19:00','19:05','19:10','19:15','19:20','19:25','19:30','19:35','19:40','19:45','19:50','19:55'
// 		  ,'20:00','20:05','20:10','20:15','20:20','20:25','20:30','20:35','20:40','20:45','20:50','20:55'
// 		  ,'21:00','21:05','21:10','21:15','21:20','21:25','21:30','21:35','21:40','21:45','21:50','21:55'
// 		  ,'22:00','22:05','22:10','22:15','22:20','22:25','22:30','22:35','22:40','22:45','22:50','22:55'
// 		  ,'23:00','23:05','23:10','23:15','23:20','23:25','23:30','23:35','23:40','23:45','23:50','23:55'
// 		  ];
	
	  const labels = [//'00:00',
		  "00", "01", "02", "03", "04", "05", "06", "07", "08", "09"
			, "10", "11", "12", "13", "14", "15", "16", "17", "18", "19"
			, "20", "21", "22", "23"
			];
	
	var totPage = 0;
	
	  var data = {
	    labels: labels,
	    datasets: [
	    	{
		      label: '오늘 소비전력',
		      backgroundColor: 'rgb(0,191,255)',
		      borderColor: 'rgb(0,191,255)',
		      data: [],
		      pointRadius: 1
		    },
	    ]
	  };

	  const config = {
	    type: 'bar',
	    data: data,
	    options: {
// 	        scales: {
// 	            x: {
// 	              ticks: {
// 	                callback: function(val, index) {
// // 	                	console.log(index+"="+this.getLabelForValue(val)+"-"+index % 4);
// console.log(index % 4);
// 	                  // Hide every 2nd tick label
// 	                  return index % 4 == 3 || index == 0 ? this.getLabelForValue(val) : '';
// 	                },
// 	              }
// 	            }
// 	          }
	    }
	  };
	  
	  const myChart = new Chart(
	    document.getElementById('myChart'),
	    config
	  );

	function getData() {
     
        var data = [];
        var time = [];
        var date = [];
        $.ajax({
			type: "POST",
			url: "<c:url value='/statistics/getData'/>",
			dataType: "json",
// 			data : { searchDate: year+month+day, searchTime: hour+":"+min },
			timeout: 10000,
			async: false,
			success: function(result) {
// 				console.log(result);
				data = result.data;
				time = result.time;
				date = result.date;
				
// 				time.shift();
// 				data.shift();
			},
			error : function(result) {
				
			}
        });
        
        
// 		myChart.data.datasets[0].label = "전력 수요 모니터링(15분 데이터)";
// 		myChart.data.labels = date;


		if(data.length>0){
			myChart.data.datasets[0].data = data;
			myChart.update();
		}else{
			myChart.data.datasets[0].data = [];
			myChart.update();
		}
		
		return;
		
	}

	getData();
</script>
</body>
</html>