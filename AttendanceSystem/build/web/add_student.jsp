<%-- 
    Document   : add_student
    Created on : 03-Sept-2023, 2:45:07 pm
    Author     : NATTAR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>
<% Class.forName("com.mysql.cj.jdbc.Driver");%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Add Student</title>
    <style>
        html {
            background-image: url("bg.jpg");
            background-size: cover;
            background-repeat: no-repeat;
        }

        .bo {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 90vh;
            margin: 0;
        }

        #form-container {
            background-color: rgba(255, 255, 255, 0.2);
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            padding: 20px;
            border-radius: 10px;
            text-align: center;
        }

        #st_reg_no, #st_name {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        #submit-button-container {
            display: flex;
            justify-content: center;
        }

        #submit-button {
            background-color: #007bff; /* Set your desired button color here */
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <jsp:include page="test.jsp" />
    <div class="bo">
        <div id="form-container">
            <form action="add_student.jsp" method="post">
                <h2>Add Student</h2>
                <table>
                    <tr><td><input type="text" name="st_reg_no" placeholder="Enter Register number" id="st_reg_no" required></td></tr>
                    <tr><td><input type="text" name="st_name" placeholder="Enter Student name" id="st_name" required></td></tr>
                    <tr><td colspan="2" id="submit-button-container"><input type="submit" value="Add" id="submit-button"></td></tr>
                </table>
            </form>
            <%
                if (request.getMethod().equalsIgnoreCase("POST")){  
                String m=(String) session.getAttribute("stude_add");
                String o=(String) session.getAttribute("appendname");
                String t=request.getParameter("st_reg_no");
                String y=request.getParameter("st_name");
                try
                {
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/attendancedb?zeroDateTimeBehavior=CONVERT_TO_NULL", "root", "root");
                    Statement st=con.createStatement();
                    int i=st.executeUpdate("insert into "+(o+"sc"+m)+" (Register_no,Name)values('"+t+"','"+y+"')");
                    out.println("Successfully added");
                    
                }
                catch(Exception e)
                {
                    out.println("<h4>"+e.getMessage()+"</h4>");
                }
                }
            %>
        </div>
    </div>
</body>
</html>
