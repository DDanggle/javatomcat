<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<% request.setCharacterEncoding("UTF-8");%>
<%
	String product = request.getParameter("product");
	String id = (String)session.getAttribute("Id");
	int point = Integer.parseInt(session.getAttribute("Point").toString());
	
	String fPath = application.getRealPath("/Products");

	String productPoint = "", productName = "", productImage = "";
	int stock = 0;
	
	BufferedReader reader = new BufferedReader(new FileReader(fPath + "/" + product));
	PrintWriter writer = null;
	Calendar today = Calendar.getInstance();
	
	productName = reader.readLine();
	productPoint = reader.readLine();
	stock = Integer.parseInt(reader.readLine());
	productImage = reader.readLine();
	
	if(point - Integer.parseInt(productPoint.replaceAll(",", "")) < 0){
		response.sendRedirect("main.jsp?lack");
	}
	else if(stock < 1){
		response.sendRedirect("main.jsp?stock");
	}
	else{
		writer = new PrintWriter(fPath + "/" + product, "UTF-8");
		stock -= 1;
		point -= Integer.parseInt(productPoint.replaceAll(",", ""));
		session.setAttribute("Point", point);
		writer.println(productName);
		writer.println(productPoint);
		writer.println(stock);
		writer.println(productImage);
		reader.close();
		writer.close();

		fPath = application.getRealPath("/Users");
		writer = new PrintWriter(fPath + "/" + session.getAttribute("Id") + ".txt", "UTF-8");
		
		writer.println(session.getAttribute("Pw").toString());
		writer.println(session.getAttribute("Point").toString());
		writer.close();
		
		reader = new BufferedReader(new FileReader(fPath + "/" + session.getAttribute("Id") + "_구매기록.txt"));
		
		ArrayList<String> list = new ArrayList<String>();
		int i = 1;
		String log;
		while(reader.ready()){
			log = reader.readLine();
			list.add(log);
			i++;
		}
	
		writer = new PrintWriter(fPath + "/" + session.getAttribute("Id") + "_구매기록.txt", "UTF-8");
		for(String str : list){
			StringTokenizer values = new StringTokenizer(str, "|");
			while(values.hasMoreElements()){
				writer.print(values.nextToken());
				if(values.hasMoreElements())
					writer.print("|");
			}
			writer.print("\n");
		}
		
		String month = "";
		if(today.get(Calendar.MONTH) < 10){
			month = "0" + (today.get(Calendar.MONTH) + 1);
		}
		writer.println(i + "|" + productName + "|" + productPoint + "|" + today.get(Calendar.YEAR) + month + today.get(Calendar.DATE) + "|구매");
		
		writer.close();
		reader.close();

		response.sendRedirect("main.jsp?success");
	}
%>
