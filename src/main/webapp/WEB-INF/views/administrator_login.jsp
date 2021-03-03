<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="utf-8">
   <title>Capstone Group A</title>
</head>
<body>

  <!-- Title -->
  <h1>Administrator Login</h1>

  <!-- Input -->
  <form>
    Username: <input type="text" id="username" name="username"><br>
    Password: <input type="text" id="password" name="password"><br>
    <input type="button" onclick="login()" value="login">
  </form>

  <!-- Button -->
  <p>Don't have an account? <a href="javascript:buttonJump('http://localhost:8080/page/admin/signup');">Sign Up!</a></p>
  <button type="button" onclick="buttonJump('http://localhost:8080/page/homepage')">Back</button>

</body>
<script type="text/javascript">

    function login() {
      const username = document.getElementById("username").value;
      const password = document.getElementById("password").value;
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

    function buttonJump(destination){
        window.location.href=destination;
    }

    function saveAdminToken(variable) {
      localStorage.setItem("adminToken", variable);
    }
</script>
</html>
