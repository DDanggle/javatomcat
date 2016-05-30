$(document).ready(function(){
	$("#register").click(function(){
		alert("회원 가입 페이지로 이동합니다.");
		location.assign("register.jsp");
	});
});

function alertlog(){
	var query = window.location.search.substring(1);
	if(query == "FALSE"){
		alert("존재하지않는 아이디이거나 비밀번호 틀림");
		location.href="main.jsp";
	}
}