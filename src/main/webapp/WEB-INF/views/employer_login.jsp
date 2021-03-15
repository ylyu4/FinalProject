<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="utf-8">
   <title>Employer Login</title>
   <link rel="stylesheet" type="text/css" href="../../static/css/reset.css" />
   <link rel="stylesheet" type="text/css" href="../../static/css/global.css" />
</head>
<body class="employer_login-body">
  <div class="employer_login-div">
    <!-- Title -->
    <h1 >Employer Login</h1>
    <!-- Input -->
    <div>
    <form>
      <div>
        <label class="employer_login-form-label" for="account">Account</label>
        </div>
        <div>
        <input type="text" class="employer_login-form" id="employerLoginUsername" name="account" required>
      </div>
      <div>
        <label class="employer_login-form-label" for="account">Password</label>
      </div>
      <div>
        <input type= "text" class="employer_login-form" id="employerLoginPassword" name="password" required>
      </div>
      <div class="employer_login-form-submit">
        <button type="button" class="form-control-submit-button" onclick="login()">Login</button>
      </div>
    </form>
    <button type="button" name="employer_LoginBack" onclick="buttonJump('http://localhost:8080/page/homepage')">Back</button>
    <!-- Button -->
      <p>Don't have an account? <a href="javascript:buttonJump('http://localhost:8080/page/employer/signup');">Sign Up!</a></p>
  </div>
  </div>
</body>

<script type="text/javascript">

  function login() {
    const username = document.getElementById("employerLoginUsername").value;
    const password = document.getElementById("employerLoginPassword").value;
    console.log(username);
    console.log(password);

    const request = new XMLHttpRequest();
    request.open('GET', 'http://localhost:8080/employer/login?' + 'username=' + username + '&' + 'password=' + password, true);
    request.setRequestHeader("Content-Type", "application/json; charset=UTF-8");
    request.onload = function () {
      const data = JSON.parse(this.response);
      if (data === 'fail') {
        alert("Username or password is incorrect!")
      } else {
        saveAdminToken(data);
        buttonJump('http://localhost:8080/page/employer/profile');
      }
    }
    request.send(null);
  }

  function buttonJump(destination){
    window.location.href=destination;
  }

  function saveAdminToken(variable) {
    localStorage.setItem("token", variable);
  }
</script>
</html>
