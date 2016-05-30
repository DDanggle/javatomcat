$(document).ready(function(){
	$("#register").click(function(){
		alert("회원 가입 페이지로 이동합니다.");
		location.assign("register.jsp");
	});
});

function alertlog(){
	var query = window.location.search.substring(1);
	if(query == "FALSE"){
		alert("비밀번호가 일치하지 않거나 존재하지 않는 아이디입니다.");
		location.href="main.jsp";
	}
}