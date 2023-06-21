<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ex4</title>
<script>
	window.onload=start;
	function start(){
		var button = document.getElementById('button');
		button.onclick=send;
	}
	var req;
	function send(){ 
		req = new XMLHttpRequest();
		req.onreadystatechange = textChange;
		req.open('post', 'ex4');
		var i = document.getElementById('id').value;
		var p = document.getElementById('pw').value;
		var n = document.getElementById('name').value;
		var data = {id:i, pw:p, name:n};
		data = JSON.stringify(data); // JSON 데이터를 String 자료형으로 변환
		req.setRequestHeader('Content-Type', 'application/json; charset=UTF-8');
		req.send(data); 
	}
	function textChange(){
		if(req.readyState == 4 && req.status == 200){
			var msg = document.getElementById('msg');
			msg.innerHTML = req.responseText;
		}
	}
</script></head>
<body>
 	<label id="msg"></label><br>
	아이디 : <input type="text" id="id"><br>
	비밀번호 : <input type="password" id="pw"><br>
	이름 : <input type="text" id="name"><br>
	<button id="button" type="button">로그인</button>
</body>
</html>