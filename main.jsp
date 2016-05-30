<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.io.*"%>
<% String result=request.getParameter("RESULT");%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<link href="stylesheet/main.css" rel="stylesheet" type="text/css"/>
		<script type="text/javascript" src="script/main.js"></script>
	</head>
	
	<body onload="alertlog()">
		<%
			if(session.getAttribute("Id") == null){
				response.sendRedirect("index.jsp");
			}%>

		<section class="header">
			<h1>온라인 상점 시스템</h1>
		</section>
		<section class="main">
			<form id="purchase" action="purchase.jsp" method="POST">
				<input type="hidden" name="product" />
			</form>
			<%
				BufferedReader reader = null;
				String filePath = application.getRealPath("/Products");
				File directory = new File(filePath);
				
				File[] files = directory.listFiles();
				
				if(files != null){
					for(File file : files){
						String tempFileName = file.getName();
						reader = new BufferedReader(new FileReader(filePath + "/" + tempFileName));
						String productName = reader.readLine();
						String price = reader.readLine();
						String stock = reader.readLine();
						String imgSrc = reader.readLine();
						
						out.write("<div id='products'>");
						out.write("<img src='" + imgSrc + "' alt='can't find img'/>");
						out.write("<p>이름 : " + productName + "</p>");
						out.write("<p>가격 : " + price + "</p>");
						out.write("<p>재고 : " + stock + "</p>");
						
						if(Integer.parseInt(stock) > 0)
							out.write("<input type='button' value='구매' onclick=\"Purchase('" + file.getName() + "')\"/>");
						else
							out.write("<p>구매 불가</p>");
						out.write("</div>");
					}
				}
			%>
		</section>

		<section class="userInfo">
			<div>
				<p>정보</p>
				<%
					if(request.getParameter("ptrValue") != "" && request.getParameter("ptrValue") != null){
					int addPoint = Integer.parseInt(request.getParameter("ptrValue"));
					int point = Integer.parseInt(session.getAttribute("Point").toString());
					
					session.setAttribute("Point", addPoint + point);
				%>
					<script>
						alert("포인트 추가 완료.");
					</script><%
					}
					out.write("<p>아이디 : " + session.getAttribute("Id") + "</p>");
					out.write("<p>포인트 : " + session.getAttribute("Point") + "</p>");
				%>
				<input type="button" value="이용내역 확인" onclick="moveLog()"/><input type="button" value="로그아웃" onclick="logout()"/>
			</div><BR>
			<div>
				<p>포인트 추가</p>
				<form id="addPoint" action="main.jsp" method="POST">
					<input type="number" name="ptrValue"/><BR>
					<input type="submit" value="포인트 추가"/>
				</form>
			</div>

		</section>
		<section class="footer">
			<p>Copyright 2016 by CNU 201402441 Se-mok, Choi</p>		
		</section>
	</body>
</html>