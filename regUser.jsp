<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page import="java.net.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	
	boolean isExist = false;
	PrintWriter writer = null;
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
		
		
		fPath = application.getRealPath("/Users/"+id+"_이용내역.txt");
		try {
			writer = new PrintWriter(fPath, "UTF-8");
			result = "TRUE";
		} catch(Exception e) {
			result = "FAIL";
		}
	}
	
	response.sendRedirect("register.jsp?RESULT="+result);
%>