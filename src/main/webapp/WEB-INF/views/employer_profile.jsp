<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Employer Profile</title>
    <link rel="stylesheet" type="text/css" href="../../static/css/reset.css"/>
    <link rel="stylesheet" type="text/css" href="../../static/css/global.css"/>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Fredoka+One&display=swap" rel="stylesheet">
</head>
<body class="employer_profile-body">
<div class="header">
    <p class="systemTitle">Job Search System</p>
</div>
<div class="employer_personal_information">
    <h1 id="employer_profile_title">Employer Personal Information</h1>
    <div>
        <label class="employer_profile-form-label" for="name">Name</label>
    </div>
    <div>
        <input id="employerEditName" class="employer_profile-form" type="text" name="employerName"
               disabled="disabled" value="" required>
    </div>
    <div>
        <label class="employer_profile-form-label" for="city">City</label>
    </div>
    <div>
        <input id="employerEditCity" class="employer_profile-form" type="text" name="employerCity"
               disabled="disabled" value="" required>
    </div>
    <div>
        <label class="employer_profile-form-label" for="type">Type</label>
    </div>
    <div>
        <input id="employerEditType" class="employer_profile-form" type="text" name="employerType"
               disabled="disabled" value="" required>
    </div>
    <div>
        <label class="employer_profile-form-label" for="phone">Phone</label>
    </div>
    <div>
        <input id="employerEditPhone" class="employer_profile-form" type="text" name="employerPhone"
               disabled="disabled" value="" required>
    </div>
    <div>
        <label class="employer_profile-form-label" for="email">Email</label>
    </div>
    <div>
        <input id="employerEditEmail" class="employer_profile-form" type="text" name="employerEmail"
               disabled="disabled" value="" required>
    </div>
    <div>
        <label class="employer_profile-form-label" for="card">Card</label>
    </div>
    <div>
        <input id="employerEditCard" class="employer_profile-form" type="text" name="employerCard"
               disabled="disabled" value="" required>
    </div>
    <div>
        <label class="employer_profile-form-label" for="description">Description</label>
    </div>
    <div>
        <textarea id="employerEditDescription" disabled="disabled" required></textarea>
    </div>
    <button class="employer_profile-top-button" type="button" name="employer_profileEdit"
            onclick="employerProfileEditEnable()">Edit
    </button>
    <button class="employer_profile-top-button" type="button" name="employer_profileSave" value="Save"
            onclick="updateEmployerProfile()">Save
    </button>
    <button class="employer_profile-top-button" type="button" name="employer_profileQuit"
            onclick="buttonJump('${pageContext.request.contextPath}/page/employer/job')">Back
    </button>
</div>
</body>


<script type="text/javascript">

  window.onload = function () {
    loadProfile();
  }

  function loadProfile () {
    const request = new XMLHttpRequest();
    request.open('GET', '${pageContext.request.contextPath}/employer/action/profile', true);
    request.setRequestHeader("Content-Type", "application/json; charset=UTF-8");
    request.setRequestHeader("Authorization", localStorage.getItem("token"));
    request.onload = function () {
      const data = JSON.parse(this.response);
      if (data.name != null) {
        document.getElementById("employerEditName").value = data.name;
      } else {
        document.getElementById("employerEditName").value = '';
      }

      if (data.location != null) {
        document.getElementById("employerEditCity").value = data.location;
      } else {
        document.getElementById("employerEditCity").value = '';
      }

      if (data.type != null) {
        document.getElementById("employerEditType").value = data.type;
      } else {
        document.getElementById("employerEditType").value = '';
      }

      if (data.phone != null) {
        document.getElementById("employerEditPhone").value = data.phone;
      } else {
        document.getElementById("employerEditPhone").value = '';
      }

      if (data.email != null) {
        document.getElementById("employerEditEmail").value = data.email;
      } else {
        document.getElementById("employerEditEmail").value = '';
      }

      if (data.card != null) {
        document.getElementById("employerEditCard").value = data.card;
      } else {
        document.getElementById("employerEditCard").value = '';
      }

      if (data.description != null) {
        document.getElementById("employerEditDescription").value = data.description;
      } else {
        document.getElementById("employerEditDescription").value = '';
      }

    }
    request.send(null);
  }

  function employerProfileEditEnable () {
    document.getElementById("employerEditName").disabled = "";
    document.getElementById("employerEditCity").disabled = "";
    document.getElementById("employerEditType").disabled = "";
    document.getElementById("employerEditPhone").disabled = "";
    document.getElementById("employerEditEmail").disabled = "";
    document.getElementById("employerEditCard").disabled = "";
    document.getElementById("employerEditDescription").disabled = "";
  }

  function updateEmployerProfile () {
    let name = document.getElementById("employerEditName").value
    let location = document.getElementById("employerEditCity").value
    let type = document.getElementById("employerEditType").value
    let phone = document.getElementById("employerEditPhone").value
    let email = document.getElementById("employerEditEmail").value
    let card = document.getElementById("employerEditCard").value
    let description = document.getElementById("employerEditDescription").value

    const request = new XMLHttpRequest();
    request.open('POST', '${pageContext.request.contextPath}/employer/action/update/profile', true);
    request.setRequestHeader("Content-Type", "application/json; charset=UTF-8");
    request.setRequestHeader("Authorization", localStorage.getItem("token"))
    request.onload = function () {
      const data = JSON.parse(this.response);
      name = data.name;
      document.getElementById('employerEditName').disabled = true;
      location = data.location;
      document.getElementById('employerEditCity').disabled = true;
      type = data.type;
      document.getElementById('employerEditType').disabled = true;
      phone = data.phone;
      document.getElementById('employerEditPhone').disabled = true;
      email = data.email;
      document.getElementById('employerEditEmail').disabled = true;
      card = data.card;
      document.getElementById('employerEditCard').disabled = true;
      description = data.description;
      document.getElementById('employerEditDescription').disabled = true;
    }
    request.send(JSON.stringify({
      "name": name,
      "location": location,
      "type": type,
      "phone": phone,
      "email": email,
      "card": card,
      "description": description
    }))
  }

  function buttonJump (destination) {
    window.location.href = destination;
  }

</script>
</html>
