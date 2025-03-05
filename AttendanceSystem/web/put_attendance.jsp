<%-- 
    Document   : put_attendance
    Created on : 03-Sept-2023, 6:43:45 pm
    Author     : NATTAR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>
<% Class.forName("com.mysql.cj.jdbc.Driver");%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Attendance</title>
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

        #dropdown {
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
    <jsp:include page="test.jsp"/>
    <div class="bo">
    <div id="form-container">
        <form method="post" action="put_attendance.jsp">
            <h2>Attendance</h2>
            <table>
                <tr>
                    <td><label for="dropdown">Choose subject to put attendance:</label></td>
                </tr>
                <tr>
                    <td>
                        <select id="dropdown" name="selectedOption_att">
                            <%
                                Connection con = null;
                                ResultSet rs = null;
                                Statement st = null;
                                try {
                                    String m=(String) session.getAttribute("tbnametoaddsub");
                                    session.setAttribute("tbnam",m);
                                    con = DriverManager.getConnection("jdbc:mysql://localhost:3307/attendancedb?zeroDateTimeBehavior=CONVERT_TO_NULL", "root", "root");
                                    st = con.createStatement();
                                    rs = st.executeQuery("Select subject from "+m);
                                    while (rs.next()) {
                                        String columnValue = rs.getString("subject");
                            %>
                                        <option value="<%= columnValue %>"><%= columnValue %></option>
                            <%
                                    }
                                } catch (Exception e) {
                                    e.printStackTrace();
                                } finally {
                                    if (rs != null) rs.close();
                                    if (st != null) st.close();
                                    if (con != null) con.close();
                                }
                            %>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td><input type="submit" value="Go" id="submit-button"></td>
                </tr>
            </table>
        </form>
        <%
            if (request.getMethod().equalsIgnoreCase("POST")){
            String t=request.getParameter("selectedOption_att");
            session.setAttribute("att_code",t);
            response.sendRedirect("attendance_page.jsp");
            }
        %>
    </div>
    </div>
</body>
</html>
