<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="utf-8">
   <title>Review Job Description</title>
    <link rel="stylesheet" href="../../static/css/reset.css" />
    <link rel="stylesheet" href="../../static/css/global.css" />
</head>
<body class="administrator_view_job-body">
  <h1>Review Job Description</h1>
  <div class="administrator_view_job-body">
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
  <button type="button" name="administrator_view_jobApprove" onclick="buttonJump('administrator_profile.jsp')">Approve</button>
  <button type="button" name="administrator_view_jobReject" onclick="buttonJump('administrator_profile.jsp')">Reject</button>
</body>
<script type="text/javascript">
    window.onload = function () {
        loadReviewedJobDetail();
    }

    function loadReviewedJobDetail() {
        const request = new XMLHttpRequest();
        request.open('GET', 'http://localhost:8080/admin/action/get/job/detail?jobId='+localStorage.getItem("administratorViewJobId"), true);
        request.setRequestHeader("Content-Type", "application/json; charset=UTF-8");
        request.setRequestHeader("Authorization", localStorage.getItem("token"));
        request.onload = function () {
            const data = JSON.parse(this.response);
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
</script>
</html>
