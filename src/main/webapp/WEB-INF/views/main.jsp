<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Job Search System</title>
    <link rel="stylesheet" type="text/css" href="../../static/css/reset.css"/>
    <link rel="stylesheet" type="text/css" href="../../static/css/global.css"/>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Fredoka+One&display=swap" rel="stylesheet">
    <script type="text/javascript" src="../../static/js/functions.js"></script>
</head>
<body class="main-body">
<div class="main-div">
    <h1 class="main">Job Search System</h1>
    <div class="btn-top">
        <button type="button" name="forFreelancer" onclick="buttonJump('${pageContext.request.contextPath}/page/freelancer/login')">
            For Freelancer
        </button>
    </div>
    <div class="btn-mid">
        <button type="button" name="forEmployer" onclick="buttonJump('${pageContext.request.contextPath}/page/employer/login')">For
            Employer
        </button>
    </div>
    <div class="btn-bot">
        <button type="button" name="forAdministrator" onclick="buttonJump('${pageContext.request.contextPath}/page/admin/login')">For
            Administrator
        </button>
    </div>
</div>
</body>
</html>
