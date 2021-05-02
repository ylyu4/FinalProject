<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Freelancer Login</title>
    <link rel="stylesheet" type="text/css" href="../../static/css/reset.css"/>
    <link rel="stylesheet" type="text/css" href="../../static/css/global.css"/>
</head>
<body class="freelancer_login-body">
<div class="freelancer_login-div">
    <!-- Title -->
    <h1>Freelancer Login</h1>
    <!-- Input -->
    <div>
        <form action="" method="">
            <div>
                <label class="freelancer_login-form-label" for="account">Account</label>
            </div>
            <div>
                <input type="text" class="freelancer_login-form" id="freelancerLoginUsername" name="account" required>
            </div>
            <div>
                <label class="freelancer_login-form-label" for="account">Password</label>
            </div>
            <div>
                <input type="password" class="freelancer_login-form" id="freelancerLoginPassword" name="password"
                       required>
            </div>
            <div class="freelancer_login-form-submit">
                <button type="button" class="form-control-submit-button" onclick="login()">Login</button>
            </div>
        </form>
        <button type="button" name="freelancer_LoginBack" onclick="buttonJump('${pageContext.request.contextPath}/')">
            Back
        </button>
        <!-- Button -->
        <p>Don't have an account? <a href="javascript:buttonJump('${pageContext.request.contextPath}/page/freelancer/signup');">Sign
            Up!</a></p>
    </div>
</div>
</body>
<footer>
    <div class="footerSetting">
        <p>&copy;2021 Job Search System. All Rights Reserved.</p>
    </div>
</footer>


<script type="text/javascript">

  function login () {
    const username = document.getElementById("freelancerLoginUsername").value;
    const password = document.getElementById("freelancerLoginPassword").value;
    console.log(username);
    console.log(password);

    const request = new XMLHttpRequest();
    request.open('GET', '${pageContext.request.contextPath}/freelancer/login?' + 'username=' + username + '&' + 'password=' + password, true);
    request.setRequestHeader("Content-Type", "application/json; charset=UTF-8");
    request.onload = function () {
      const data = JSON.parse(this.response);
      if (data === 'fail') {
        alert("Username or password is incorrect!")
      } else {
        saveAdminToken(data);
        buttonJump('${pageContext.request.contextPath}/page/freelancer/job');
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
