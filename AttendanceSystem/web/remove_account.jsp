<%-- 
    Document   : remove_account
    Created on : 05-Sept-2023, 7:50:52 pm
    Author     : NATTAR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>
<% Class.forName("com.mysql.cj.jdbc.Driver");%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Remove Account</title>
    <style>
        html {
            background-image: url("bg.jpg");
            background-size: cover;
            background-repeat: no-repeat;
            height: 100%;
        }

        .bo {
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 80vh;
        }

        #form-container {
            background-color: rgba(255, 255, 255, 0.2); 
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
            padding: 20px;
            border-radius: 10px;
            text-align: center;
        }

        #confirm-button {
            background-color: #ff0000; /* Set your desired button color here */
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <jsp:include page="test.jsp"/>
    <div class="bo">
    <div id="form-container">
        <form action="remove_account.jsp" method="post">
            <h2>Remove Account?</h2>
            <input type="submit" value="Confirm" id="confirm-button">
        </form>
        <%
            if(request.getMethod().equalsIgnoreCase("post")){
                Connection con=null;
                Statement st = null;
                ResultSet rs = null;
                PreparedStatement dropTableStatement = null;
                try {
                    String tableName = (String) session.getAttribute("tabletoaddsubject_name");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3307/attendancedb?zeroDateTimeBehavior=CONVERT_TO_NULL", "root", "root");
                    st = con.createStatement();
                    String droprowQuery = "DELETE FROM users WHERE staffid=?";
                    dropTableStatement = con.prepareStatement(droprowQuery);
                    dropTableStatement.setString(1, tableName);
                    dropTableStatement.executeUpdate();
                    rs = st.executeQuery("SELECT subject FROM "+tableName);
                    while (rs.next()) {
                        String columnValue = rs.getString("subject");
                        String dropTableQuery = "DROP TABLE IF EXISTS " + (tableName+"sc"+columnValue);
                        dropTableStatement = con.prepareStatement(dropTableQuery);
                        dropTableStatement.execute();
                        dropTableStatement.close();
                    }
                    String dropTableQuery = "DROP TABLE IF EXISTS " + tableName;
                    dropTableStatement = con.prepareStatement(dropTableQuery);
                    dropTableStatement.execute();
                    dropTableStatement.close();
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    if (st != null) st.close();
                    if (rs!=null) rs.close();
                    if (dropTableStatement != null) dropTableStatement.close();
                    if (con != null) con.close();
                }
                response.sendRedirect("index.jsp");
            }
        %>
    </div>
    </div>
</body>
</html>
