<%-- 
    Document   : viewall
    Created on : 21 Jan, 2022, 1:00:04 PM
    Author     : r1303
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%@page import="java.sql.*" %>
        <%
            try{
                //1. Register the driver
                Class.forName("com.mysql.jdbc.Driver");
                
                 //2. establish connection by con object
                Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/mefgi","root","");
                
                 //3. Create the statement object which is used to execute query in database
                Statement stmt=con.createStatement();  
                
                //Dynamic Query
//                String sid = request.getParameter(“txtsid”);
//                PreparedStatement stmt = con.PrepareStatement("SELECT * FROM students WHERE sid= ?");
//                Stmt.setInt(1,sid);

                //step4 execute query  

                ResultSet rs=stmt.executeQuery("select * from student");  
                
                //display
                while(rs.next())
                {
                    out.println(rs.getString(1)+"&emsp;"+ rs.getString(2)+"&emsp;"+rs.getString(3)+"&emsp;"+rs.getString(4)+"<br>");
                }
                
//                setp5 colse connection(optional)
                con.close();
            }
            catch(Exception e){
                out.println(e);
            }
            %>
    </body>
</html>
