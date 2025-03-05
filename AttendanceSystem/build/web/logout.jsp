<%-- 
    Document   : logout
    Created on : 25-Feb-2024, 8:20:51 pm
    Author     : NATTAR M
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            HttpSession httpsession = request.getSession();
            httpsession.invalidate();
            response.sendRedirect("index.jsp");
        %>
    </body>
</html>
