<%@page contentType="text/html; charset=UTF-8"%>
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
		<div class="term">
			<h3>이용 약관</h3>
			<p>입력창에 사용하실 ID와 PW를 입력해주세요.</p>
		</div>
		<section class="regist">
			<form action="regUser.jsp" method="POST" id="register">
				<table align="center">
					<tr><td>ID : </td><td><input type="text" name="id" required/></tr>
					<tr><td>PW : </td><td><input type="password" name="pw" required/></tr>
				</table>
				<input type="submit" value="가입"/>
			</form>
			<%
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter p = response.getWriter();
				if(result != null){
					p.println("<script type=\"text/javascript\">");
					if(result.equals("TRUE"))
						p.println("alert('회원가입 완료')");
					else
						p.println("alert('존재하는 아이디')");
					p.println("location='index.jsp';");
					p.println("</script>");
				}
			%>
		</section>
	</body>
</html>