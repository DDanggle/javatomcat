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
		<section class="term">
			<h3>이용 약관</h3>
			<p>CNU-CS WebProgramming 과제를 위한 사이트입니다.</p>
			<p>입력창에 사용하실 ID와 PW를 입력 후, 가입 버튼을 누르시면 가입이 완료됩니다.</p>
			<p>회원 탈퇴 기능은 제공하지 않으니, 가입 전에 유의하시기 바랍니다.</p>
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
						p.println("alert('존재하는 계정입니다.')");
					p.println("location='index.jsp';");
					p.println("</script>");
				}
			%>
		</section>
	</body>
</html>