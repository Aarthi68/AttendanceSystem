<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Properties, javax.mail.*, javax.mail.internet.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Mail</title>
    <style>
        html {
            background-image: url("bg.jpg");
        }
        .bo {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 80vh;
            margin: 0;
            background-color: rgba(0, 0, 0, 0.1);
        }
        .success-box {
            background-color: #000;
            color: #fff;
            padding: 20px;
            border-radius: 10px;
            text-align: center;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
        }
        .success-message {
            font-size: 24px;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <jsp:include page="test.jsp"/>
    <div class="bo">
<%
    String[][] dataMatrix = (String[][]) session.getAttribute("dataMatrix");
    Properties properties = new Properties();
    properties.put("mail.smtp.host", "smtp.gmail.com");
    properties.put("mail.smtp.port", "587");
    properties.put("mail.smtp.auth", "true");
    properties.put("mail.smtp.starttls.enable", "true");
    Session sessions= Session.getInstance(properties, new Authenticator() {
        protected PasswordAuthentication getPasswordAuthentication() {
            return new PasswordAuthentication("attendancemailbot@gmail.com", "aqgwmjseviruuqwd");
        }
    });

    try {
        Message message = new MimeMessage(sessions);
        message.setFrom(new InternetAddress("attendancemailbot@gmail.com"));
        message.setRecipient(Message.RecipientType.TO, new InternetAddress("2112106@nec.edu.in"));
        String y=(String) session.getAttribute("tbnametoaddsub");
        String w = (String) session.getAttribute("att_code");
        message.setSubject("Form Submission Confirmation");

        // Email content
        StringBuilder content = new StringBuilder();
        content.append("<h3 style=\"font-family: Arial, sans-serif;\">").append(y).append(" ").append(w).append("</h3>");
        content.append("<table style=\"font-family: Arial, sans-serif; border-collapse: collapse; width: 100%; margin-top: 20px;\">");
        content.append("<tr>");
        content.append("<th style=\"border: 1px solid #dddddd; background-color: #4CAF50; color: white; text-align: left; padding: 8px;\">Register Number</th>");
        content.append("<th style=\"border: 1px solid #dddddd; background-color: #4CAF50; color: white; text-align: left; padding: 8px;\">Name</th>");
        content.append("<th style=\"border: 1px solid #dddddd; background-color: #4CAF50; color: white; text-align: left; padding: 8px;\">Attendance</th>");
        content.append("</tr>");

        for (String[] row : dataMatrix) {
            String registerNo = row[0];
            String name = row[1];
            String attendanceStatus = request.getParameter("attendanceStatus_" + registerNo);

            content.append("<tr>");
            content.append("<td style=\"border: 1px solid #dddddd; text-align: left; padding: 8px;\">").append(registerNo).append("</td>");
            content.append("<td style=\"border: 1px solid #dddddd; text-align: left; padding: 8px;\">").append(name).append("</td>");
            content.append("<td style=\"border: 1px solid #dddddd; text-align: left; padding: 8px;\">").append(attendanceStatus).append("</td>");
            content.append("</tr>");
        }

        content.append("</table>");
        message.setContent(content.toString(), "text/html");
        Transport.send(message);
       %>
<div class="success-box">
    <h1 class="success-message">Email Sent Successfully</h1>
</div>
<% 
    } catch (MessagingException e) {
        e.printStackTrace();
        out.println(e.getMessage());
    }
%>
    </div>
</body>
</html>
