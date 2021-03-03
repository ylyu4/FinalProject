<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="utf-8">
   <title>Capstone Group A</title>
</head>
<body>
  <!-- Title -->
  <h1 class="main">Job Search System</h1>
  <!-- Buttons -->
  <div class="main-Button">
    <button type="button" name="forEmployer" onclick="buttonJump('employer_login.jsp')">For Employer</button>
    <button type="button" name="forFreelancer" onclick="buttonJump('freelancer_login.jsp')">For Freelancer</button>
    <button type="button" name="forAdministrator" onclick="buttonJump('http://localhost:8080/page/admin/login')">For Administrator</button>
  </div>
</body>

<script type="text/javascript">
    function buttonJump(destination){
        window.location.href=destination;
    }
</script>
</html>
