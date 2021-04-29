<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Review Job Description</title>
    <link rel="stylesheet" href="../../static/css/reset.css"/>
    <link rel="stylesheet" href="../../static/css/global.css"/>
</head>
<body class="administrator_view_job-body">
<h1>Review Job Description</h1>
<div class="administrator_view_job-body-information">
    <p id="reviewedJobId"></p>
    <p id="reviewedJobName"></p>
    <p id="reviewedJobCompany"></p>
    <p id="reviewedJobExperience"></p>
    <p id="reviewedJobLocation"></p>
    <p id="reviewedJobField"></p>
    <p id="reviewedJobSalary"></p>
    <p id="reviewedJobContact"></p>
    <p id="reviewedJobDescription"></p>
    <p id="reviewedJobCreatorId"></p>
</div>
<br>
<button type="button" name="administrator_view_jobApprove" onclick="processNewJob('Approve')">Approve</button>
<button type="button" name="administrator_view_jobReject" onclick="processNewJob('Reject')">Reject</button>
<button type="button" name="administrator_view_back" onclick="buttonJump('http://localhost:8080/page/admin/job')">Back</button>
</body>
<%--<footer>--%>
<%--    <div class="footerSetting">--%>
<%--        <p>&copy;2021 Job Search System. All Rights Reserved.</p>--%>
<%--    </div>--%>
<%--</footer>--%>

<script type="text/javascript">
  window.onload = function () {
    loadReviewedJobDetail();
  }

  function loadReviewedJobDetail () {
    const request = new XMLHttpRequest();
    request.open('GET', 'http://localhost:8080/user/action/get/job/detail?jobId=' + localStorage.getItem("administratorViewJobId"), true);
    request.setRequestHeader("Content-Type", "application/json; charset=UTF-8");
    request.setRequestHeader("Authorization", localStorage.getItem("token"));
    request.onload = function () {
      const data = JSON.parse(this.response);
      const id = document.getElementById("reviewedJobId");
      id.innerText = "Job Id: " + data.id;
      const name = document.getElementById("reviewedJobName");
      name.innerText = "Job Name: " + data.name;
      const company = document.getElementById("reviewedJobCompany");
      company.innerText = "Company: " + data.company;
      const experience = document.getElementById("reviewedJobExperience");
      experience.innerText = "Experience: " + data.experience;
      const location = document.getElementById("reviewedJobLocation");
      location.innerText = "Location: " + data.location;
      const field = document.getElementById("reviewedJobField");
      field.innerText = "Field: " + data.field;
      const salary = document.getElementById("reviewedJobSalary");
      salary.innerText = "Salary: " + data.salary;
      const contact = document.getElementById("reviewedJobContact");
      contact.innerText = "Contact: " + data.contact;
      const jobDescription = document.getElementById("reviewedJobDescription");
      jobDescription.innerText = "Job Description: " + data.jobDescription;
      const createdBy = document.getElementById("reviewedJobCreatorId");
      createdBy.innerText = "Creator ID: " + data.createdBy;
    }
    request.send();
  }

  function processNewJob (action) {
    const request = new XMLHttpRequest();
    request.open('POST', 'http://localhost:8080/admin/action/process/job', true);
    request.setRequestHeader("Content-Type", "application/json; charset=UTF-8");
    request.setRequestHeader("Authorization", localStorage.getItem("token"));
    request.onload = function () {
      const data = JSON.parse(this.response);
      if (data === "Successfully") {
        buttonJump("http://localhost:8080/page/admin/job");
      } else {
        alert("System Error!")
      }
    }
    request.send(JSON.stringify({
      "id": localStorage.getItem("administratorViewJobId"),
      "action": action
    }));
  }

  function buttonJump (destination) {
    window.location.href = destination;
  }
</script>
</html>
