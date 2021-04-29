<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>My Resume</title>
    <link rel="stylesheet" href="../../static/css/reset.css"/>
    <link rel="stylesheet" href="../../static/css/global.css"/>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Fredoka+One&display=swap" rel="stylesheet">
</head>
<body class="freelancer_view_resume-body">
<div class="header">
    <p class="systemTitle">Job Search System</p>
</div>
<div class="freelancer_view_resume-div">
    <h1>My Resume</h1>
    <form action="">
        <div class="freelancer_view_resume-form-content">
            <hr class="style">
            <h2>Education Experience</h2>
            <div>
                <label class="freelancer_view_resume-form-label" for="from">From</label>
            </div>
            <div>
                <input id="freelancerEditEEFrom" class="freelancer_view_resume-form" type="date" name="freelancerFrom"
                       disabled="disabled" value="" required>
            </div>
            <div>
                <label class="freelancer_view_resume-form-label" for="to">To</label>
            </div>
            <div>
                <input id="freelancerEditEETo" class="freelancer_view_resume-form" type="date" name="freelancerTo"
                       disabled="disabled" value="" required>
            </div>
            <div>
                <label class="freelancer_view_resume-form-label" for="school">School</label>
            </div>
            <div>
                <input id="freelancerEditEESchool" class="freelancer_view_resume-form" type="text"
                       name="freelancerSchool" disabled="disabled" value="" required>
            </div>
            <div>
                <label class="freelancer_view_resume-form-label" for="degree">Degree</label>
            </div>
            <div>
                <input id="freelancerEditEEDegree" class="freelancer_view_resume-form" type="text"
                       name="freelancerDegree" disabled="disabled" value="" required>
            </div>
            <div>
                <label class="freelancer_view_resume-form-label" for="major">Major</label>
            </div>
            <div>
                <input id="freelancerEditEEMajor" class="freelancer_view_resume-form" type="text" name="freelancerMajor"
                       disabled="disabled" value="" required>
            </div>
            <div>
                <label class="freelancer_view_resume-form-label" for="description">Description</label>
            </div>
            <div>
                <textarea id="freelancerEditEEDescription" disabled="disabled" required></textarea>
            </div>
            <hr class="style">
            <h2>Work Experience</h2>
            <div>
                <label class="freelancer_view_resume-form-label" for="from">From</label>
            </div>
            <div>
                <input id="freelancerEditWEFrom" class="freelancer_view_resume-form" type="date" name="freelancerFrom"
                       disabled="disabled" value="" required>
            </div>
            <div>
                <label class="freelancer_view_resume-form-label" for="to">To</label>
            </div>
            <div>
                <input id="freelancerEditWETo" class="freelancer_view_resume-form" type="date" name="freelancerTo"
                       disabled="disabled" value="" required>
            </div>
            <div>
                <label class="freelancer_view_resume-form-label" for="company">Company</label>
            </div>
            <div>
                <input id="freelancerEditWECompany" class="freelancer_view_resume-form" type="text"
                       name="freelancerSchool" disabled="disabled" value="" required>
            </div>
            <div>
                <label class="freelancer_view_resume-form-label" for="department">Department</label>
            </div>
            <div>
                <input id="freelancerEditWEDepartment" class="freelancer_view_resume-form" type="text"
                       name="freelancerDegree" disabled="disabled" value="" required>
            </div>
            <div>
                <label class="freelancer_view_resume-form-label" for="position">Position</label>
            </div>
            <div>
                <input id="freelancerEditWEPosition" class="freelancer_view_resume-form" type="text"
                       name="freelancerMajor" disabled="disabled" value="" required>
            </div>
            <div>
                <label class="freelancer_view_resume-form-label" for="description">Description</label>
            </div>
            <div>
                <textarea id="freelancerEditWEDescription" disabled="disabled" required></textarea>
            </div>
            <hr class="style">
            <h2>Languages</h2>
            <div>
                <textarea id="freelancerEditLanguage" disabled="disabled" required></textarea>
            </div>
            <hr class="style">
            <h2>Skills</h2>
            <div>
                <textarea id="freelancerEditSkill" disabled="disabled" required></textarea>
            </div>
            <hr class="style">
            <h2>Self Reviews</h2>
            <div>
                <textarea id="freelancerEditSelfReviews" disabled="disabled" required></textarea>
            </div>
        </div>
        <button type="button" name="freelancer_view_resumeEdit" onclick="freelancerResumeEditEnable()">Edit</button>
        <button type="button" name="freelancer_view_resumeSave" onclick="updateFreelancerResume()">Save</button>
        <button type="button" name="freelancer_view_resumeBack" onclick="buttonJump('http://localhost:8080/page/freelancer/job')">Back
        </button>
    </form>
</div>
</body>
<%--<footer>--%>
<%--    <div class="footerSetting">--%>
<%--        <p>&copy;2021 Job Search System. All Rights Reserved.</p>--%>
<%--    </div>--%>
<%--</footer>--%>

<script type="text/javascript">


  window.onload = function () {
    loadResume();
  }

  function loadResume () {
    const request = new XMLHttpRequest();
    request.open('GET', 'http://localhost:8080/freelancer/action/get/resume', true);
    request.setRequestHeader("Content-Type", "application/json; charset=UTF-8");
    request.setRequestHeader("Authorization", localStorage.getItem("token"));
    request.onload = function () {
      const data = JSON.parse(this.response);
      if (data.educationStartTime != null) {
        document.getElementById("freelancerEditEEFrom").value = data.educationStartTime;
      } else {
        document.getElementById("freelancerEditEEFrom").value = '';
      }

      if (data.educationEndTime != null) {
        document.getElementById("freelancerEditEETo").value = data.educationEndTime;
      } else {
        document.getElementById("freelancerEditEETo").value = '';
      }

      if (data.school != null) {
        document.getElementById("freelancerEditEESchool").value = data.school;
      } else {
        document.getElementById("freelancerEditEESchool").value = '';
      }

      if (data.degree != null) {
        document.getElementById("freelancerEditEEDegree").value = data.degree;
      } else {
        document.getElementById("freelancerEditEEDegree").value = '';
      }

      if (data.major != null) {
        document.getElementById("freelancerEditEEMajor").value = data.major;
      } else {
        document.getElementById("freelancerEditEEMajor").value = '';
      }

      if (data.educationDescription != null) {
        document.getElementById("freelancerEditEEDescription").value = data.educationDescription;
      } else {
        document.getElementById("freelancerEditEEDescription").value = '';
      }

      if (data.workExperienceStartTime != null) {
        document.getElementById("freelancerEditWEFrom").value = data.workExperienceStartTime;
      } else {
        document.getElementById("freelancerEditWEFrom").value = '';
      }

      if (data.workExperienceEndTime != null) {
        document.getElementById("freelancerEditWETo").value = data.workExperienceEndTime;
      } else {
        document.getElementById("freelancerEditWETo").value = '';
      }

      if (data.company != null) {
        document.getElementById("freelancerEditWECompany").value = data.company;
      } else {
        document.getElementById("freelancerEditWECompany").value = '';
      }

      if (data.department != null) {
        document.getElementById("freelancerEditWEDepartment").value = data.department;
      } else {
        document.getElementById("freelancerEditWEDepartment").value = '';
      }

      if (data.position != null) {
        document.getElementById("freelancerEditWEPosition").value = data.position;
      } else {
        document.getElementById("freelancerEditWEPosition").value = '';
      }

      if (data.workExperienceDescription != null) {
        document.getElementById("freelancerEditWEDescription").value = data.workExperienceDescription;
      } else {
        document.getElementById("freelancerEditWEDescription").value = '';
      }

      if (data.language != null) {
        document.getElementById("freelancerEditLanguage").value = data.language;
      } else {
        document.getElementById("freelancerEditLanguage").value = '';
      }

      if (data.skill != null) {
        document.getElementById("freelancerEditSkill").value = data.skill;
      } else {
        document.getElementById("freelancerEditSkill").value = '';
      }

      if (data.selfReviews != null) {
        document.getElementById("freelancerEditSelfReviews").value = data.selfReviews;
      } else {
        document.getElementById("freelancerEditSelfReviews").value = '';
      }
    }
    request.send();
  }

  function freelancerResumeEditEnable () {
    document.getElementById("freelancerEditEEFrom").disabled = "";
    document.getElementById("freelancerEditEETo").disabled = "";
    document.getElementById("freelancerEditEESchool").disabled = "";
    document.getElementById("freelancerEditEEDegree").disabled = "";
    document.getElementById("freelancerEditEEMajor").disabled = "";
    document.getElementById("freelancerEditEEDescription").disabled = "";
    document.getElementById("freelancerEditWEFrom").disabled = "";
    document.getElementById("freelancerEditWETo").disabled = "";
    document.getElementById("freelancerEditWECompany").disabled = "";
    document.getElementById("freelancerEditWEDepartment").disabled = "";
    document.getElementById("freelancerEditWEPosition").disabled = "";
    document.getElementById("freelancerEditWEDescription").disabled = "";
    document.getElementById("freelancerEditLanguage").disabled = "";
    document.getElementById("freelancerEditSkill").disabled = "";
    document.getElementById("freelancerEditSelfReviews").disabled = "";
  }

  function updateFreelancerResume () {
    let educationStartTime = document.getElementById("freelancerEditEEFrom").value
    let educationEndTime = document.getElementById("freelancerEditEETo").value
    let school = document.getElementById("freelancerEditEESchool").value
    let degree = document.getElementById("freelancerEditEEDegree").value
    let major = document.getElementById("freelancerEditEEMajor").value
    let educationDescription = document.getElementById("freelancerEditEEDescription").value
    let workExperienceStartTime = document.getElementById("freelancerEditWEFrom").value
    let workExperienceEndTime = document.getElementById("freelancerEditWETo").value
    let company = document.getElementById("freelancerEditWECompany").value
    let department = document.getElementById("freelancerEditWEDepartment").value
    let position = document.getElementById("freelancerEditWEPosition").value
    let workExperienceDescription = document.getElementById("freelancerEditWEDescription").value
    let language = document.getElementById("freelancerEditLanguage").value
    let skill = document.getElementById("freelancerEditSkill").value
    let selfReviews = document.getElementById("freelancerEditSelfReviews").value

    const request = new XMLHttpRequest();
    request.open('POST', 'http://localhost:8080/freelancer/action/update/resume', true);
    request.setRequestHeader("Content-Type", "application/json; charset=UTF-8");
    request.setRequestHeader("Authorization", localStorage.getItem("token"))
    request.onload = function () {
      const data = JSON.parse(this.response);
      educationStartTime = data.educationStartTime;
      document.getElementById('freelancerEditEEFrom').disabled = true;
      educationEndTime = data.educationEndTime;
      document.getElementById('freelancerEditEETo').disabled = true;
      school = data.school;
      document.getElementById('freelancerEditEESchool').disabled = true;
      degree = data.degree;
      document.getElementById('freelancerEditEEDegree').disabled = true;
      major = data.major;
      document.getElementById('freelancerEditEEMajor').disabled = true;
      educationDescription = data.educationDescription;
      document.getElementById('freelancerEditEEDescription').disabled = true;
      workExperienceStartTime = data.workExperienceStartTime;
      document.getElementById('freelancerEditWEFrom').disabled = true;
      workExperienceEndTime = data.workExperienceEndTime;
      document.getElementById('freelancerEditWETo').disabled = true;
      company = data.company;
      document.getElementById('freelancerEditWECompany').disabled = true;
      department = data.department;
      document.getElementById('freelancerEditWEDepartment').disabled = true;
      position = data.position;
      document.getElementById('freelancerEditWEPosition').disabled = true;
      workExperienceDescription = data.workExperienceDescription;
      document.getElementById('freelancerEditWEDescription').disabled = true;
      language = data.language;
      document.getElementById('freelancerEditLanguage').disabled = true;
      skill = data.skill;
      document.getElementById('freelancerEditSkill').disabled = true;
      selfReviews = data.selfReviews;
      document.getElementById('freelancerEditSelfReviews').disabled = true;
    }
    request.send(JSON.stringify({
      "educationStartTime": educationStartTime,
      "educationEndTime": educationEndTime,
      "school": school,
      "degree": degree,
      "major": major,
      "educationDescription": educationDescription,
      "workExperienceStartTime": workExperienceStartTime,
      "workExperienceEndTime": workExperienceEndTime,
      "company": company,
      "department": department,
      "position": position,
      "workExperienceDescription": workExperienceDescription,
      "language": language,
      "skill": skill,
      "selfReviews": selfReviews
    }))

  }

  function buttonJump (destination) {
    window.location.href = destination;
  }

</script>
</html>
