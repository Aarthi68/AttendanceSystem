<%-- 
    Document   : add_subject
    Created on : 03-Sept-2023, 10:55:12 am
    Author     : NATTAR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>
<% Class.forName("com.mysql.cj.jdbc.Driver");%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Add Subject</title>
    <style>
        html{
            background-image: url("bg.jpg");
        }
        .bo {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 80vh;
            margin: 0;
        }

        #form-container {
            background-color: rgba(255, 255, 255, 0.2); 
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            padding: 20px;
            border-radius: 10px;
            text-align: center;
        }

        #code {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        #submit-button {
            background-color: #007bff;
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
        <form action="add_subject.jsp" method="post" onsubmit="return validateInput();">
            <h2>Add Subject</h2>
            <input type="text" name="subcode" placeholder="Enter Subject code" id="code" required>
            <br>
            <input type="submit" value="Add" id="submit-button">
        </form>
        <%
            if (request.getMethod().equalsIgnoreCase("POST")){
                String h=request.getParameter("subcode");
                session.setAttribute("sub_code",h);
                String m=(String) session.getAttribute("tbnametoaddsub");
                try
                {
                    String t=request.getParameter("subcode");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/attendancedb?zeroDateTimeBehavior=CONVERT_TO_NULL", "root", "root");
                    Statement st=con.createStatement();
                    int i=st.executeUpdate("insert into "+m+" (subject)values('"+t+"')");
                    int j=st.executeUpdate("create table "+(m+"SC"+t)+"(Register_no varchar(20) primary key not null, Name varchar(50) not null)");
                    out.println("<h4>Sucessfully added</h4>");
                }
                catch(Exception e)
                {
                    out.print("<h4>"+e.getMessage()+"</h4>");
                }
            }
        %>
    </div>
    </div>
</body>
</html>
