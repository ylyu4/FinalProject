<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="utf-8">
   <title>Employer Sign Up</title>
   <link rel="stylesheet" type="text/css" href="/static/css/reset.css" />
   <link rel="stylesheet" type="text/css" href="/static/css/global.css" />
</head>
<body class="employer_sign_up-body">
  <div class="employer_sign_up-div">
    <h1 >Employer Sign Up</h1>
    <div>
    <form action="employer_profile.jsp" method="">
      <div>
        <label class="employer_sign_up-form-label" for="account">Account</label>
        </div>
        <div>
        <input type="text" class="employer_sign_up-form" id="employerSignupUsername" name="employerAccount" required>
      </div>
      <div>
        <label class="employer_sign_up-form-label" for="password">Password</label>
      </div>
      <div>
        <input type= "text" class="employer_sign_up-form" id="employerSignupPassword" name="employerPassword" required>
      </div>
      <div class="employer_sign_up-form-submit">
        <button type="button" class="form-control-submit-button" onclick="signup()">Create Account</button>
      </div>
    </form>
    <button type="button" name="employerSignUpBack" onclick="buttonJump('http://localhost:8080/page/employer/login')">Back</button>
  </div>
  </div>
</body>

<script type="text/javascript">
  function signup(){
    const username = document.getElementById("employerSignupUsername").value;
    const password = document.getElementById("employerSignupPassword").value;

    console.log(username);
    console.log(password);

    const request = new XMLHttpRequest();
    request.open('POST', 'http://localhost:8080/employer/signup', true);
    request.setRequestHeader("Content-Type", "application/json; charset=UTF-8");
    request.onload = function () {
      const data = JSON.parse(this.response);
      console.log(data);
      if (data === "true") {
        alert("Sign up successfully!");
      } else {
        alert("The username is already registered!");
      }
    }
    request.send(JSON.stringify({
      "username": username,
      "password": password,
    }));
  }

  function buttonJump(destination){
    window.location.href=destination;
  }
</script>
</html>
