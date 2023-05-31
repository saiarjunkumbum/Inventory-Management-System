<html>
<%@ include file="header.jsp" %>
<head>
    <style>
        <%@ include file="/resources/css/login.css" %>

    </style>
</head>
<body style="padding: 0;margin: 0;box-sizing: border-box;">
<div class="center">
      <h1>Login</h1>
      <form action="login" method="get">
        <%-- <div class="txt_field">
          <input name="username" id="uname" type="text" required>
          <span></span>
          <label for="uname">Email address</label>
        </div>
        <div class="txt_field">
          <input name="password" id="pass" type="password" required>
          <span></span>
          <label for="pass" >Password</label>
        </div>
        <div class="pass">Forgot Password?</div> --%>
        <input type="submit" value="Open Application">
        <div class="signup_link">
          Not a member? <a href="#">Signup</a>
        </div>
      </form>
    </div>

</body>
</html>
