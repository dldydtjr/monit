if (!String.trim) {
	String.prototype.trim = function() {
		return this.replace(/^\s+|\s+$/g, "");
	};
}
if (!String.ltrim) {
	String.prototype.ltrim = function() {
		return this.replace(/^\s+/, "");
	};
}
if (!String.rtrim) {
	String.prototype.rtrim = function() {
		return this.replace(/\s+$/, "");
	};
}

window.history.forward(1); // 뒤로가기 방지
//window disable backspace 8, F5 116
document.onkeydown = function(e) {
	var _event = (e) ? e : event;
	var key = _event.keyCode;
	var target = $(_event.target);

	if(target.is('input') || target.is('textArea') ){
		if(key == 116){
			_event.stopPropagation();
			_event.preventDefault();
			return false;
		}else if(key == 8 && target.attr('readonly') == 'readonly'){		
			_event.stopPropagation();
			_event.preventDefault();
			return false;
		}
	}else{
		if(key == 8 || key == 116){
			_event.stopPropagation();
			_event.preventDefault();
			return false;
		}
	}
}


/*----------------------------------------------------------------------------------------------
 * 공통 전역 변수 Setting
 *----------------------------------------------------------------------------------------------*/
var leftTimer = 0; //레프트메뉴 Interval 변수 
var _opener = opener;
var _windows = null;
if(_opener){
	_windows = _opener && _opener.parent && _opener.parent.parent && _opener.parent.parent.parent && _opener.parent.parent.parent.parent && _opener.parent.parent.parent.parent.parent;
}else{
	_windows = window && window.parent && window.parent.parent && window.parent.parent.parent && window.parent.parent.parent.parent && window.parent.parent.parent.parent.parent;
}


/**
 * @설명 : 레프트메뉴
 */
function leftMenuInit(){

	//메뉴
	$("#leftNav > li > img").hover (function(){
		var src_o = $(".over img").attr("src");
		var src = $(this).attr("src");
		if(leftTimer != 0){
			clearInterval(leftTimer);
			leftTimer = 0;
		}
		if(src_o != src){
			if(src_o != undefined){
				$(".over img").attr("src",fn_chang_img(src_o));
			}
		}
			$(this).attr("src",fn_chang_img(src,"over"));

	},function(){
		var src_o = $(".over img").attr("src");
		var src = $(this).attr("src");

		if(src_o != src){
			$(this).attr("src",fn_chang_img(src));
			if(src_o != undefined){
				leftTimer = setInterval(fnOrgOver,900);
			}
		}
		
	});

	//로고 클릭
	$(".logo").click(function(){
		var _locationUrl = "/index.jsp";
		_windows.location = _locationUrl;
		throw "stop";
	});
	
	//로그 아웃 클릭
	$(".logout").click(function(){
		var _locationUrl = "/uat/uia/actionLogout.do";
		_windows.location = _locationUrl;
		throw "stop";
	});

	//메뉴 클릭
	$("#leftNav > li").click(function(){
		var idx = $(this).index();
		$("#leftNav > li").removeClass("over");
		$("#leftNav > li").eq(idx).addClass("over");

		var	src = $(".over img").attr("src");

		$(".over img").attr("src",fn_chang_img(src,"over"));

		var url = $("#leftNav > li").eq(idx).attr("url");
		var menuNo = $("#leftNav > li").eq(idx).attr("menuNo");

		
		var urlSplit = location.href.split("/");
		    urlSplit = urlSplit[urlSplit.length-1].split(".");

		     var obj = new Object();
		    obj.chkURL = url;
		    obj.menuNo =menuNo; 
		    
		if(urlSplit[0] == "actionMain"){
			makeForm("/sym/mnu/mpm/EgovMainMenuIndex.do","selectOne", obj, "POST");
		}else{
		    parent.main_right.location.href = "/sym/mnu/mpm/EgovMainMenuRight.do?vStartP="+menuNo;
			makeForm("/sym/mnu/mpm/EgovMainMenuHead.do","mainTop", obj, "POST", "main_top");
		}
	});
}

/**
 * @설명 : 오버이미지 체인지 이미지명 ex)img_o.png - 오버상태 , img.png - 언오버상태
 */
function fn_chang_img(src, overStatus){
	var changeSrc = "";
	var  src_split = src.split("/");
	var reLocation = "";

	for(var i = 0; i < src_split.length-1; i++){
		reLocation += src_split[i]+"/";
	}

	srcFileName = src_split[src_split.length-1].split(".");
	srcFileName = srcFileName[0].split("_");
	srcFileName = srcFileName[0];

	if(overStatus == "over"){
			srcFileName = srcFileName+"_o.png"
	}else{
			srcFileName = srcFileName+".png";
	}
		  changeSrc = reLocation+srcFileName;
	return changeSrc;
}

/**
 * @설명 : 다른메뉴 오버 후  현재  메뉴 찾아가기
 */
function fnOrgOver(){
	var src_o = $(".over img").attr("src");
	$(".over img").attr("src",fn_chang_img(src_o,"over"));
	$(".over img").fadeOut(0).fadeIn(500);
	clearInterval(leftTimer);
}

/**
 * @설명 : 페이지 위치정보
 */
function fnLocation(){
	if($(".location").val() != undefined){
		
		var depth1 = $(".over",parent.frames["main_left"].document).attr("title");
		var depth2 = $(".snb_on span",parent.frames["main_top"].document).html();
		var depth3 = $(".bottom_on span",parent.frames["main_top"].document).html();
		$(".location").append("HOME");
		$(".location").append(" &gt; "+depth1);
	    if(depth3 != null ){
		    $(".location").append(" &gt; "+depth2);
	    	$(".location").append(" &gt; <b>"+depth3+"</b>");
	    }else{
	    	$(".location").append(" &gt; <b>"+depth2+"</b>");
	    }
	}
}

/**
 * @설명 :리스트 버튼 이미지 _on.gif Split
 */
function listButtonChange(idx){
	var thisSrc = $(".btn_small > span > img").eq(idx).attr("src");
	var thisSrcSplit = thisSrc.split("/");
	var thisImage = thisSrcSplit[thisSrcSplit.length-1];
	var reSrc=""
	for(var i = 0; i < thisSrcSplit.length-1; i++){
		reSrc += thisSrcSplit[i]+"/";
	}
	var thisImageSplit = thisImage.split(".");
	      thisImageSplit = thisImageSplit[0].split("_on");
	      
	 return reSrc+thisImageSplit[0];
}

/**
 * @설명 : 리스트 SORT
 */
function fnListOrdeyBy(orderByKey, orderByValue, from){
	var dfrom = document.listForm;
	if(from != undefined){
		dfrom = document.getElementById(from);
	}
	 
	if(orderByValue != ""){
		var orderByValue = orderByValue.split(",");
		var orderByKey = orderByKey.split(",");
		for(var i = 0 ; i < orderByValue.length; i++){
			var orgTargetVal = target = $(".bbsList  > thead > tr > th").eq(i).html(); 
			var target = $(".bbsList  > thead > tr > th").eq(i); 

			if(orderByValue[i] == "DESC"){
					target.append("&nbsp;<span class='up'><img src='/img/arrow_up.png'/></span>");
//				}
//			}else if(orderByValue[i] == "ASC"){  //다중 정렬 명확하지않아 비활성
//				target.append("&nbsp;<span class='down'><img src='/img/arrow_down.png'/></span>");
				dfrom.appendChild(makeInput("orderByValues", "DESC"));
			}else{
					target.append("&nbsp;<span class='down'><img src='/img/arrow_down.png'/></span>");
				dfrom.appendChild(makeInput("orderByValues", ""));
			}

				dfrom.appendChild(makeInput("orderByKeys", orderByKey[i]));
				
				if($(target).attr("class") != "sort"){
						target.html(orgTargetVal+"<span></span>");
			}
		}
	}else{
			$(".bbsList  > thead > tr > th").each(function(index,value){
				if($(this).attr("class") == "sort"){
					if($(this).attr("orderBy") == "DESC"){
						$(this).append("&nbsp;<span><img src='/img/arrow_up.png'/></span>");
						dfrom.appendChild(makeInput("orderByValues", "DESC"));
					}else{
						$(this).append("&nbsp;<span><img src='/img/arrow_down.png'/></span>");
						dfrom.appendChild(makeInput("orderByValues", ""));
					} 
				}else{
					dfrom.appendChild(makeInput("orderByValues", ""));
					
				}
					dfrom.appendChild(makeInput("orderByKeys", $(this).attr("key")));
			});
	}

	$(".bbsList  > thead > tr > .sort").click(function(){
		
		var key = $(this).attr("key");
		var idx = $(this).index();
		var thisObj = $(".bbsList  > thead > tr > th > span").eq(idx);
		if($("input[name=orderByValues]").eq(idx).val() == "DESC"){
			$("input[name=orderByValues]").val(""); //order 초기화 *다중처리 활성시 이 구문 삭제
			$("input[name=orderByValues]").eq(idx).val("ASC");
		}else{
			$("input[name=orderByValues]").val(""); //order 초기화 *다중처리 활성시 이 구문 삭제
			$("input[name=orderByValues]").eq(idx).val("DESC");
		}
		dfrom.submit();
	});
}

/*
 * _url : 요청 Url
 * _data : 요청과 함께 서버에 보내는 string 또는 object
 * _successFn (data,textStatus,jqXHR) : 요청이 성공일때 실행되는 callback 함수
 * _type : 'POST' or 'GET' 서버에 데이터를 HTTP POST 또는 HTTP GET 방식으로 통신
 * _dataType : 서버에서 내려온 data 형식. ( default : xml,json,script,text,html )
 * _async : false 동기식, true 비동기식
 * _errorFn : 요청이 실패일때 실행되는 callback 함수
*/
function fnAjax(_url, _data, _successFn, _type, _dataType, _async, _errorFn, _timeout){
	var _options = {};
	if($.type(_type) == 'string' && _type.length > 2){
		var _upperType = _type.toUpperCase();
		if(_type == 'GET' || _type == 'POST'){
			_options.type = _upperType;
		}else{
			_options.type = 'GET';
		}
	}else{
		_options.type = 'GET';
	}
	if(_options.type == 'GET'){
		if($.type(_data) == 'string'){
			_options.url = _url + '?' + _data;
		}else if($.type(_data) == 'object'){
			var _dataTemp = '';
			var key;
		    for (key in _data) {
		    	if(_dataTemp != ''){
		    		_dataTemp += '&'
		    	}
		    	_dataTemp += key + '=' + _data[key];
		    }
		    _options.url = _url + '?' + _dataTemp;
		}
	}else{
		_options.url = _url;
		if($.type(_data) == 'string'){
			_options.data = {'data':_data};
		}else if($.type(_data) == 'object'){
			_options.data = _data;
		}
	}
	if($.type(_async) == 'boolean'){
		_options.async = _async;
	}
	if($.type(_successFn) == 'function'){
		_options.success = _successFn;
	}else{
		_options.success = function(data, dataType){
			alert(data);
		};
	}
	if($.type(_errorFn) == 'function'){
		_options.error = _errorFn;
	}else{
		_options.error =  function(XMLHttpRequest, textStatus, errorThrown){
			alert('Error : ' + errorThrown);  //  Ajax가 실패한 경우 에러메시지출력
			throw 'stop';
		};
	}
	if($.type(_dataType) == 'string'){
		_options.dataType = _dataType;
	}
	if($.type(_timeout) == 'string' || $.type(_timeout) == 'number'){
		_options.timeout = _timeout;
	}
	$.ajax(_options);
}



//동적으로 input 생성
function makeInput(name, value) {
	var _input = document.createElement("input");
	_input.setAttribute("type", "hidden");
	_input.setAttribute("name", name);
	_input.setAttribute("id", name);
	_input.setAttribute("value", value);
	return _input;
}


//동적으로 form 생성
//id: form ID, obj : Object data, flag : null and false = POST, true = GET, target
function makeForm(ActionURL,id, obj, flag, target) {
	var _form = document.createElement("form");
	_form.setAttribute("method", flag && "GET" || "POST");
	_form.setAttribute("action", ActionURL);
	_form.setAttribute("id", id);
	_form.setAttribute("name", id);
	target && _form.setAttribute("target", target);
//	if(enctype != null && enctype == true){
//		_form.setAttribute("enctype", 'multipart/form-data');
//	}
	
	if (obj) {
		for ( var obj_element in obj) {
			var obj_value = obj[obj_element];
			if (obj_value) {
				_form.appendChild(makeInput(obj_element, obj_value));
			}
		}
	}
	document.body.appendChild(_form);
	_form.submit();
}


//천단위 마다 콤마(,) 찍기
function setComma(val, reval) {
	var numberStr =  String(val);	
		if(numberStr.length >= 4){
			if(undefinedNullCheck(val)){
					val = removeString(val);
					var reg = /(^[+-]?\d+)(\d{3})/;	// 정규식
					while (reg.test(val)) {
						val = val.replace(reg, '$1' + ',' + '$2');
					}
						val=val;
				return val;
			}else{
				return reval;
			}
		}else{
			return val;
		}
}

//날짜에 / 찍기
function setDate(val, reval) {
	var numberStr =  String(val);	
			if(undefinedNullCheck(val)){
					val = removeString(val);
					var reg = /([0-9]{4})([0-9]{2})([0-9]{2})/g;	// 정규식
						  val =  val.replace(reg, '$1/$2/$3');
				return val;
			}else{
				return reval;
			}
}


//문자데이터 제거
function removeString(val) {
	if(typeof val != "string")
		val = val.toString(); // 문자로 변환 
	return val.replace(/[^0-9.]/g, '');
}

function undefinedNullCheck(obj) {
	if (typeof obj == 'undefined' || obj == null || obj == '')
		return false;
	else
		return true;
}

function nvlTrim(obj, ch) {
	return $.trim(nvl(obj, ch));
}

function nvl(obj, ch) {
	var _ch = '';
	if (typeof ch != 'undefined')
		_ch = ch;
	if (typeof obj == 'undefined' || obj == null || obj == '')
		return _ch;
	else
		return obj;
}

function enableEnterKey()
{
	function onkeypress(e)
	{
        if(window.event.keyCode == 13 && window.event.srcElement.id != "searchText") // 13 : Enter
        {
            __submit();                
			window.event.returnValue = false; 
        }
        
	}

    document.onkeypress = onkeypress;
    
}

function __submit(){
	alert("sdf");
}

function fn_open_attach(formName, flag, uploaddirprop) {
	var w = 600;
	var h = 300;
	var winl = (screen.width - w) / 2;
	var wint = (screen.height - h) / 2;

	var url = "<c:url value='/utl/wed/fileAttachViewPop.do?formname="+formName+"&file_flag="+flag+"&uploaddirprop="+uploaddirprop+"'/>";
	var oPop = window.open(url, "File_Attach", "width="+w+",height="+h+",resizable=no,scrollbars=no,status=yes,menubar=no,location=no,top="+wint+",left="+winl); 
	oPop.focus();
}

function fn_open_attach_multi(formName, flag, uploaddirprop, index) {
	var w = 600;
	var h = 300;
	var winl = (screen.width - w) / 2;
	var wint = (screen.height - h) / 2;

	var url = "<c:url value='/utl/wed/fileAttachViewPop.do?formname="+formName+"&file_flag="+flag+"&uploaddirprop="+uploaddirprop+"&index="+index+"'/>";
	var oPop = window.open(url, "File_Attach", "width="+w+",height="+h+",resizable=no,scrollbars=no,status=yes,menubar=no,location=no,top="+wint+",left="+winl); 
	oPop.focus();
}

function fn_add_attach(formName, txt, val){

	var obj1 = eval("document."+formName+".files");
	var obj2 = eval("document."+formName+".filesOri");
	var obj3 = eval("document."+formName+".filesSys");

	obj1.add(new Option(txt, val));

	if(obj2.value.length > 0){
		obj2.value += "^" + txt;
	}else{
		obj2.value = txt;
	}

	if(obj3.value.length > 0){
		obj3.value += "^" + val;
	}else{
		obj3.value = val;
	}
}

function fn_add_attach_multi(formName, txt, val, index){

	var obj1 = eval("document."+formName+".files" + index);
	var obj2 = eval("document."+formName+".filesOri" + index);
	var obj3 = eval("document."+formName+".filesSys" + index);

	obj1.add(new Option(txt, val));

	if(obj2.value.length > 0){
		obj2.value += "^" + txt;
	}else{
		obj2.value = txt;
	}

	if(obj3.value.length > 0){
		obj3.value += "^" + val;
	}else{
		obj3.value = val;
	}
}

function fn_download(jobSeq, jobGubun, attachSeq) {
	location.href= "<c:url value='/utl/wed/fileDownload.do'/>?jobSeq="+jobSeq+"&jobGubun="+jobGubun+"&attachSeq="+attachSeq;
}

function fn_total_resource_search(){
	window.open("<c:url value='/itms/ea/common/popUp/TotalResourceSearchPop.do' />",'Pop_Mvmn','scrollbars=yes,width=790,height=640');
}

function fn_user_search(func){
	window.open("<c:url value='/utl/wed/popUp/userSearchPop.do'/>?func="+func,'Pop_Mvmn_US','scrollbars=yes,width=640,height=640');
}

function fn_dept_search(func){
	window.open("<c:url value='/utl/wed/popUp/deptSearchPop.do'/>?func="+func,'Pop_Mvmn_DS','scrollbars=yes,width=640,height=640');
}


