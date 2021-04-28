<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>View Job Details</title>
    <link rel="stylesheet" href="../../static/css/reset.css"/>
    <link rel="stylesheet" href="../../static/css/global.css"/>
    <script type="text/javascript" src="../../static/js/functions.js"></script>
</head>
<body class="employer_view_posted_job_details-body">
<h1>View Job Details</h1>
<div class="employer_view_posted_job_details-div">
    <p id="postedJobDetailName"></p>
    <p id="postedJobDetailCompany"></p>
    <p id="postedJobDetailExperience"></p>
    <p id="postedJobDetailLocation"></p>
    <p id="postedJobDetailField"></p>
    <p id="postedJobDetailSalary"></p>
    <p id="postedJobDetailContact"></p>
    <p id="postedJobDetailDescription"></p>
</div>
<br>
<button type="button" name="employer_view_posted_job_detailsBack"
        onclick="buttonJump('http://localhost:8080/page/employer/profile')">Back
</button>
</body>
<%--<footer>--%>
<%--    <div class="footerSetting">--%>
<%--        <p>&copy;2021 Job Search System. All Rights Reserved.</p>--%>
<%--    </div>--%>
<%--</footer>--%>

<script type="text/javascript">

  window.onload = function () {
    loadPostedJobDetails();
  }

  function loadPostedJobDetails () {
    const request = new XMLHttpRequest();
    request.open('GET', 'http://localhost:8080/user/action/get/job/detail?jobId=' + localStorage.getItem("employerViewDetailsJobId"), true);
    request.setRequestHeader("Content-Type", "application/json; charset=UTF-8");
    request.setRequestHeader("Authorization", localStorage.getItem("token"));
    request.onload = function () {
      const data = JSON.parse(this.response);
      const name = document.getElementById("postedJobDetailName");
      name.innerText = "Job Id: " + data.name;
      const company = document.getElementById("postedJobDetailCompany");
      company.innerText = "Company: " + data.company;
      const experience = document.getElementById("postedJobDetailExperience");
      experience.innerText = "Experience: " + data.experience;
      const location = document.getElementById("postedJobDetailLocation");
      location.innerText = "Location: " + data.location;
      const field = document.getElementById("postedJobDetailField");
      field.innerText = "Field: " + data.field;
      const salary = document.getElementById("postedJobDetailSalary");
      salary.innerText = "Salary: " + data.salary;
      const contact = document.getElementById("postedJobDetailContact");
      contact.innerText = "Contact: " + data.contact;
      const jobDescription = document.getElementById("postedJobDetailDescription");
      jobDescription.innerText = "Job Description: " + data.jobDescription;
    }
    request.send();
  }

  function buttonJump (destination) {
    window.location.href = destination;
  }

</script>
</html>
