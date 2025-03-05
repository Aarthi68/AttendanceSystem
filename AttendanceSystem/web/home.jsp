<%-- 
    Document   : home
    Created on : 02-Sept-2023, 8:40:21 pm
    Author     : NATTAR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>
<% Class.forName("com.mysql.cj.jdbc.Driver");%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <style>
            html{
                background-image: url("bg.jpg");
            }
        .bo {
            height: 100%;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            margin-top: 3rem;
            background-image: url("bg.jpg");
            background-size: cover;
            background-repeat: no-repeat;
        }

        .content {
            text-align: center;
            background-color: rgba(255, 255, 255, 0.8);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
        }

        .header {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .image-container {
            margin-bottom: 20px;
        }

        .image-container img {
            max-width: 100%;
            height: auto;
        }

        .content-text {
            font-size: 18px;
            line-height: 1.5;
        }
    </style>
    </head>
    <body>
        <jsp:include page="test.jsp"/>
        <div class="bo">
        <div class="content">
        <div class="header">Welcome to NEC Attendance Management System</div>
        <div class="image-container">
         
            <img src="nec_image.jpg" alt="NEC Image">
        </div>
        <div class="content-text">
            
            National Engineering College (NEC) is a leading institution known for its excellence in engineering education and research. Our Attendance Management System is designed to streamline attendance tracking and management for students and staff.
            <br><br>
            Explore the system's features and manage attendance efficiently.
        </div>
    </div>
        </div>
        <br>
    <center><h3>
        <%
            String s=request.getParameter("selectedOption");
            String stud=request.getParameter("st_selectedOption");
            if(s!=null){
                Connection con=null;
                PreparedStatement deleteStatement = null;
                PreparedStatement dropTableStatement = null;
                try {
                    String selectedOption = request.getParameter("selectedOption");
                    String tableName = (String) session.getAttribute("tbnametoaddsub");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3307/attendancedb?zeroDateTimeBehavior=CONVERT_TO_NULL", "root", "root");
                    String deleteQuery = "DELETE FROM " + tableName + " WHERE subject = ?";
                    deleteStatement = con.prepareStatement(deleteQuery);
                    deleteStatement.setString(1, selectedOption);
                    int rowsDeleted = deleteStatement.executeUpdate();

                    if (rowsDeleted > 0) {
                        String dropTableQuery = "DROP TABLE IF EXISTS " + (tableName+"sc"+selectedOption);
                        dropTableStatement = con.prepareStatement(dropTableQuery);
                        dropTableStatement.execute();
                        out.println("<p>Successfully removed</p>");
                    } else {
                        out.println("<p>Subject " + selectedOption + " not found or deletion failed.</p>");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    if (deleteStatement != null) deleteStatement.close();
                    if (dropTableStatement != null) dropTableStatement.close();
                    if (con != null) con.close();
                }
            }
            else if(stud!=null){
                Connection con=null;
                PreparedStatement deleteStatement = null;
                PreparedStatement dropTableStatement = null;
                try {
                    String selectedOption = request.getParameter("st_selectedOption");
                    String tableName = (String) session.getAttribute("option_to_rem");
                    String me=(String) session.getAttribute("tabletoaddsubject_name");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3307/attendancedb?zeroDateTimeBehavior=CONVERT_TO_NULL", "root", "root");
                    String deleteQuery = "DELETE FROM " + (me+"sc"+tableName) + " WHERE Register_no = ?";
                    deleteStatement = con.prepareStatement(deleteQuery);
                    deleteStatement.setString(1, selectedOption);
                    int rowsDeleted = deleteStatement.executeUpdate();

                    if (rowsDeleted > 0) {
                        out.println("<p>Successfully removed</p>");
                    } else {
                        out.println("<p>Subject " + selectedOption + " not found or deletion failed.</p>");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    if (deleteStatement != null) deleteStatement.close();
                    if (dropTableStatement != null) dropTableStatement.close();
                    if (con != null) con.close();
                }
            }
            String m=(String) session.getAttribute("tabletoaddsubject_name");
            session.setAttribute("tbnametoaddsub",m);
            String stu=(String) session.getAttribute("sub_code");
            session.setAttribute("subj_cod",stu);
        %>
        </h3>
    </center>
    </body>
</html>
