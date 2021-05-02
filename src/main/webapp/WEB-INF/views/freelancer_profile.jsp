<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Freelancer Profile</title>
    <link rel="stylesheet" href="../../static/css/reset.css"/>
    <link rel="stylesheet" href="../../static/css/global.css"/>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Fredoka+One&display=swap" rel="stylesheet">
</head>
<body class="freelancer_profile-body">
<div class="header">
    <p class="systemTitle">Job Search System</p>
</div>
<div class="freelancer_personal_information">
    <h1 id="freelancer_profile_title">Personal Information</h1>
    <div>
        <label class="freelancer_profile-form-label" for="name">Name</label>
    </div>
    <div>
        <input id="freelancerEditName" class="freelancer_profile-form" type="text" name="freelancerName"
               disabled="disabled" value="" required>
    </div>
    <div>
        <label class="freelancer_profile-form-label" for="age">Age</label>
    </div>
    <div>
        <input id="freelancerEditAge" class="freelancer_profile-form" type="text" name="freelancerAge"
               disabled="disabled" value="" required>
    </div>
    <div>
        <label class="freelancer_profile-form-label" for="location">Location</label>
    </div>
    <div>
        <input id="freelancerEditLocation" class="freelancer_profile-form" type="text" name="freelancerLocation"
               disabled="disabled" value="" required>
    </div>
    <div>
        <label class="freelancer_profile-form-label" for="phone">Phone</label>
    </div>
    <div>
        <input id="freelancerEditPhone" class="freelancer_profile-form" type="text" name="freelancerPhone"
               disabled="disabled" value="" required>
    </div>
    <div>
        <label class="freelancer_profile-form-label" for="email">Email</label>
    </div>
    <div>
        <input id="freelancerEditEmail" class="freelancer_profile-form" type="text" name="freelancerEmail"
               disabled="disabled" value="" required>
    </div>
    <div>
        <label class="freelancer_profile-form-label" for="school">School</label>
    </div>
    <div>
        <input id="freelancerEditSchool" class="freelancer_profile-form" type="text" name="freelancerSchool"
               disabled="disabled" value="" required>
    </div>
    <div>
        <label class="freelancer_profile-form-label" for="card">Card</label>
    </div>
    <div>
        <input id="freelancerEditCard" class="freelancer_profile-form" type="text" name="freelancerCard"
               disabled="disabled" value="" required>
    </div>
    <button class="freelancer_profile-bottom-button" type="button" name="freelancer_profileEdit"
            onclick="freelancerProfileEditEnable()">Edit
    </button>
    <button class="freelancer_profile-bottom-button" type="button" name="freelancer_profileSave" value="Save"
            onclick="updateFreelancerProfile()">Save
    </button>
    <button class="freelancer_profile-bottom-button" type="button" name="freelancer_profileQuit"
            onclick="buttonJump('${pageContext.request.contextPath}/page/freelancer/job')">Back
    </button>
</div>
</body>

<script type="text/javascript">
  window.onload = function () {
    loadProfile();
  }

  function loadProfile () {
    const request = new XMLHttpRequest();
    request.open('GET', '${pageContext.request.contextPath}/freelancer/action/profile', true);
    request.setRequestHeader("Content-Type", "application/json; charset=UTF-8");
    request.setRequestHeader("Authorization", localStorage.getItem("token"));
    request.onload = function () {
      const data = JSON.parse(this.response);
      if (data.name != null) {
        document.getElementById("freelancerEditName").value = data.name;
      } else {
        document.getElementById("freelancerEditName").value = '';
      }

      if (data.age != null) {
        document.getElementById("freelancerEditAge").value = data.age;
      } else {
        document.getElementById("freelancerEditAge").value = '';
      }

      if (data.location != null) {
        document.getElementById("freelancerEditLocation").value = data.location;
      } else {
        document.getElementById("freelancerEditLocation").value = '';
      }

      if (data.phone != null) {
        document.getElementById("freelancerEditPhone").value = data.phone;
      } else {
        document.getElementById("freelancerEditPhone").value = '';
      }

      if (data.email != null) {
        document.getElementById("freelancerEditEmail").value = data.email;
      } else {
        document.getElementById("freelancerEditEmail").value = '';
      }

      if (data.school != null) {
        document.getElementById("freelancerEditSchool").value = data.school;
      } else {
        document.getElementById("freelancerEditSchool").value = '';
      }

      if (data.card != null) {
        document.getElementById("freelancerEditCard").value = data.card;
      } else {
        document.getElementById("freelancerEditCard").value = '';
      }

      if (data.accountBalance != null) {
        document.getElementById("freelancerAccountBalance").value = data.accountBalance;
      } else {
        document.getElementById("freelancerAccountBalance").value = '0';
      }

    }
    request.send(null);
  }

  function freelancerProfileEditEnable () {
    document.getElementById("freelancerEditName").disabled = "";
    document.getElementById("freelancerEditAge").disabled = "";
    document.getElementById("freelancerEditLocation").disabled = "";
    document.getElementById("freelancerEditPhone").disabled = "";
    document.getElementById("freelancerEditEmail").disabled = "";
    document.getElementById("freelancerEditSchool").disabled = "";
    document.getElementById("freelancerEditCard").disabled = "";
  }

  function updateFreelancerProfile () {
    let name = document.getElementById("freelancerEditName").value
    let age = document.getElementById("freelancerEditAge").value
    let location = document.getElementById("freelancerEditLocation").value
    let phone = document.getElementById("freelancerEditPhone").value
    let email = document.getElementById("freelancerEditEmail").value
    let school = document.getElementById("freelancerEditSchool").value
    let card = document.getElementById("freelancerEditCard").value

    const request = new XMLHttpRequest();
    request.open('POST', '${pageContext.request.contextPath}/freelancer/action/update/profile', true);
    request.setRequestHeader("Content-Type", "application/json; charset=UTF-8");
    request.setRequestHeader("Authorization", localStorage.getItem("token"))
    request.onload = function () {
      const data = JSON.parse(this.response);
      name = data.name;
      document.getElementById('freelancerEditName').disabled = true;
      age = data.age;
      document.getElementById('freelancerEditAge').disabled = true;
      location = data.location;
      document.getElementById('freelancerEditLocation').disabled = true;
      phone = data.phone;
      document.getElementById('freelancerEditPhone').disabled = true;
      email = data.email;
      document.getElementById('freelancerEditEmail').disabled = true;
      school = data.school;
      document.getElementById('freelancerEditSchool').disabled = true;
      card = data.card;
      document.getElementById('freelancerEditCard').disabled = true;
    }
    request.send(JSON.stringify({
      "name": name,
      "age": age,
      "location": location,
      "phone": phone,
      "email": email,
      "school": school,
      "card": card
    }))
  }

  function buttonJump(destination){
    window.location.href=destination;
  }
</script>
</html>