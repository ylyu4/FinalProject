<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Write Job Description</title>
    <link rel="stylesheet" type="text/css" href="../../static/css/reset.css"/>
    <link rel="stylesheet" type="text/css" href="../../static/css/global.css"/>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Fredoka+One&display=swap" rel="stylesheet">
</head>
<body class="employer_write_job_description-body">
<div class="header">
    <p class="systemTitle">Job Search System</p>
</div>
<div class="employer_write_job_description-div">
    <h1>Write Job Description</h1>
    <form action="employer_write_job_description.jsp">
        <div class="employer_write_job_description-left">
            <div>
                <label class="employer_write_job_description-form-label" for="jobName">Job Name</label>
            </div>
            <div>
                <input class="employer_write_job_description-form" id="jobName" type="text" name="jobName" value=""
                       required>
            </div>
            <div>
                <label class="employer_write_job_description-form-label" for="jobCompany">Company</label>
            </div>
            <div>
                <input class="employer_write_job_description-form" id="jobCompany" type="text" name="jobCompany"
                       value="" required>
            </div>
            <div>
                <label class="employer_write_job_description-form-label" for="jobExperience">Experience</label>
            </div>
            <div>
                <input class="employer_write_job_description-form" id="jobExperience" type="text" name="jobExperience"
                       value="" required>
            </div>
            <div>
                <label class="employer_write_job_description-form-label" for="jobLocation">Location</label>
            </div>
            <div>
                <input class="employer_write_job_description-form" id="jobLocation" type="text" name="jobLocation"
                       value="" required>
            </div>
            <div>
                <label class="employer_write_job_description-form-label" for="jobField">Field</label>
            </div>
            <div>
                <input class="employer_write_job_description-form" id="jobField" type="text" name="jobField" value=""
                       required>
            </div>
            <div>
                <label class="employer_write_job_description-form-label" for="jobSalary">Salary</label>
            </div>
            <div>
                <input class="employer_write_job_description-form" id="jobSalary" type="text" name="jobSalary" value=""
                       required>
            </div>
            <div>
                <label class="employer_write_job_description-form-label" for="jobContact">Contact</label>
            </div>
            <div>
                <input class="employer_write_job_description-form" id="jobContact" type="text" name="jobContact"
                       value="" required>
            </div>
            <div>
                <label class="employer_write_job_description-form-label" for="jobDueDate">Due Date</label>
            </div>
            <div>
                <input class="employer_write_job_description-form" id="jobDueDate" type="date" name="jobDueDate"
                       value="" required>
            </div>
        </div>
        <div class="employer_write_job_description-right">
            <div>
                <label class="employer_write_job_description-form-label" for="jobDescription">Description</label>
            </div>
            <div>
                <textarea id="jobDescription" name="jobDescription" required></textarea>
            </div>
            <button type="button" name="employer_write_job_descriptionPost" onclick="createJob()">Create</button>
            <button type="button" name="employer_write_job_descriptionBack"
                    onclick="buttonJump('${pageContext.request.contextPath}/page/employer/job')">Back
            </button>
        </div>
    </form>
</div>
</body>


<script type="text/javascript">
  function createJob () {
    const jobName = document.getElementById("jobName").value;
    const company = document.getElementById("jobCompany").value;
    const experience = document.getElementById("jobExperience").value;
    const location = document.getElementById("jobLocation").value;
    const field = document.getElementById("jobField").value;
    const salary = document.getElementById("jobSalary").value;
    const contact = document.getElementById("jobContact").value;
    const dueDate = document.getElementById("jobDueDate").value;
    const description = document.getElementById("jobDescription").value;

    if (!isNumeric(salary)) {
      alert('The salary should be a number!');
      return;
    }
    const sign = Math.sign(parseInt(salary));
    if (sign !== 1) {
      alert('The salary should be positive!');
      return;
    }

    if (!dueDate) {
      alert('Please input the due date!');
      return;
    }

    const request = new XMLHttpRequest();
    request.open('POST', '${pageContext.request.contextPath}/employer/action/create/job', true);
    request.setRequestHeader("Content-Type", "application/json; charset=UTF-8");
    request.setRequestHeader("Authorization", localStorage.getItem("token"))
    request.onload = function () {
      const data = JSON.parse(this.response);
      if (data === "Created") {
        alert("Create Job Successfully!");
        buttonJump('${pageContext.request.contextPath}/page/employer/job');
      } else {
        alert("System Error!");
      }
    }
    request.send(JSON.stringify({
      "name": jobName,
      "company": company,
      "experience": experience,
      "location": location,
      "field": field,
      "salary": salary,
      "contact": contact,
      "deadline": dueDate,
      "description": description
    }));
  }

  function buttonJump (destination) {
    window.location.href = destination;
  }

  function isNumeric (num) {
    return !isNaN(num)
  }
</script>
</html>
