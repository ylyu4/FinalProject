<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="utf-8">
   <title>Freelancer Profile</title>
   <link rel="stylesheet" type="text/css" href="../../static/css/reset.css" />
   <link rel="stylesheet" type="text/css" href="../../static/css/global.css" />
</head>
<body class="freelancer_profile-body">
  <div class="freelancer_profile-div">
    <div class="freelancer_profile-div-left">
      <h1>Freelancer Profile</h1>
      <p>Account Balance: 2000 USD</p>
      <div>
        <button class="freelancer_profile-top-button" type="button" name="freelancer_profileWithdraw" onclick="buttonJump('freelancer_withdraw.html')">Withdraw</button>
      </div>
      <div>
        <button class="freelancer_profile-top-button" type="button" name="freelancer_profilePaymentHistory" onclick="buttonJump('freelancer_remuneration_history.html')">Remuneration History</button>
      </div>
      <div>
        <button class="freelancer_profile-top-button" type="button" name="freelancer_profileViewResume" onclick="buttonJump('freelancer_view_resume.html')">View Resume</button>
      </div>
      <form action="">
        <div>
          <label class="freelancer_profile-form-label" for="name">Name</label>
        </div>
        <div>
          <input id="freelancerEditName" class="freelancer_profile-form" type="text" name="freelancerName" disabled="disabled" value="" required>
        </div><div>
          <label class="freelancer_profile-form-label" for="age">Age</label>
        </div>
        <div>
          <input id="freelancerEditAge" class="freelancer_profile-form" type="text" name="freelancerAge" disabled="disabled" value="" required>
        </div>
        <div>
          <label class="freelancer_profile-form-label" for="location">Location</label>
        </div>
        <div>
          <input id="freelancerEditLocation" class="freelancer_profile-form" type="text" name="freelancerLocation" disabled="disabled" value="" required>
        </div>
        <div>
          <label class="freelancer_profile-form-label" for="phone">Phone</label>
        </div>
        <div>
          <input id="freelancerEditPhone" class="freelancer_profile-form" type="text" name="freelancerPhone" disabled="disabled" value="" required>
        </div>
        <div>
          <label class="freelancer_profile-form-label" for="email">Email</label>
        </div>
        <div>
          <input id="freelancerEditEmail" class="freelancer_profile-form" type="text" name="freelancerEmail" disabled="disabled" value="" required>
        </div>
        <div>
          <label class="freelancer_profile-form-label" for="school">School</label>
        </div>
        <div>
          <input id="freelancerEditSchool" class="freelancer_profile-form" type="text" name="freelancerSchool" disabled="disabled" value="" required>
        </div>
        <div>
          <label class="freelancer_profile-form-label" for="card">Card</label>
        </div>
        <div>
          <input id="freelancerEditCard" class="freelancer_profile-form" type="text" name="freelancerCard" disabled="disabled" value="" required>
        </div>
      </form>
      <button class="freelancer_profile-bottom-button" type="button" name="freelancer_profileEdit" onclick="freelancerProfileEditEnable()">Edit</button>
      <button class="freelancer_profile-bottom-button" type="button" name="freelancer_profileSave" value="Save" onclick="updateFreelancerProfile()">Save</button>
      <button class="freelancer_profile-bottom-button" type="button" name="freelancer_profileQuit" onclick="buttonJump('http://localhost:8080/page/homepage')">Quit</button>
    </div>
    <div class="freelancer_profile-div-right">
      <h1>Job Applied</h1>
      <button class="freelancer_profile-top-button-browseJobs" type="button" name="freelancer_profileBrowseJobs" onclick="buttonJump('freelancer_browse_jobs.html')">Browse Jobs</button>
      <div>
        <button class="freelancer_profile-right-button" type="button" name="freelancer_profileTableDetails"  onclick="buttonJump('freelancer_browse_applied_jobs_details.html')">Details</button>
        <button class="freelancer_profile-right-button" type="button" name="freelancer_profileTableDelete"   onclick="freelancerProfileDelete('00000001')">Delete</button>
        <button class="freelancer_profile-right-button" type="button" name="freelancer_profileTableStart"    onclick="freelancerProfileStartWork('00000001')">Start Work</button>
        <button class="freelancer_profile-right-button" type="button" name="freelancer_profileTableComplete" onclick="freelancerProfileCompleteWork('00000001')">Complete Work</button>
      </div>
      <table border="0" cellspacing="0" frame=below rules=rows>
        <tr>
          <th></th>
          <th>Job ID</th>
          <th>Job Name</th>
          <th>Experience</th>
          <th>Location</th>
          <th>Salary</th>
          <th>Status</th>
          <th>Prepay</th>
        </tr>
        <tr>
          <td><input id="radio" type="radio" name="job" value="00000001" checked></td>
          <td>00000001</td>
          <td>Babysitter</td>
          <td>1 year experience</td>
          <td>DC</td>
          <td>5000</td>
          <td>Reviewing Resume</td>
          <td>Unpaid</td>
        </tr>
        <tr>
          <td><input id="radio" type="radio" name="job" value="00000001"></td>
          <td>00000002</td>
          <td>Piano Teacher</td>
          <td>5 year experience</td>
          <td>MI</td>
          <td>25000</td>
          <td>Completed</td>
          <td>Paid</td>
        </tr>
        <tr>
          <td><input id="radio" type="radio" name="job" value="00000001"></td>
          <td>00000002</td>
          <td>Piano Teacher</td>
          <td>5 year experience</td>
          <td>MI</td>
          <td>25000</td>
          <td>Completed</td>
          <td>Paid</td>
        </tr>
        <tr>
          <td><input id="radio" type="radio" name="job" value="00000001"></td>
          <td>00000002</td>
          <td>Piano Teacher</td>
          <td>5 year experience</td>
          <td>MI</td>
          <td>25000</td>
          <td>Completed</td>
          <td>Paid</td>
        </tr>
        <tr>
          <td><input id="radio" type="radio" name="job" value="00000001"></td>
          <td>00000002</td>
          <td>Piano Teacher</td>
          <td>5 year experience</td>
          <td>MI</td>
          <td>25000</td>
          <td>Completed</td>
          <td>Paid</td>
        </tr>
        <tr>
          <td><input id="radio" type="radio" name="job" value="00000001"></td>
          <td>00000002</td>
          <td>Piano Teacher</td>
          <td>5 year experience</td>
          <td>MI</td>
          <td>25000</td>
          <td>Completed</td>
          <td>Paid</td>
        </tr>
        <tr>
          <td><input id="radio" type="radio" name="job" value="00000001"></td>
          <td>00000002</td>
          <td>Piano Teacher</td>
          <td>5 year experience</td>
          <td>MI</td>
          <td>25000</td>
          <td>Completed</td>
          <td>Paid</td>
        </tr>
        <tr>
          <td><input id="radio" type="radio" name="job" value="00000001"></td>
          <td>00000002</td>
          <td>Piano Teacher</td>
          <td>5 year experience</td>
          <td>MI</td>
          <td>25000</td>
          <td>Completed</td>
          <td>Paid</td>
        </tr>
        <tr>
          <td><input id="radio" type="radio" name="job" value="00000001"></td>
          <td>00000002</td>
          <td>Piano Teacher</td>
          <td>5 year experience</td>
          <td>MI</td>
          <td>25000</td>
          <td>Completed</td>
          <td>Paid</td>
        </tr>
      </table>
    </div>
  </div>
</body>

<script type="text/javascript">

  window.onload = function () {
    loadProfile();
  }

  function loadProfile() {
    const request = new XMLHttpRequest();
    request.open('GET', 'http://localhost:8080/freelancer/action/profile', true);
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

    }
    request.send(null);
  }

  function freelancerProfileEditEnable(){
    document.getElementById("freelancerEditName"). disabled = "";
    document.getElementById("freelancerEditAge").disabled = "";
    document.getElementById("freelancerEditLocation").disabled = "";
    document.getElementById("freelancerEditPhone"). disabled = "";
    document.getElementById("freelancerEditEmail").disabled = "";
    document.getElementById("freelancerEditSchool").disabled = "";
    document.getElementById("freelancerEditCard").disabled = "";
  }


  function updateFreelancerProfile() {
    let name = document.getElementById("freelancerEditName").value
    let age = document.getElementById("freelancerEditAge").value
    let location = document.getElementById("freelancerEditLocation").value
    let phone = document.getElementById("freelancerEditPhone").value
    let email = document.getElementById("freelancerEditEmail").value
    let school = document.getElementById("freelancerEditSchool").value
    let card = document.getElementById("freelancerEditCard").value



    const request = new XMLHttpRequest();
    request.open('POST', 'http://localhost:8080/freelancer/action/update/profile', true);
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
