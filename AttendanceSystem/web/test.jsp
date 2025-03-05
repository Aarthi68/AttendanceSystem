<%-- 
    Document   : test
    Created on : 05-Sept-2023, 10:52:49 pm
    Author     : NATTAR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nav</title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"/>
   </head>
<body>
    <div class="fl">
  <div class="main_box">
    <input type="checkbox" id="check">
    <div class="btn_one">
      <label for="check">
        <i class="fas fa-bars"></i>
      </label>
    </div>
    <div class="sidebar_menu">
      <div class="logo">
        <a href="home.jsp">Home</a>
          </div>
        <div class="btn_two">
          <label for="check">
            <i class="fas fa-times"></i>
          </label>
        </div>
      <div class="menu">
        <ul>
          <li><i class="fas fa-qrcode"></i>
            <a href="add_subject.jsp">Add Subject</a>
          </li>
          <li>
            <i class="fas fa-link"></i>
            <a href="remove_subject.jsp">Remove Subject</a>
          </li>
          <li>
            <i class="fas fa-stream"></i>
            <a href="select_subcode_add.jsp">Add Student</a>
          </li>
          <li>
            <i class="fas fa-calendar-week"></i>
            <a href="select_subcode_rem.jsp">Remove Student</a>
          </li>
          <li>
            <i class="fas fa-question-circle"></i>
            <a href="remove_account.jsp">Remove Account</a>
          </li>
          <li>
            <i class="fas fa-sliders-h"></i>
            <a href="put_attendance.jsp">Attendance</a>
          </li>
          <li>
            <i class="fas fa-phone-volume"></i>
            <a href="logout.jsp">Logout</a>
          </li>
        </ul>
      </div>
      <div class="social_media">
        <ul>
          <a href="https://github.com/Bala1503"><i class="fab fa-github"></i></a>
          <a href="https://www.linkedin.com/in/bala-subramanian-9b6262252"><i class="fab fa-linkedin"></i></a>
          <a href="https://instagram.com/m_bala_7?igshid=ZDc4ODBmNjlmNQ=="><i class="fab fa-instagram"></i></a>
          <a href="https://twitter.com/i/flow/login?redirect_after_login=%2Flogin%3Flang%3Den"><i class="fab fa-twitter"></i></a>
        </ul>
      </div>
    </div>
  </div>
        <h2>National Engineering College</h2>
        <img src="nec.png" alt="logo" height="50px" width="50px"/>
    </div>
  </body>
</html>
