<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Check Applicant Qualification</title>
    <link rel="stylesheet" href="../../static/css/reset.css"/>
    <link rel="stylesheet" href="../../static/css/global.css"/>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Fredoka+One&display=swap" rel="stylesheet">
    <script type="text/javascript" src="../../static/js/functions.js"></script>
</head>
<body class="employer_check_applicant_qualification-body">
<div class="header">
    <p class="systemTitle">Job Search System</p>
</div>
<div class="employer_check_applicant_qualification-div">
    <div class="employer_check_applicant_qualification-div-left">
        <div class="employer_check_applicant_qualification-block">
            <h1>Personal Information</h1>
            <p id="applicantName"></p>
            <p id="applicantAge"></p>
            <p id="applicantLocation"></p>
            <p id="applicantPhone"></p>
            <p id="applicantEmail"></p>
        </div>
        <div class="employer_check_applicant_qualification-block">
            <h1>Education Experience</h1>
            <p id="applicantEducationStartTime"></p>
            <p id="applicantEducationEndTime"></p>
            <p id="applicantEducationSchool"></p>
            <p id="applicantEducationDegree"></p>
            <p id="applicantEducationMajor"></p>
            <p id="applicantEducationDescription"></p>
        </div>
    </div>
    <div class="employer_check_applicant_qualification-div-middle">
        <div class="employer_check_applicant_qualification-block">
            <h1>Work Experience</h1>
            <p id="applicantWorkStartTime"></p>
            <p id="applicantWorkEndTime"></p>
            <p id="applicantWorkCompany"></p>
            <p id="applicantWorkDepartment"></p>
            <p id="applicantWorkPosition"></p>
            <p id="applicantWorkDescription"></p>
        </div>
        <div class="employer_check_applicant_qualification-block">
            <h1>Others</h1>
            <p id="applicantLanguages"></p>
            <p id="applicantSkills"></p>
            <p id="applicantReviews"></p>
        </div>
    </div>
    <div class="employer_check_applicant_qualification-div-right">
        <div class="employer_check_applicant_qualification-block">
            <h1>Application Status</h1>
            <select class="employer_check_applicant_qualification-select" id="applicationStatusSelect">
                <option class="employer_check_applicant_qualification-option" value="PENDING">PENDING</option>
                <option class="employer_check_applicant_qualification-option" value="INVITING">INVITING</option>
                <option class="employer_check_applicant_qualification-option" value="INTERVIEWING">INTERVIEWING</option>
                <option class="employer_check_applicant_qualification-option" value="OFFER">OFFER</option>
                <option class="employer_check_applicant_qualification-option" value="REJECTED">REJECTED</option>
                <option class="employer_check_applicant_qualification-option" value="DONE">ACCEPTED</option>
            </select><br>
            <button type="button" name="employer_check_applicant_qualificationUpdate" onclick="updateApplication()">
                Update
            </button>
            <button type="button" name="employer_back_to_previous_page"
                    onclick="buttonJump('http://localhost:8080/page/employer/check-applicants-list')">Back
            </button>
        </div>
    </div>
</div>
</body>
<%--<footer>--%>
<%--    <div class="footerSetting">--%>
<%--        <p>&copy;2021 Job Search System. All Rights Reserved.</p>--%>
<%--    </div>--%>
<%--</footer>--%>

<script type="text/javascript">

  window.onload = function () {
    checkApplicantInformation();
    checkApplicantResume();
    displayApplicationStatus();
  }


  let currentStatus = 'PENDING';

  function checkApplicantInformation () {
    const request = new XMLHttpRequest();
    request.open('GET', 'http://localhost:8080/employer/action/get/applicant/information?applicantId=' + localStorage.getItem("applicantId"), true);
    request.setRequestHeader("Content-Type", "application/json; charset=UTF-8");
    request.setRequestHeader("Authorization", localStorage.getItem("token"));
    request.onload = function () {
      const data = JSON.parse(this.response);
      if (data.name != null || data.length > 0) {
        document.getElementById("applicantName").textContent = 'Name: ' + data.name;
      } else {
        document.getElementById("applicantName").textContent = 'Name: Unavailable';
      }
      if (data.age != null || data.length > 0) {
        document.getElementById("applicantAge").textContent = 'Age: ' + data.age;
      } else {
        document.getElementById("applicantAge").textContent = 'Age: Unavailable';
      }
      if (data.location != null || data.length > 0) {
        document.getElementById("applicantLocation").textContent = 'Location: ' + data.location;
      } else {
        document.getElementById("applicantLocation").textContent = 'Location: Unavailable';
      }
      if (data.phone != null || data.length > 0) {
        document.getElementById("applicantPhone").textContent = 'Phone: ' + data.phone;
      } else {
        document.getElementById("applicantPhone").textContent = 'Phone: Unavailable';
      }
      if (data.email != null || data.length > 0) {
        document.getElementById("applicantEmail").textContent = 'Email: ' + data.email;
      } else {
        document.getElementById("applicantEmail").textContent = 'Email: Unavailable';
      }
    }
    request.send();
  }

  function checkApplicantResume () {
    const request = new XMLHttpRequest();
    request.open('GET', 'http://localhost:8080/employer/action/get/applicant/resume?applicantId=' + localStorage.getItem("applicantId"), true);
    request.setRequestHeader("Content-Type", "application/json; charset=UTF-8");
    request.setRequestHeader("Authorization", localStorage.getItem("token"));
    request.onload = function () {
      const data = JSON.parse(this.response);
      if (data.educationStartTime != null) {
        document.getElementById("applicantEducationStartTime").textContent = 'Start: ' + data.educationStartTime;
      } else {
        document.getElementById("applicantEducationStartTime").textContent = 'Start: Unavailable';
      }

      if (data.educationEndTime != null) {
        document.getElementById("applicantEducationEndTime").textContent = 'End: ' + data.educationEndTime;
      } else {
        document.getElementById("applicantEducationEndTime").textContent = 'End: Unavailable';
      }

      if (data.school != null) {
        document.getElementById("applicantEducationSchool").textContent = 'School: ' + data.school;
      } else {
        document.getElementById("applicantEducationSchool").textContent = 'School: Unavailable';
      }

      if (data.degree != null) {
        document.getElementById("applicantEducationDegree").textContent = 'Degree: ' + data.degree;
      } else {
        document.getElementById("applicantEducationDegree").textContent = 'Degree: Unavailable';
      }

      if (data.major != null) {
        document.getElementById("applicantEducationMajor").textContent = 'Major: ' + data.major;
      } else {
        document.getElementById("applicantEducationMajor").textContent = 'Major: Unavailable';
      }

      if (data.educationDescription != null) {
        document.getElementById("applicantEducationDescription").textContent = 'Description: ' + data.educationDescription;
      } else {
        document.getElementById("applicantEducationDescription").textContent = 'Description: Unavailable';
      }

      if (data.workExperienceStartTime != null) {
        document.getElementById("applicantWorkStartTime").textContent = 'Start: ' + data.workExperienceStartTime;
      } else {
        document.getElementById("applicantWorkStartTime").textContent = 'Start: Unavailable';
      }

      if (data.workExperienceEndTime != null) {
        document.getElementById("applicantWorkEndTime").textContent = 'End: ' + data.workExperienceEndTime;
      } else {
        document.getElementById("applicantWorkEndTime").textContent = 'End: Unavailable';
      }

      if (data.company != null) {
        document.getElementById("applicantWorkCompany").textContent = 'Company: ' + data.company;
      } else {
        document.getElementById("applicantWorkCompany").textContent = 'Company: Unavailable';
      }

      if (data.department != null) {
        document.getElementById("applicantWorkDepartment").textContent = 'Department: ' + data.department;
      } else {
        document.getElementById("applicantWorkDepartment").textContent = 'Department: Unavailable';
      }

      if (data.position != null) {
        document.getElementById("applicantWorkPosition").textContent = 'Position: ' + data.position;
      } else {
        document.getElementById("applicantWorkPosition").textContent = 'Position: Unavailable';
      }

      if (data.workExperienceDescription != null) {
        document.getElementById("applicantWorkDescription").textContent = 'Description: ' + data.workExperienceDescription;
      } else {
        document.getElementById("applicantWorkDescription").textContent = 'Description: Unavailable';
      }

      if (data.language != null) {
        document.getElementById("applicantLanguages").textContent = 'Languages: ' + data.language;
      } else {
        document.getElementById("applicantLanguages").textContent = 'Languages: Unavailable';
      }

      if (data.skill != null) {
        document.getElementById("applicantSkills").textContent = 'Skills: ' + data.skill;
      } else {
        document.getElementById("applicantSkills").textContent = 'Skills: Unavailable';
      }

      if (data.selfReviews != null) {
        document.getElementById("applicantReviews").textContent = 'Self Reviews: ' + data.selfReviews;
      } else {
        document.getElementById("applicantReviews").textContent = 'Self Reviews: Unavailable';
      }
    }
    request.send();
  }

  function displayApplicationStatus () {
    const request = new XMLHttpRequest();
    request.open('GET', 'http://localhost:8080/employer/action/get/applicant/application?applicationId=' + localStorage.getItem("applicationId"), true);
    request.setRequestHeader("Content-Type", "application/json; charset=UTF-8");
    request.setRequestHeader("Authorization", localStorage.getItem("token"));
    request.onload = function () {
      const data = JSON.parse(this.response);
      let option = document.getElementById('applicationStatusSelect');
      if (data.applicationStatus != null) {
        option.value = data.applicationStatus;
        currentStatus = data.applicationStatus;
      } else {
        option.value = 'PENDING';
      }
    }
    request.send();
  }

  function updateApplication () {
    const updateStatus = document.getElementById('applicationStatusSelect').value
    if (currentStatus === 'REJECTED') {
      alert("You cannot update the rejected status")
      return;
    }

    const request = new XMLHttpRequest();
    request.open('POST', 'http://localhost:8080/employer/action/update/application', true);
    request.setRequestHeader("Content-Type", "application/json; charset=UTF-8");
    request.setRequestHeader("Authorization", localStorage.getItem("token"));
    request.onload = function () {
      const data = JSON.parse(this.response);
      if (data === 'successfully') {
        alert("Update Application Successfully!")
        buttonJump('http://localhost:8080/page/employer/check-applicants-list')
      } else if (data === 'recharge') {
        alert("Your account balance is not enough! Please recharge at first!")
      } else {
        alert("System Error!")
      }
    }
    request.send(JSON.stringify({
      "applicationId": localStorage.getItem("applicationId"),
      "status": updateStatus
    }));
  }

  function buttonJump (destination) {
    window.location.href = destination;
  }

</script>
</html>
