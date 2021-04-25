<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Freelancer Sign Up</title>
    <link rel="stylesheet" type="text/css" href="../../static/css/reset.css"/>
    <link rel="stylesheet" type="text/css" href="../../static/css/global.css"/>
</head>
<body class="freelancer_sign_up-body">
<div class="freelancer_sign_up-div">
    <!-- Title -->
    <h1>Freelancer Sign Up</h1>
    <!-- Input -->
    <div>
        <form action="freelancer_profile.jsp" method="">
            <div>
                <label class="freelancer_sign_up-form-label" for="account">Account</label>
            </div>
            <div>
                <input type="text" class="freelancer_sign_up-form" id="freelancerSignupUsername"
                       name="freelancerAccount" required>
            </div>
            <div>
                <label class="freelancer_sign_up-form-label" for="password">Password</label>
            </div>
            <div>
                <input type="text" class="freelancer_sign_up-form" id="freelancerSignupPassword"
                       name="freelancerPassword" required>
            </div>
            <div class="freelancer_sign_up-form-submit">
                <button type="button" class="form-control-submit-button" onclick="signup()">Create Account</button>
            </div>
        </form>
        <button type="button" name="freelancerSignUpBack"
                onclick="buttonJump('http://localhost:8080/page/employer/login')">Back
        </button>
    </div>
</div>
</body>

<script type="text/javascript">
  function signup () {
    const username = document.getElementById("freelancerSignupUsername").value;
    const password = document.getElementById("freelancerSignupPassword").value;

    console.log(username);
    console.log(password);

    const request = new XMLHttpRequest();
    request.open('POST', 'http://localhost:8080/freelancer/signup', true);
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

  function buttonJump (destination) {
    window.location.href = destination;
  }
</script>
</html>
