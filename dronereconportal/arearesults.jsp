<%@page import="com.dronerecon.ws.AreaGridTile"%>
<%@page import="com.dronerecon.ws.DBManager"%>
<%@page import="java.util.ArrayList"%>
<html>
	<body>
		<a href="areasearch.jsp">back to Area Search page</a>
	  <br>
	  <br>
	<%
		String areaId = request.getParameter("area-ID");
		DBManager oDBManager = new DBManager();
		oDBManager.DBLocation = System.getProperty("catalina.base") +  
		"\\webapps\\dronereconportal\\db\\" + oDBManager.DBLocation;
		ArrayList<AreaGridTile> array = new ArrayList<>();
		array = oDBManager.readAreaGridTiles(areaId);
		int xRed = array.get(0).x;
		int yRed = array.get(0).y;
		int xGreen = array.get(0).x;
		int yGreen = array.get(0).y;
		int red = array.get(0).r;
		int green = array.get(0).g;
		for(int i=0;i<array.size();i++){
			if(array.get(i).r > red){
				red = array.get(i).r;
				xRed = array.get(i).x;
				yRed = array.get(i).y;
			}
			if(array.get(i).g > green){
				green = array.get(i).g;
				xGreen = array.get(i).x;
				yGreen = array.get(i).y;
			}
		}
		
		out.println("High green is : " + green);%> <br /> <%
		out.println("x at high green = " + xGreen);%> <br /> <%
		out.println("y at high green = " + yGreen);%> <br /> <%
		out.println("High red is : " + red); %> <br /> <%
		out.println("x at high red = " + xRed);%> <br /> <%
		out.println("y at high red = " + yRed);%> <br /> 
		
	</body>
</html>