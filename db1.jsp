<%@ page import="java.sql.*" %> 
<%@ page import="java.util.*" %>
<%@page contentType="profile/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="profile/html; charset=UTF-8">
        <title>Login Validation</title>
    </head>
    <body>
        <%
            String u = request.getParameter("usr");
            String p = request.getParameter("pass");
            String i = request.getParameter("code");
            
            
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/foodordering","root","admin");
            
            Statement stm = con.createStatement();
            
            ResultSet rs = stm.executeQuery("SELECT * FROM new user registration");
            int a=0;
            while(rs.next())
            {
                String uname=rs.getString("facusr");
                String pass=rs.getString("passwd");
                String ad=rs.getString("Admin");
                
            if(u.equals(uname) && p.equals(pass) && ad.equals("yes"))
            {
                a = 1;
                out.println("welcome");
                RequestDispatcher rd=request.getRequestDispatcher("adminportal.html");
            rd.forward(request, response);
            }
            }
            if(a==0)
            {
                out.println("Enter valid username or password ");
                Thread.sleep(5000);
            RequestDispatcher rd=request.getRequestDispatcher("fooditem.html");
            rd.forward(request, response);
            }
        %>
    </body>
</html>