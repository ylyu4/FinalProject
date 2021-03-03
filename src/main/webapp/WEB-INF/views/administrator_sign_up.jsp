<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="utf-8">
   <title>Capstone Group A</title>
</head>
<body>

  <!-- Title -->
  <h1>Administrator Sign Up</h1>
  <!-- Input -->
  <form>
    Username: <input type="text" id="username" name="username"><br>
    Password: <input type="text" id="password" name="password"><br>
    Secret Key: <input type="text" id="secretKey" name="secretKey"><br>
    <input type="button" value="Create Account" onclick="signup()">
  </form>

  <!-- Button -->
  <button type="button" onclick="buttonJump('http://localhost:8080/page/admin/login')">Back</button>

</body>


<script type="text/javascript">
    function signup(){
        const username = document.getElementById("username").value;
        const password = document.getElementById("password").value;
        const secretKey = document.getElementById("secretKey").value;

        console.log(username);
        console.log(password);
        console.log(secretKey);

        const request = new XMLHttpRequest();
        request.open('POST', 'http://localhost:8080/admin/signup', true);
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

    function buttonJump(destination){
        window.location.href=destination;
    }
</script>

</html>
