<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.io.*"%>
<% String result=request.getParameter("RESULT");%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<link href="stylesheet/log.css" rel="stylesheet" type="text/css"/>
		<script type="text/javascript" src="script/jquery.js"></script>
		<script type="text/javascript" src="script/log.js"></script>
	</head>
	<form id="cancelForm" action="cancel.jsp" method="POST">
		<input type="hidden" name="index"/>
		<input type="hidden" name="date"/>
	</form>
	<body id="body" onload="alertlog()">
		<%
			if(session.getAttribute("Id") == null){
				response.sendRedirect("index.jsp");
			}
		%>

		<section class="header">
			<h1>온라인 상점 시스템</h1>
		</section>
		<section class="log">
			<table id = "logInfo" align="center">
				<thead>
					<tr>
						<th>No.</th>
						<th>물품명</th>
						<th>가격</th>
						<th>날짜</th>
						<th>상태</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
		</section>
		<section class="userInfo">
			<div>
				<p>정보</p>
				<%
					out.write("<p>아이디 : " + session.getAttribute("Id") + "</p>");
					out.write("<p>포인트 : " + session.getAttribute("Point") + "</p>");
				%>
				<input type="button" value="상점으로 돌아가기" onclick="moveMain()"/><input type="button" value="로그아웃" onclick="logout()"/>
			</div><BR>
		</section>
		<section class="footer">
			<p>Copyright 2016 by CNU 201402441 Se-mok, Choi</p>		
		</section>
	</body>
</html>