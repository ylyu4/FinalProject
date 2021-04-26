<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Administrator Login</title>
    <link rel="stylesheet" href="../../static/css/reset.css"/>
    <link rel="stylesheet" href="../../static/css/global.css"/>
    <script type="text/javascript" src="../../static/js/functions.js"></script>
</head>
<body class="administrator_login-body">
<div class="administrator_login-div">
    <h1>Administrator Login</h1>
    <div>
        <form action="administrator_profile.jsp" method="">
            <div>
                <label class="administrator_login-form-label" for="account">Account</label>
            </div>
            <div>
                <input type="text" class="administrator_login-form" id="adminLoginUsername" name="username" required>
            </div>
            <div>
                <label class="administrator_login-form-label" for="account">Password</label>
            </div>
            <div>
                <input type="password" class="administrator_login-form" id="adminLoginPassword" name="password"
                       required>
            </div>
            <div class="administrator_login-form-submit">
                <button type="button" class="form-control-submit-button" value="login" onclick="login()">Login</button>
            </div>
        </form>
        <button type="button" onclick="buttonJump('http://localhost:8080/page/homepage')">Back</button>
        <p>Don't have an account? <a href="javascript:buttonJump('http://localhost:8080/page/admin/signup');">Sign
            Up!</a></p>
    </div>
</div>
<footer>
    <div class="footerSetting">
        <p>&copy;2021 Job Search System. All Rights Reserved.</p>
    </div>
</footer>
</body>

<script type="text/javascript">

  function login () {
    const username = document.getElementById("adminLoginUsername").value;
    const password = document.getElementById("adminLoginPassword").value;
    console.log(username);
    console.log(password);

    const request = new XMLHttpRequest();
    request.open('GET', 'http://localhost:8080/admin/login?' + 'username=' + username + '&' + 'password=' + password, true);
    request.setRequestHeader("Content-Type", "application/json; charset=UTF-8");
    request.onload = function () {
      const data = JSON.parse(this.response);
      if (data === 'fail') {
        alert("Username or password is incorrect!")
      } else {
        saveAdminToken(data);
        buttonJump('http://localhost:8080/page/admin/profile');
      }
    }
    request.send(null);
  }

  function buttonJump (destination) {
    window.location.href = destination;
  }

  function saveAdminToken (variable) {
    localStorage.setItem("token", variable);
  }
</script>
</html>
