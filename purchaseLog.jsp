<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.io.FileNotFoundException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>

<% request.setCharacterEncoding("UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
	<%
	String id = session.getAttribute("Id").toString();
	BufferedReader reader = null;
	String directory = application.getRealPath("/Users");	
	
	/* [구현1] JSONArray 및 JSONObject 선언 */
	JSONArray returnData = new JSONArray();
	JSONObject json = null;
	
	PrintWriter pw = response.getWriter();
	try{
		reader = new BufferedReader(new FileReader(directory+"/"+id+"_구매기록.txt"));
		ArrayList<String> list = new ArrayList<String>();
		int i = 1;
		String log;
		while(reader.ready()){
			log = reader.readLine();
			list.add(log);
			i++;
		}
		
		for(String str : list){
			StringTokenizer values = new StringTokenizer(str, "|");
			while(values.hasMoreElements()){
				json = new JSONObject();
				json.put("number", values.nextToken());
				json.put("product", values.nextToken());
				json.put("price", values.nextToken());
				json.put("date", values.nextToken());
				json.put("state", values.nextToken());
			}
			returnData.add(json);
		}
		pw.print(returnData);
		pw.flush();
		pw.close();
 	} catch( Exception e ){
 		e.printStackTrace();
 	} finally{
 		try{
 			if( reader != null ) reader.close();
 		}catch( Exception e1 ){
 			e1.printStackTrace();
 		}
 	}
		
%>

</body>
</html>