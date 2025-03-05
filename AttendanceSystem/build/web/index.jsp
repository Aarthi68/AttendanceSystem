<%-- 
    Document   : index
    Created on : 02-Sept-2023, 2:55:34 pm
    Author     : NATTAR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>
<% Class.forName("com.mysql.cj.jdbc.Driver");%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="login_style.css">
</head>
<body>
    <div class="bgimg">
        <br>
    <div class="heads">
        <h2>National Engineering College</h2>
    </div>
    <div class="fl">
    <div class="log">
    <form action="index.jsp" method="post">
        <h2>Login</h2><br><br>
            <input type="text" name="staffid_check" placeholder="Enter Staff id" required><br><br>
            <input type="password" name="password_check" placeholder="Enter Password" required><br><br>
            <div class="but"><input type="submit" value="Login" style="height: 30px; width: 100px;"></div><br><br>
        <h3>Is this your first time?&nbsp;&nbsp;&nbsp;<a href="signup.jsp">Register</a></h3>
    </form>
        <br>
        <%
            String origin=request.getParameter("email");
            if (origin!=null){
            String id=request.getParameter("staffid");
            String mail=request.getParameter("email");
            String pass=request.getParameter("password");
            
            try
            {
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/attendancedb?zeroDateTimeBehavior=CONVERT_TO_NULL", "root", "root");
                Statement st=con.createStatement();
                int i=st.executeUpdate("insert into users(staffid,email,password)values('"+id+"','"+mail+"','"+pass+"')");
                int j=st.executeUpdate("create table "+id+"(subject varchar(100) unique not null)");
                out.println("<h4>Registered Successfully</h4>");
            }
            catch(Exception e)
            {
                out.print("<h4>"+e.getMessage()+"</h4>");
            }
            }
            else if (request.getMethod().equalsIgnoreCase("POST")) {
        String id_check = request.getParameter("staffid_check");
        String pass_check = request.getParameter("password_check");
        session.setAttribute("tabletoaddsubject_name", id_check);
        int staffIdFound = 0;
        String passwords = null;

        try {
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/attendancedb?zeroDateTimeBehavior=CONVERT_TO_NULL", "root", "root");
            String checkQuery = "SELECT 1 FROM users WHERE staffid = ?";
            PreparedStatement checkStatement = con.prepareStatement(checkQuery);
            checkStatement.setString(1, id_check);
            ResultSet checkResultSet = checkStatement.executeQuery();

            if (checkResultSet.next()) {
                staffIdFound = 1;

                String passwordQuery = "SELECT password FROM users WHERE staffid = ?";
                PreparedStatement passwordStatement = con.prepareStatement(passwordQuery);
                passwordStatement.setString(1, id_check);
                ResultSet passwordResultSet = passwordStatement.executeQuery();

                if (passwordResultSet.next()) {
                    passwords = passwordResultSet.getString("password");
                }

                passwordResultSet.close();
                passwordStatement.close();
            }

            checkResultSet.close();
            checkStatement.close();
            con.close();

            if (staffIdFound == 1 && passwords != null && passwords.equals(pass_check)) {
                response.sendRedirect("home.jsp");
            } else {
                out.println("<h4>Invalid Login</h4>");
            }
        } catch (Exception e) {
            out.println("An error occurred: " + e.getMessage());
        }
    }
    %>

    </div>
</div>
</div>
</body>
</html>
