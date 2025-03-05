<%-- 
    Document   : select_subcode_rem
    Created on : 03-Sept-2023, 3:54:24 pm
    Author     : NATTAR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>
<% Class.forName("com.mysql.cj.jdbc.Driver");%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Choose to remove</title>
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

        .container {
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

        #go-button {
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
    <div class="container">
        <form method="post" action="remove_student.jsp">
            <h2>Remove Student</h2>
            <table>
                <tr>
                    <td><label for="dropdown">Select Subject to Remove Student:</label></td>
                </tr>
                <tr>
                    <td>
                        <select id="dropdown" name="selectedOption_code_rem">
                            <%
                                Connection con = null;
                                ResultSet rs = null;
                                Statement st = null;
                                try {
                                    String m=(String) session.getAttribute("tbnametoaddsub");
                                    session.setAttribute("remname",m);
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
                    <td><input type="submit" value="GO" id="go-button"></td>
                </tr>
            </table>
        </form>
    </div>
    </div>
</body>
</html>
