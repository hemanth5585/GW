<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>

<%
try{
	String emailid = request.getParameter("email");
	String pswd = request.getParameter("pwd");
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sdp3?characterEncoding=latin1&useConfigs=maxPerformance","root","root");
	PreparedStatement st = con.prepareStatement("select * from register where emailid=? and pswd=? ");
	st.setString(1,emailid);
	st.setString(2,pswd);
	ResultSet rs = st.executeQuery();
	if(rs.next())
	{
		out.println("Login Successful");	
		String redirect = "home.html";
		response.sendRedirect(redirect);
	}
	else
	{
		out.println("Incorrect EmailID or Password");
		String redirect = "in.html";
		response.sendRedirect(redirect);
	}
}
	catch(Exception e)
	{
		out.println(e);
	}
%>
 
<jsp:forward page="in.jsp" >  
<jsp:param name="email" value=emailid/>  
</jsp:forward>    
</body>  
</html>  
	

