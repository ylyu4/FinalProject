<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Administrator Sign Up</title>
    <link rel="stylesheet" type="text/css" href="../../static/css/reset.css"/>
    <link rel="stylesheet" type="text/css" href="../../static/css/global.css"/>
</head>
<body class="administrator_sign_up-body">
<div class="administrator_sign_up-div">
    <h1>Administrator Sign Up</h1>
    <div>
        <form>
            <div>
                <label class="administrator_sign_up-form-label" for="account">Account</label>
            </div>
            <div>
                <input type="text" class="administrator_sign_up-form" id="adminSignupUsername" name="username" required>
            </div>
            <div>
                <label class="administrator_sign_up-form-label" for="account">Password</label>
            </div>
            <div>
                <input type="text" class="administrator_sign_up-form" id="adminSignupPassword" name="password" required>
            </div>
            <div>
                <label class="administrator_sign_up-form-label" for="secretKey">Secret Key</label>
            </div>
            <div>
                <input type="text" class="administrator_sign_up-form" id="secretKey" name="secretKey" required>
            </div>
            <div class="administrator_sign_up-form-submit">
                <button type="button" class="form-control-submit-button" onclick="signup()">Create Account</button>
            </div>
        </form>
        <!-- // -->
        <button type="button" name="administratorSignUpBack"
                onclick="buttonJump('${pageContext.request.contextPath}/page/admin/login')">Back
        </button>
    </div>
</div>
</body>


<script type="text/javascript">
  function signup () {
    const username = document.getElementById("adminSignupUsername").value;
    const password = document.getElementById("adminSignupPassword").value;
    const secretKey = document.getElementById("secretKey").value;

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
    request.open('POST', '${pageContext.request.contextPath}/admin/signup', true);
    request.setRequestHeader("Content-Type", "application/json; charset=UTF-8");
    request.onload = function () {
      const data = JSON.parse(this.response);
      console.log(data);
      if (data === "true") {
        alert("Sign up successfully!");
      } else if (data === "secretKey") {
        alert("The secret key is incorrect!");
      } else {
        alert("The username is already registered!");
      }
    }
    request.send(JSON.stringify({
      "username": username,
      "password": password,
      "secretKey": secretKey
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
