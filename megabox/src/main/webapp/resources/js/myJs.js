	function click_date(element) {
		var dates = document.getElementsByName('actual_date');
		for (i = 0; i < dates.length; i++) {
			if (dates[i].className = 'on') //하나의 버튼만
				dates[i].className = 'default';
		}
		console.log(element.value);
		element.className = 'on';
	}
	
	function send_movie_name(movie) {
		var name = movie.value; 
		console.log(name);
		var param = {"name" : name};
		param = JSON.stringify(param);
		
		var days = document.getElementsByName('actual_date');
		var clickedDay = null;
		for(i = 0; i < days.length; i++){
			if(days[i].className == 'on'){
				clickedDay = days[i].value;
				break;
			}
		}
		if(clickedDay == null || clickedDay.length == 0){
			clickedDay = new Date().toLocaleDateString().substr(0, 11);
		console.log("컨트롤러에 전달할 날짜: " + clickedDay);
		
		$.ajax({
			url: 'sendMovieName', 
			type: 'post', 
			data: param,  
			contentType: 'application/json; charset=utf-8', 
			success: function(){ 
				alert('성공');
			},
			error: function(){
				alert('실패');
			}
		});
	}
	
	function send_theater_name() {
		alert('극장 이름 전달 함수 호출됨!!!!!!');
	}

	function send_state_name() {
		alert('지역 이름 전달 함수 호출됨!!!!!!');
	}
	
	function send_time(){
		console.log('영화 상영 시간 전달 함수 호출됨!!!!!!');
	}

	function print_calendar() {
		$('#datepicker').datepicker().datepicker("show");
	}

	$(function() {
	    $("#datepicker").datepicker({ 
	        onSelect: function() { 
	            var date = $.datepicker.formatDate("yy.mm.dd",$("#datepicker").datepicker("getDate")); 
	            console.log(date);
	        }
	    });                    
	});
	}
