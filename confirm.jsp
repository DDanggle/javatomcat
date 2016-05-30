<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.io.*"%>

<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	int point = 0;
	BufferedReader reader = null;
	String chkpw = "";
	boolean isConfirm = false;
	
	if(session.getAttribute("Id") !=null){
		String fPath = application.getRealPath("/Users");
		PrintWriter writer = new PrintWriter(fPath + "/" + session.getAttribute("Id") + ".txt", "UTF-8");
		
		writer.println(session.getAttribute("Pw").toString());
		writer.println(session.getAttribute("Point").toString());
		writer.close();

		session.invalidate();
		response.sendRedirect("index.jsp");
	}else{
		String fPath = application.getRealPath("/Users");
		File directory = new File(fPath);
		
		File[] files = directory.listFiles();
		
		if(files != null){
			for(File file : files){
				if(file.getName().equals(id+".txt")){
					String tmpFileName = file.getName();
					reader = new BufferedReader(new FileReader(fPath + "/" + tmpFileName));
					chkpw = reader.readLine();
					point = Integer.parseInt(reader.readLine());
					
					if(chkpw.equals(pw)){
						isConfirm = true;
						break;
					}
				}
			}
			if(reader != null) reader.close();
		}
		if(isConfirm){
			session.setAttribute("Id", id);
			session.setAttribute("Pw", pw);
			session.setAttribute("Point", point);
			response.sendRedirect("main.jsp");
		}else
			response.sendRedirect("index.jsp?FALSE");
	}
%>