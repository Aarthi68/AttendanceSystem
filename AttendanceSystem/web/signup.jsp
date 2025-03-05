<%-- 
    Document   : signup
    Created on : 02-Sept-2023, 2:57:09 pm
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
    <title>Signup</title>
    <link rel="stylesheet" href="signup_style.css">
    <script>
        function validateInput() {
            var sta_id = document.getElementById("sta_id");
            var inputValue = sta_id.value.trim();
            var pattern = /^[A-Za-z_][A-Za-z0-9_]*$/;
            if (pattern.test(inputValue)) {
                return true;
            } else {
                alert("Please enter a valid Staff id starting with alphabets and containing no special characters if you want use underscore instead.");
                sta_id.focus();
                return false;
            }
        }
    </script>
</head>
<body>
    <div class="bgimg">
        <br>
    <div class="heads">
        <h2>National Engineering College</h2>
    </div>
    <div class="fl">
    <div class="log">
    <form action="index.jsp" method="post" onsubmit="return validateInput()">
        <h2>Sign Up</h2><br><br>
            <input type="text" name="staffid" placeholder="Enter Staff id" id="sta_id" required><br><br>
            <input type="email" name="email" placeholder="Enter email" required><br><br>
            <input type="password" name="password" placeholder="Create Password" required><br><br>
            
            <div class="but"><input type="submit" value="Register" style="height: 30px; width: 100px;"></div><br><br>
    </form>
    </div>
</div>
</div>
</body>
</html>
