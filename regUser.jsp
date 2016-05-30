<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page import="java.net.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	boolean isExist = false;
	String fPath = application.getRealPath("/Users");
	File directory = new File(fPath);
	
	File[] files = directory.listFiles();
	
	if(files != null){
		for(File file : files){
			if(file.getName().equals(id+".txt")){
				isExist = true;
				break;
			}
		}
	}
	
	String result = null;
	if(isExist){
		result = "FAIL";
	}else{
		fPath = application.getRealPath("/Users/"+ id +".txt");
		try {
			PrintWriter writer = new PrintWriter(fPath, "UTF-8");
			writer.println(pw); // 비밀번호
			writer.println(50000); // 포인트
			result = "TRUE";
		} catch(Exception e) {
			result = "FAIL";
		}
		String temp = "_이용내역.txt";
		fPath = application.getRealPath("/Users/") + id + temp;
		try {
			PrintWriter writer = new PrintWriter(fPath, "UTF-8");
			result = "TRUE";
		} catch(Exception e) {
			result = "FAIL";
		}
	}
	
	response.sendRedirect("register.jsp?result="+result);
%>