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
		fPath = application.getRealPath("/Users/"+id+".txt");		
		try {
			PrintWriter writer = new PrintWriter(fPath, "UTF-8");
			writer.println(pw);
			writer.println(50000);
			result = "TRUE";
			writer.close();
		} catch(Exception e) {
			result = "FAIL";
		}
		fPath = application.getRealPath("/Users/"+id+"_이용내역.txt");
		try {
			PrintWriter writer1 = new PrintWriter(fPath, "UTF-8");
			result = "TRUE";
			writer1.close();
			
		} catch(Exception e) {
			result = "FAIL";
		}
	}
	
	response.sendRedirect("register.jsp?RESULT="+result);
%>