<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Browse Job Details</title>
    <link rel="stylesheet" href="../../static/css/reset.css"/>
    <link rel="stylesheet" href="../../static/css/global.css"/>
    <script type="text/javascript" src="../../static/js/functions.js"></script>
</head>
<body class="freelancer_browse_jobs_details-body">
<h1>Browse Job Details</h1>
<div class="freelancer_browse_jobs_details-div">
    <p id="availableJobDetailName"></p>
    <p id="availableJobDetailCompany"></p>
    <p id="availableJobDetailExperience"></p>
    <p id="availableJobDetailLocation"></p>
    <p id="availableJobDetailField"></p>
    <p id="availableJobDetailSalary"></p>
    <p id="availableJobDetailContact"></p>
    <p id="availableJobDetailDescription"></p>
</div>
<br>
<button type="button" name="freelancer_browse_jobs_detailsApply" onclick="applyJob()">Apply</button>
<button type="button" name="freelancer_browse_jobs_detailsBack"
        onclick="buttonJump('http://localhost:8080/page/freelancer/browse-jobs')">Back
</button>
</body>
<%--<footer>--%>
<%--    <div class="footerSetting">--%>
<%--        <p>&copy;2021 Job Search System. All Rights Reserved.</p>--%>
<%--    </div>--%>
<%--</footer>--%>


<script type="text/javascript">

  window.onload = function () {
    loadAvailableJobDetails();
  }

  function loadAvailableJobDetails () {
    const request = new XMLHttpRequest();
    request.open('GET', 'http://localhost:8080/user/action/get/job/detail?jobId=' + localStorage.getItem("freelancerViewAvailableJobId"), true);
    request.setRequestHeader("Content-Type", "application/json; charset=UTF-8");
    request.setRequestHeader("Authorization", localStorage.getItem("token"));
    request.onload = function () {
      const data = JSON.parse(this.response);
      const name = document.getElementById("availableJobDetailName");
      name.innerText = "Job Name: " + data.name;
      const company = document.getElementById("availableJobDetailCompany");
      company.innerText = "Company: " + data.company;
      const experience = document.getElementById("availableJobDetailExperience");
      experience.innerText = "Experience: " + data.experience;
      const location = document.getElementById("availableJobDetailLocation");
      location.innerText = "Location: " + data.location;
      const field = document.getElementById("availableJobDetailField");
      field.innerText = "Field: " + data.field;
      const salary = document.getElementById("availableJobDetailSalary");
      salary.innerText = "Salary: " + data.salary;
      const contact = document.getElementById("availableJobDetailContact");
      contact.innerText = "Contact: " + data.contact;
      const jobDescription = document.getElementById("availableJobDetailDescription");
      jobDescription.innerText = "Job Description: " + data.jobDescription;
    }
    request.send();
  }

  function applyJob () {
    const request = new XMLHttpRequest();
    request.open('GET', 'http://localhost:8080/freelancer/action/apply/job?jobId=' + localStorage.getItem("freelancerViewAvailableJobId"), true);
    request.setRequestHeader("Content-Type", "application/json; charset=UTF-8");
    request.setRequestHeader("Authorization", localStorage.getItem("token"));
    request.onload = function () {
      const data = JSON.parse(this.response);
      if (data === 'successfully') {
        alert("Apply job successfully!");
      } else if (data === 'existed') {
        alert("You have applied this job at before");
      } else {
        alert("System Error");
      }
    }
    request.send();
  }

  function buttonJump (destination) {
    window.location.href = destination;
  }

</script>
</html>
