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
		<div class="row">
		    <div class="col bg-white border rounded-3 mx-3">
		          <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center py-2 border-bottom">
			        <h1 class="h5" id="titleOpt">전력 수요 이력 - 현대백화점 목동점</h1>
			        <div class="btn-toolbar mb-2 mb-md-0">
			          <div class="btn-group me-2">
			            <button type="button" class="btn btn-sm btn-outline-secondary" onclick="javascript:excelFileExport('전력 수요량', 'excelTbl');">Excel</button>
			          </div>
			        </div>
			      </div>
   		          <div class="d-flex flex-wrap flex-md-nowrap align-items-center pb-2">
   			        <div class="btn-toolbar m-2 ">
			        	<label for="exampleFormControlInput1" class="main_label">설비</label>
						<select class="form-select" aria-label="Default select example" id="targetOpt">
						  <option selected>전력 수요</option>
						</select>
			        </div>
   			        <div class="btn-toolbar m-2 ">
			        	<label for="exampleFormControlInput1" class="main_label">조회조건</label>
						<select class="form-select" aria-label="Default select example" id="searchOpt">
						  <option value="5" selected>5분 데이터</option>
						  <option value="15" selected>15분 데이터</option>
<!-- 						  <option value="hour">시간 데이터</option> -->
						  <option value="hour">일 데이터</option>
						  <option value="day">월 데이터</option>
						</select>
			        </div>
			        <div class="btn-toolbar m-2 ">
			        	<label for="exampleFormControlInput1" class="main_label">From</label>
				        <input type="text" class="form-control datePicker" value="" id="stDate"/>
			        </div>
			        <div class="btn-toolbar m-2 ">
			        	<label for="exampleFormControlInput1" class="main_label">To</label>
				        <input type="text" class="form-control datePicker" value="" id="edDate"/>
			        </div>
			          <div class="btn-toolbar m-2" style="padding-top: 18px; min-width: 60px;">
			            <button type="button" class="btn btn-outline-primary" style="min-width: 32px;" onclick="javascript:getData();">조회</button>
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
	    <div style="display: none;">
	    <table id="excelTbl" style="border:1px solid #dddddd">
		</table>
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
<script src="<c:url value='/resources/js/xlsx.bundle.js'/>"></script>
<script src="<c:url value='/resources/js/my_excel_pdf.js'/>"></script>
<!-- page -->
<script src="<c:url value='/resources/js/jquery.twbsPagination.js'/>"></script>
<script>

jQuery('.datePicker')
	.datepicker({
		format: 'yyyy-mm-dd', //데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 ) 
// 		startDate: '-10d', //달력에서 선택 할 수 있는 가장 빠른 날짜. 이전으로는 선택 불가능 ( d : 일 m : 달 y : 년 w : 주) 
// 		endDate: '+10d', //달력에서 선택 할 수 있는 가장 느린 날짜. 이후로 선택 불가 ( d : 일 m : 달 y : 년 w : 주) 
		autoclose: true, //사용자가 날짜를 클릭하면 자동 캘린더가 닫히는 옵션 
		calendarWeeks: false, //캘린더 옆에 몇 주차인지 보여주는 옵션 기본값 false 보여주려면 true 
		clearBtn: false, //날짜 선택한 값 초기화 해주는 버튼 보여주는 옵션 기본값 false 보여주려면 true 
// 		datesDisabled: ['2019-06-24', '2019-06-26'], //선택 불가능한 일 설정 하는 배열 위에 있는 format 과 형식이 같아야함. 
//		daysOfWeekDisabled: [0, 6], //선택 불가능한 요일 설정 0 : 일요일 ~ 6 : 토요일 
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
  
	  const labels = [];
	
	var totPage = 0;
	
	  var data = {
	    labels: labels,
	    datasets: [
	    	{
		      label: '전력 수요 모니터링',
		      backgroundColor: 'rgb(255, 99, 132)',
		      borderColor: 'rgb(255, 99, 132)',
		      data: [],
		      pointRadius: 1
		    },
	    ]
	  };

	  const config = {
	    type: 'line',
	    data: data,
	    options: {
// 	        scales: {
// 	            x: {
// 	              ticks: {
// 	                // For a category axis, the val is the index so the lookup via getLabelForValue is needed
// 	                callback: function(val, index) {
// // 	                	console.log(index+"="+this.getLabelForValue(val)+"-"+index % 4);
// 	                  // Hide every 2nd tick label
// 	                  return index % 12 == 0 ? this.getLabelForValue(val) : '';
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
		
		// ajax
		var searchOpt = jQuery("#searchOpt").val();
		var stDate = jQuery("#stDate").val();
		var edDate = jQuery("#edDate").val();
// 		alert(searchOpt);
        var data = [];
        var date = [];
        $.ajax({
			type: "POST",
			url: "<c:url value='/monitoring/getData_hist'/>",
			dataType: "json",
			data : { stDate: stDate, edDate: edDate, searchOpt: searchOpt },
			timeout: 10000,
			async: false,
			success: function(result) {
// 				console.log(result);
				data = result.data;
				date = result.date;
			},
			error : function(result) {
				
			}
        });
// 		myChart.data.datasets[0].label = "전력 수요 모니터링(15분 데이터)";
// 		myChart.data.labels = ['10:00', '11:00', '12:00', '13:00', '14:00', '15:00', '16:00', '17:00', '18:00'];
		if(data.length>0){
			initTable(data, date);
			myChart.data.labels = date;
			myChart.data.datasets[0].label = "전력 수요 데이터";
			myChart.data.datasets[0].data = data;
			myChart.update();
		}else{
			myChart.data.labels = [];
			myChart.data.datasets[0].data = [];
			myChart.update();
			$('#pagination').twbsPagination('destroy');
			jQuery("#getData").empty();
			jQuery("#excelData").empty();
		}
		
		return;
		
	}

    function initTable(data, date) {
    	totPage = data.length/30;
    	totPage += data.length%30 == 0 ? 0 : 1;
    	$('#pagination').twbsPagination('destroy');
		$('#pagination').twbsPagination({
			totalPages: totPage,
			visiblePages: 10,
			onPageClick: function (event, page) {
				paging(data, date, page);
				console.info(page + ' (from options)');
			}
		}).on('page', function (event, page) {
			console.info(page + ' (from event listening)');
		});
       
		jQuery("#excelTbl").empty();
    	jQuery("#excelTbl").append(
    			"<thead>"
    			+"<tr class='table-secondary' >"
    				+"<th scope='col' class='text-center' ></th>"
    				+"<th scope='col' class='text-center' ></th>"
    			+"</tr>"
    			+"<tr class='table-secondary' >"
    				+"<th scope='col' class='text-center' colspan='2'>"+$("#titleOpt").text()+"</th>"
    			+"</tr>"
    			+"<tr class='table-secondary' >"
    				+"<th scope='col' class='text-center' ></th>"
    				+"<th scope='col' class='text-center' ></th>"
    			+"</tr>"
    			+"<tr class='table-secondary' >"
    				+"<th scope='col' class='text-center' colspan='2'>"+$("#stDate").val()+" ~ "+$("#edDate").val()+"("+$("#searchOpt option:checked").text()+")"+"</th>"
    			+"</tr>"
    			+"</thead>"
    			+"<thead>"
    			+"<tr class='table-secondary' >"
    				+"<th scope='col' class='text-center'>시간</th>"
    				+"<th scope='col' class='text-center'>전력 수요 데이터</th>"
    			+"</tr>"
    			+"</thead>"
    			+"<tbody id='excelData'>"
    			+"</tbody>"    			
    			);
   		jQuery("#excelData").empty();
    	for(var i=0;i<date.length;i++){
    		jQuery("#excelData").append(
    				"<tr>"
					    +"<td class='text-center'>'"+date[i]+"</td>"
					    +"<td class='text-center'>"+data[i]+"</td>"
    				+"</tr>"
    				);
    	}
		
    }
    
    function paging(data, date, page) {
    	jQuery("#testTbl").empty();
    	
    	var ed = page*30;
    	var st = ed-30;
//     	console.log(st+"-"+ed);
//     	console.log(date);
    	const data1 = data.slice(st,ed);
    	const data2 = date.slice(st,ed);
    	
    	jQuery("#testTbl").append(
    			"<thead>"
    			+"<tr class='table-secondary'>"
    				+"<th scope='col' class='text-center'>시간</th>"
    				+"<th scope='col' class='text-center'>전력 수요 데이터</th>"
    			+"</tr>"
    			+"</thead>"
    			+"<tbody id='getData'>"
    			+"</tbody>"    			
    			);
   		jQuery("#getData").empty();
   		st += 1;
    	for(var i=0;i<data1.length;i++){
    		jQuery("#getData").append(
    				"<tr>"
					    +"<td class='text-center'>"+data2[i]+"</td>"
					    +"<td class='text-center'>"+data1[i]+"</td>"
    				+"</tr>"
    				);
    		st += 1;
    	}
    }
	var nowDate = new Date(+new Date() + 3240 * 10000).toISOString().split("T")[0];
    jQuery("#stDate").val(nowDate);
    jQuery("#edDate").val(nowDate);
    getData();
</script>
</body>
</html>