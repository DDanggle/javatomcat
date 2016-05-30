<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<% request.setCharacterEncoding("UTF-8");%>

<%
	int index = Integer.parseInt(request.getParameter("index"));
	String purchaseDate = request.getParameter("date");
	
	SimpleDateFormat d_format = new SimpleDateFormat("yyyyMMdd");
	Calendar today = Calendar.getInstance();
	Calendar purchased = Calendar.getInstance();
	purchased.setTime(d_format.parse(purchaseDate));
	
	long getMillisecondToday = today.getTimeInMillis();
	long getMillisecondPurchased = purchased.getTimeInMillis();
	long diff = getMillisecondToday - getMillisecondPurchased;
	if(diff < 0) diff = diff * -1;
	if(diff / (24 * 60 * 60 * 1000) > 3){
		response.sendRedirect("log.jsp?time");
		return;
	}
	else{
		String id = (String)session.getAttribute("Id");
		BufferedReader reader = null;
		String fPath = application.getRealPath("/Users");
		String product = "";
		reader = new BufferedReader(new FileReader(fPath+"/"+id+"_이용내역.txt"));
		ArrayList<String> list = new ArrayList<String>();
		int i = 1;
		String log;
		while(reader.ready()){
			log = reader.readLine();
			list.add(log);
			i++;
		}
		
		reader.close();
		
		PrintWriter writer = new PrintWriter(fPath+"/"+id+"_이용내역.txt", "UTF-8");
		for(String str : list){
			StringTokenizer values = new StringTokenizer(str, "|");
			String logIndex = values.nextToken();
			if(index == Integer.parseInt(logIndex)){
				product = values.nextToken();
				writer.print(index + "|");
				writer.print(product + "|");
				writer.print(values.nextToken() + "|");
				writer.print(values.nextToken() + "|");
				writer.print("취소");
			}
			else{
				writer.print(logIndex + "|");
				writer.print(values.nextToken() + "|");
				while(values.hasMoreElements()){
					writer.print(values.nextToken());
					if(values.hasMoreElements())
						writer.print("|");
				}
			}
			writer.print("\n");
		}
		writer.close();
		
		fPath = application.getRealPath("/Products");
		File directory = new File(fPath);
		File[] files = directory.listFiles();
		if(files != null){
			for(File file : files){
				String tempFileName = file.getName();
				reader = new BufferedReader(new FileReader(fPath + "/" + tempFileName));
				String productName = reader.readLine();
				String price = reader.readLine();
				int stock = Integer.parseInt(reader.readLine());
				String imgSrc = reader.readLine();
				reader.close();
				
				int point = Integer.parseInt(session.getAttribute("Point").toString());
				
				if(productName.equals(product)){
					writer = new PrintWriter(fPath + "/" + tempFileName, "UTF-8");
					stock += 1;
					point += Integer.parseInt(price.replaceAll(",", ""));
					session.setAttribute("Point", point);
					writer.println(productName);
					writer.println(price);
					writer.println(stock);
					writer.println(imgSrc);
					writer.close();
					break;
				}
			}
		}
		response.sendRedirect("log.jsp");
	}
%>