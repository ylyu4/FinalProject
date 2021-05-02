<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Applied Job Details</title>
    <link rel="stylesheet" href="../../static/css/reset.css"/>
    <link rel="stylesheet" href="../../static/css/global.css"/>
</head>
<body class="freelancer_browse_applied_jobs_details-body">
<h1>Applied Job Details</h1>
<div class="freelancer_browse_applied_jobs_details-div">
    <p id="appliedJobDetailName"></p>
    <p id="appliedJobDetailCompany"></p>
    <p id="appliedJobDetailExperience"></p>
    <p id="appliedJobDetailLocation"></p>
    <p id="appliedJobDetailField"></p>
    <p id="appliedJobDetailSalary"></p>
    <p id="appliedJobDetailContact"></p>
    <p id="appliedJobDetailDescription"></p>
</div>
<button type="button" name="freelancer_browse_applied_jobs_detailsBack"
        onclick="buttonJump('${pageContext.request.contextPath}/page/freelancer/job')">Back
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
    request.open('GET', '${pageContext.request.contextPath}/user/action/get/job/detail?jobId=' + localStorage.getItem("freelancerViewAppliedJobId"), true);
    request.setRequestHeader("Content-Type", "application/json; charset=UTF-8");
    request.setRequestHeader("Authorization", localStorage.getItem("token"));
    request.onload = function () {
      const data = JSON.parse(this.response);
      const name = document.getElementById("appliedJobDetailName");
      name.innerText = "Job Name: " + data.name;
      const company = document.getElementById("appliedJobDetailCompany");
      company.innerText = "Company: " + data.company;
      const experience = document.getElementById("appliedJobDetailExperience");
      experience.innerText = "Experience: " + data.experience;
      const location = document.getElementById("appliedJobDetailLocation");
      location.innerText = "Location: " + data.location;
      const field = document.getElementById("appliedJobDetailField");
      field.innerText = "Field: " + data.field;
      const salary = document.getElementById("appliedJobDetailSalary");
      salary.innerText = "Salary: " + data.salary;
      const contact = document.getElementById("appliedJobDetailContact");
      contact.innerText = "Contact: " + data.contact;
      const jobDescription = document.getElementById("appliedJobDetailDescription");
      jobDescription.innerText = "Job Description: " + data.jobDescription;
    }
    request.send();
  }

  function buttonJump (destination) {
    window.location.href = destination;
  }

</script>
</html>
