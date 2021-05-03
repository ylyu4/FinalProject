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
        <form action="" method="">
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
                onclick="buttonJump('${pageContext.request.contextPath}/page/freelancer/login')">Back
        </button>
    </div>
</div>
</body>


<script type="text/javascript">
  function signup () {
    const username = document.getElementById("freelancerSignupUsername").value;
    const password = document.getElementById("freelancerSignupPassword").value;

    if (username.length !== 6) {
      alert("The username should be 6 characters long!");
      return;
    }

    if (validateUsername(username) === false) {
      alert("The username should only contain digits and letters");
      return;
    }

    if (password.length < 10 || password.length > 20) {
      alert("The password should be 10 - 20 characters long");
      return;
    }


    const request = new XMLHttpRequest();
    request.open('POST', '${pageContext.request.contextPath}/freelancer/signup', true);
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

  function validateUsername(str) {
    const letterNumber = /^[0-9a-zA-Z]+$/;
    return !!str.match(letterNumber);
  }

</script>
</html>
