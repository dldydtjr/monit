window.onload = function() {
	var interval;
	var not_pay = true;
	
	var all_play = true;
	var current_idx = 0;

	
	// 플레이가 가능한 상태인지...
	var canplay = false;
	// 마우스를 눌렸는지 확인...
	var mouse_up = true;

	// Element
	var video = null;
	
	var startSize = (window.innerHeight < window.innerWidth) ? window.innerHeight / 7: window.innerWidth / 7;

    $("#waterMark").css({top: 10, right: 10, position:'absolute'});
    
//    $("#startBtn").css({top: (window.innerHeight - startSize) / 6, left: (window.innerWidth - startSize) / 4, position:'absolute'});
    $("#startBtn").css({top: "30%", left: "40%", position:'absolute'});
    
    $('#startBtn').attr('width', startSize);
    $('#startBtn').attr('height', startSize);
    
	$('#video').bind('contextmenu', function() { return false; });
	
    videojs("video").ready(function() {
    	video = this;

    	video.poster(tmp.tmpPoster);
    	video.play();
    	
    	video.on('click', function() {
//    		if (video.src() == '')
//    			return;
			
    		clearInterval(interval);
			control_show();
			
			interval = setInterval(control_hide, 3000);
    	});
    	
    	video.on('canplay', function() {
    		if (canplay == false) {
	    		video.play();
	    		
	    		$("#startBtn").hide();
	    		$("#play-pause").removeClass('fa fa-play fa-lg').addClass('fa fa fa-pause fa-lg');
	    		
	    		interval = setInterval(control_hide, 3000);
	    		canplay = true;
    		}
    	});
    	
    	video.on('timeupdate', function() {
    		if (mouse_up) {
    			var value = video.currentTime() / video.duration() * 100;
    			$("#seek-bar").val(value);
    		}
    		
    		if (video.ended()) {
    			if (tmp.isAD) {
    				tmp.isAD = false;
    				canplay = false;
    				
    				video.src({"type":"video/mp4", "src":tmp.tmpSource});
    				video.play();
    			} else {
    				video.pause();
    				
    				$("#startBtn").show();
    				$("#play-pause").removeClass('fa fa fa-pause fa-lg').addClass('fa fa-play fa-lg');    
    				
    				control_show();
    				
    				// 히스토리 저장...
    				if (not_pay) {
    					fn_save_view_history();
    					not_pay = false;
    				}
    			}
     		}
    	});
    	
    	$("#seek-bar").mousedown(function() {
    		mouse_up = false;
    		
			clearInterval(interval);
			interval = setInterval(control_hide, 3000);
    	}).mouseup(function() {
    		mouse_up = true;
    		
			clearInterval(interval);
			interval = setInterval(control_hide, 3000);
    	});
    	
    	$("#seek-bar").change( function() {
    		if (tmp.isAD)
    			return;
    		
    		var time = video.duration() * (this.value / 100);
    		
    		video.currentTime(time);
    	});

    	$("#play-pause").click( function() {
    		// source가 없는 경우 아무짓도 안함...
    		if (video.src() == '')
    			return;
    		
    		if (tmp.isAD)
    			return;

    		if (video.paused()) {
    			video.play();
    			
    			$("#startBtn").hide();
	    		$("#play-pause").removeClass('fa fa-play fa-lg').addClass('fa fa fa-pause fa-lg');
	    		
	    		interval = setInterval(control_hide, 3000);
    		} else {
    			video.pause();
    			
    			$("#startBtn").show();
	    		$("#play-pause").removeClass('fa fa fa-pause fa-lg').addClass('fa fa-play fa-lg');
	    		
	    		control_show();
    		}
    	});

    	$("#volume-bar").change( function() {
    		video.volume(this.value);
    	});
    	
    	$("#mute").click( function() {
    		if (!video.muted()) {
    			video.muted(true);
    			$("#mute").removeClass('fa fa-volume-up fa-lg').addClass('fa fa-volume-off fa-lg');
    		} else {
    			video.muted(false);
    			$("#mute").removeClass('fa fa-volume-off fa-lg').addClass('fa fa-volume-up fa-lg');
    		}
    	});

    	$("#startBtn").click( function() {
    		$("#startBtn").hide();

    		if (video.src() == '') {
    			if (tmp.isAD) {
    				video.src({"type":"video/mp4", "src":tmp.tmpAdUrl});
    			} else {
    				video.src({"type":"video/mp4", "src":tmp.tmpSource});
    			}
    			
    			canplay = false;    			
    		} else {
        		if (video.paused()) {
        			video.play();
        			
        			$("#startBtn").hide();
    	    		$("#play-pause").removeClass('fa fa-play fa-lg').addClass('fa fa fa-pause fa-lg');
    	    		
    	    		interval = setInterval(control_hide, 3000);
        		} else {
        			video.pause();
        			
        			$("#startBtn").show();
    	    		$("#play-pause").removeClass('fa fa fa-pause fa-lg').addClass('fa fa-play fa-lg');
    	    		
    	    		control_show();
        		}    			
    		}
    	});
    	
    });
    
	function control_hide() {
		clearInterval(interval);
		
		if (mouse_up) {
			$("#waterMark").hide();
			$("#video-controls").css('opacity', 0);
		}
	}
	
	function control_show() {
		clearInterval(interval);

		$("#waterMark").show();
		$("#video-controls").css('opacity', .9);
	}
};

