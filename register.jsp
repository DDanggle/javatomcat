﻿<%@page contentType="text/html; charset=UTF-8"%>
<%String result=request.getParameter("RESULT");%>
<%@page import="java.io.*"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<link href="./stylesheet/register.css" rel="stylesheet" type="text/css"></link>
		<script type="text/javascript" src="./script/register.js"></script>
	</head>
	
	<body>
		<section class="term">
			<h3>이용 약관</h3>
			<p>웹프로그래밍 3차 숙제</p>
			<p>아이디와 비밀번호를 인풋 값에 넣어주세요.</p>
		</section>
		<section class="regist">
			<form action="regUser.jsp" method="POST" id="register">
				<table align="center">
					<tr><td>ID : </td><td><input type="text" name="id" required/></tr>
					<tr><td>PW : </td><td><input type="text" name="pw" required/></tr>
				</table>
				<input type="submit" value="가입"/>
			</form>
			<%
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter p = response.getWriter();
				if(result != null){
					p.println("<script type=\"text/javascript\">");
					if(result.equals("TRUE"))
						p.println("alert('회원 가입이 완료되었습니다.')");
					else
						p.println("alert('존재하지 않는 아이디')");
					p.println("location='index.jsp';");
					p.println("</script>");
				}
			%>
		</section>
	</body>
</html>