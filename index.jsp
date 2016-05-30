<%@page contentType="text/html; charset=UTF-8"%>
<% String result=request.getParameter("RESULT");%>
<%@page import="java.io.*"%>

<!DOCTYPE_HTML>
<html>
	<head>
		<meta charset="utf-8">
		<link href="stylesheet.css" rel="./stylesheet/index.css" type="text/css"></link>
		<script type="text/javascript" src="./script/jquery.js"></script>
		<script type="text/javascript" src="./script/index.js"></script>
	</head>
	<body onload="alertlog()">
		<%
			if(session.getAttribute("Id") !=null){
				response.sendRedirect("main.jsp");
			}
		%>
		<form action="confirm.jsp" id="login" method="post">
			<table>
			<tr><td>ID : </td><td><input type="text" name="id" required/></td></tr>
			<tr><td>PW : </td><td><input type="text" name="pw" required/></td></tr>
			</table>
			<input type="submit" value="로그인"/>
			<input type="button" id="register" value="회원 가입"/>
		</form>
	</body>
</html>