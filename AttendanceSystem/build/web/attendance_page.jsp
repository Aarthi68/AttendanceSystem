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
        background-image: url(bg.jpg);
    }
    body {
        font-family: Arial, sans-serif;
        background-color: transparent;
        border-radius: 10px;
        margin: 0;
        padding: 0;
    }
    .container {
        margin: 20px;
        border-radius: 10px;
        background-color: #fff;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        overflow: hidden;
    }
    table {
        width: 100%;
        border-collapse: collapse;
        border-radius: 10px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    th, td {
        padding: 10px;
        text-align: center;
        border-bottom: 1px solid #ccc;
    }
    th {
        background-color: #333;
        color: #fff;
    }
    tr:nth-child(even) {
        background-color: #f2f2f2;
    }
    input[type="text"], select {
        width: 100%;
        padding: 5px;
        border: 1px solid #ccc;
        border-radius: 5px;
        text-align: center;
        background-color: #f9f9f9;
    }
   
    select.present {
        background-color: #c7ffd8;
    }
    select.absent {
        background-color: #ffc7c7;
    }
    
    td:first-child input[type="text"],
    td:nth-child(2) input[type="text"] {
        background-color: #c7ffd8;
    }
    input[type="submit"] {
        background-color: #333;
        color: #fff;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        margin-top: 20px;
        display: block;
        margin: 0 auto;
    }
    input[type="submit"]:hover {
        background-color: #555;
    }
</style>

</head>
<body>
    <jsp:include page="test.jsp" />
<form action="mailprocess.jsp" method="post">
     <div class="container">
    <table>
        <tr>
            <th>Register Number</th>
            <th>Name</th>
            <th>Attendance</th>
        </tr>
        <%
            String q = (String) session.getAttribute("tbnam");
            String w = (String) session.getAttribute("att_code");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/attendancedb?zeroDateTimeBehavior=CONVERT_TO_NULL", "root", "root");
            String sql = "SELECT Register_no, Name FROM " + q + "sc" + w;
            Statement statement = con.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);
            ArrayList<String[]> dataMatrix = new ArrayList<>();

            while (resultSet.next()) {
                String registerNo = String.valueOf(resultSet.getInt("Register_no"));
                String name = resultSet.getString("Name");
                String m = request.getParameter("attendanceStatus_" + registerNo); // Get the updated status

        %>
        <tr>
            <td><input type="text" name="regno" value="<%= registerNo %>" readonly></td>
        <td><input type="text" name="namee" value="<%= name %>" readonly></td>
            <td>
                <select class="present" id="attendanceStatus" name="attendanceStatus_<%= registerNo %>">
                    <option value="present" <%= "present".equals(m) ? "selected" : "" %>>Present</option>
                    <option value="absent" <%= "absent".equals(m) ? "selected" : "" %>>Absent</option>
                </select>
            </td>
        </tr>
        <%
                String[] rowData = {registerNo, name, m};
                dataMatrix.add(rowData);
            }
            resultSet.close();
            statement.close();
            con.close();
            String[][] dataArray = new String[dataMatrix.size()][3];
            for (int i = 0; i < dataMatrix.size(); i++) {
                dataArray[i] = dataMatrix.get(i);
            }
            session.setAttribute("dataMatrix", dataArray);
        %>
    </table>
    </div>
    <input type="submit" value="submit">
    <br>
</form>
    
</body>
</html>
