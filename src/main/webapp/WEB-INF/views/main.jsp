<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="utf-8">
   <title>Job Search System</title>
   <link rel="stylesheet" type="text/css" href="../../static/css/reset.css" />
   <link rel="stylesheet" type="text/css" href="../../static/css/global.css" />
   <script type="text/javascript" src="functions.js"></script>
</head>
<body class="main-body">
  <div class="main-div">
    <h1 class="main">Job Search System</h1>
    <div class="btn-top">
      <button type="button" name="forFreelancer" onclick="buttonJump('http://localhost:8080/page/freelancer/login')">For Freelancer</button>
    </div>
    <div class="btn-mid">
      <button type="button" name="forEmployer" onclick="buttonJump('http://localhost:8080/page/employer/login')">For Employer</button>
    </div>
    <div class="btn-bot">
        <button type="button" name="forAdministrator" onclick="buttonJump('http://localhost:8080/page/admin/login')">For Administrator</button>
  </div>
  </div>
</body>
</html>
