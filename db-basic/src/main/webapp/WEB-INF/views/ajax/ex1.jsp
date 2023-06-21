<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex1</title>
<script>
	window.onload=start;
	function start(){
		/* alert('onload start'); */
		var link = document.getElementById('link');
		link.onclick=send;
	}
	var req;
	function send(){
		req = new XMLHttpRequest();
		req.onreadystatechange = textChange;
		req.open('post', 'ex1');
		req.send(null);
	}
	function textChange(){
		if(req.readyState == 4 && req.status == 200){
			var data = document.getElementById('data');
			data.innerHTML = req.responseText;
		}
	}
</script></head>
<body>
	<div id="data"> AJAX == 비동기 통신</div>
	<a href="#" id="link">데이터 가져오기</a>
</body>
</html>