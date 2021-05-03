<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Administrator Profile</title>
    <link rel="stylesheet" type="text/css" href="../../static/css/reset.css"/>
    <link rel="stylesheet" type="text/css" href="../../static/css/global.css"/>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Fredoka+One&display=swap" rel="stylesheet">
</head>
<body class="administrator_profile-body">
<div class="header">
    <p class="systemTitle">Job Search System</p>
</div>
<div class="administrator_profile-div">
    <div class="administrator_personal_information">
        <h1 id="admin_profile_title">Administrator Personal Information</h1>
        <form>
            <div>
                <label class="administrator_profile-form-label" for="name">Name</label>
            </div>
            <div>
                <input id="administratorEditName" class="administrator_profile-form" type="text"
                       name="administratorName" disabled="disabled" value="" required>
            </div>
            <div>
                <label class="administrator_profile-form-label" for="phone">Phone</label>
            </div>
            <div>
                <input id="administratorEditPhone" class="administrator_profile-form" type="text"
                       name="administratorPhone" disabled="disabled" value="" required>
            </div>
            <div>
                <label class="administrator_profile-form-label" for="email">Email</label>
            </div>
            <div>
                <input id="administratorEditEmail" class="administrator_profile-form" type="text"
                       name="administratorEmail" disabled="disabled" value="" required>
            </div>
        </form>
        <button class="administrator_profile-top-button" type="button" name="administrator_profileEdit"
                onclick="administratorProfileEditEnable()">Edit
        </button>
        <button class="administrator_profile-top-button" type="button" name="administrator_profileSave"
                onclick="updateAdminProfile()">Save
        </button>
        <button class="administrator_profile-top-button" type="button" name="administrator_profileBack"
                onclick="buttonJump('${pageContext.request.contextPath}/page/admin/job')">Back
        </button>
    </div>
</div>
</body>

<script type="text/javascript">

  window.onload = function () {
    loadProfile();
  }

  function loadProfile () {
    const request = new XMLHttpRequest();
    request.open('GET', '${pageContext.request.contextPath}/admin/action/profile', true);
    request.setRequestHeader("Content-Type", "application/json; charset=UTF-8");
    request.setRequestHeader("Authorization", localStorage.getItem("token"));
    request.onload = function () {
      const data = JSON.parse(this.response);
      if (data.name != null) {
        document.getElementById("administratorEditName").value = data.name;
      } else {
        document.getElementById("administratorEditName").value = '';
      }

      if (data.phone != null) {
        document.getElementById("administratorEditPhone").value = data.phone;
      } else {
        document.getElementById("administratorEditPhone").value = '';
      }

      if (data.email != null) {
        document.getElementById("administratorEditEmail").value = data.email;
      } else {
        document.getElementById("administratorEditEmail").value = '';
      }

    }
    request.send(null);
  }

  function administratorProfileEditEnable () {
    document.getElementById("administratorEditName").disabled = "";
    document.getElementById("administratorEditPhone").disabled = "";
    document.getElementById("administratorEditEmail").disabled = "";
  }

  function updateAdminProfile () {
    let name = document.getElementById("administratorEditName").value
    let phone = document.getElementById("administratorEditPhone").value
    let email = document.getElementById("administratorEditEmail").value

    const request = new XMLHttpRequest();
    request.open('POST', '${pageContext.request.contextPath}/admin/action/update/profile', true);
    request.setRequestHeader("Content-Type", "application/json; charset=UTF-8");
    request.setRequestHeader("Authorization", localStorage.getItem("token"))
    request.onload = function () {
      const data = JSON.parse(this.response);
      name = data.name;
      document.getElementById('administratorEditName').disabled = true;
      phone = data.phone;
      document.getElementById('administratorEditPhone').disabled = true;
      email = data.email;
      document.getElementById('administratorEditEmail').disabled = true;
    }
    request.send(JSON.stringify({
      "name": name,
      "phone": phone,
      "email": email
    }))
  }

  function buttonJump (destination) {
    window.location.href = destination;
  }

</script>
</html>
