<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="utf-8">
   <title>Employer Profile</title>
   <link rel="stylesheet" href="reset.css" />
   <link rel="stylesheet" href="global.css" />
</head>
<body class="employer_profile-body">
  <div class="employer_profile-div">
    <div class="employer_profile-div-left">
      <h1>Employer Profile</h1>
      <p>Account Balance: 10000 USD</p>
      <div>
        <button class="employer_profile-top-button-deposit" type="button" name="employer_profileDeposit" onclick="buttonJump('employer_deposit.html')">Deposit</button>
      </div>
      <div>
        <button class="employer_profile-top-button-paymentHistory" type="button" name="employer_profilePaymentHistory" onclick="buttonJump('employer_payment_history.html')">Payment History</button>
      </div>
      <form action="">
        <div>
          <label class="employer_profile-form-label" for="name">Name</label>
        </div>
        <div>
          <input id="employerEditName" class="employer_profile-form" type="text" name="employerName" disabled="disabled" value="" required>
        </div>
        <div>
          <label class="employer_profile-form-label" for="city">City</label>
        </div>
        <div>
          <input id="employerEditCity" class="employer_profile-form" type="text" name="employerCity" disabled="disabled" value="" required>
        </div>
        <div>
          <label class="employer_profile-form-label" for="type">Type</label>
        </div>
        <div>
          <input id="employerEditType" class="employer_profile-form" type="text" name="employerType" disabled="disabled" value="" required>
        </div>
        <div>
          <label class="employer_profile-form-label" for="phone">Phone</label>
        </div>
        <div>
          <input id="employerEditPhone" class="employer_profile-form" type="text" name="employerPhone" disabled="disabled" value="" required>
        </div>
        <div>
          <label class="employer_profile-form-label" for="email">Email</label>
        </div>
        <div>
          <input id="employerEditEmail" class="employer_profile-form" type="text" name="employerEmail" disabled="disabled" value="" required>
        </div>
        <div>
          <label class="employer_profile-form-label" for="description">Description</label>
        </div>
        <div>
          <textarea id="employerEditDescription" disabled="disabled" required></textarea>
        </div>
      </form>
      <button class="employer_profile-top-button" type="button" name="employer_profileEdit" onclick="employerProfileEditEnable()">Edit</button>
      <button class="employer_profile-top-button" type="button" name="employer_profileSave" value="Save" onclick="updateEmployerProfile()">Save</button>
      <button class="employer_profile-top-button" type="button" name="employer_profileQuit" onclick="buttonJump('http://localhost:8080/page/homepage')">Quit</button>
    </div>
    <div class="employer_profile-div-right">
      <h1>Job Posted</h1>
      <div>
        <button class="employer_profile-top-button-postNewJob" type="button" name="employer_profilePostNewJob" onclick="buttonJump('http://localhost:8080/page/employer/create/job')">Post New Job</button>
      </div>
      <div>
        <button class="employer_profile-right-button-Application" type="button" name="employer_profileTableApplicants" onclick="buttonJump('employer_applicants_list.html?JobID=00000001')">Applicants</button>
        <button class="employer_profile-right-button" type="button" name="employer_profileTableDetails"    onclick="buttonJump('employer_view_posted_job_details.html?JobID=00000001')">Details</button>
        <button class="employer_profile-right-button" type="button" name="employer_profileTablePrepay"     onclick="employerPrepay('00000001')">Prepay</button>
        <button class="employer_profile-right-button" type="button" name="employer_profileTableDelete"     onclick="employerProfileDelete('00000001')">Delete</button>
        <button class="employer_profile-right-button" type="button" name="employer_profileTableConfirm"    onclick="employerConfirmWork('00000001')">Confirm</button>
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
        </tr>
        <tr>
          <td><input id="radio" type="radio" name="job" value="00000001" checked></td>
          <td>00000001</td>
          <td>Babysitter</td>
          <td>1 year experience</td>
          <td>DC</td>
          <td>5000</td>
          <td>Admin Reviewing</td>
        </tr>
        <tr>
          <td><input type="radio" name="job" value="00000001"></td>
          <td>00000001</td>
          <td>Babysitter</td>
          <td>1 year experience</td>
          <td>DC</td>
          <td>5000</td>
          <td>Admin Reviewing</td>
        </tr>
        <tr>
          <td><input type="radio" name="job" value="00000001"></td>
          <td>00000001</td>
          <td>Babysitter</td>
          <td>1 year experience</td>
          <td>DC</td>
          <td>5000</td>
          <td>Admin Reviewing</td>
        </tr>
        <tr>
          <td><input type="radio" name="job" value="00000001"></td>
          <td>00000001</td>
          <td>Babysitter</td>
          <td>1 year experience</td>
          <td>DC</td>
          <td>5000</td>
          <td>Admin Reviewing</td>
        </tr>
        <tr>
          <td><input type="radio" name="job" value="00000001"></td>
          <td>00000001</td>
          <td>Babysitter</td>
          <td>1 year experience</td>
          <td>DC</td>
          <td>5000</td>
          <td>Admin Reviewing</td>
        </tr>
        <tr>
          <td><input type="radio" name="job" value="00000001"></td>
          <td>00000001</td>
          <td>Babysitter</td>
          <td>1 year experience</td>
          <td>DC</td>
          <td>5000</td>
          <td>Admin Reviewing</td>
        </tr>
        <tr>
          <td><input type="radio" name="job" value="00000001"></td>
          <td>00000001</td>
          <td>Babysitter</td>
          <td>1 year experience</td>
          <td>DC</td>
          <td>5000</td>
          <td>Admin Reviewing</td>
        </tr>
        <tr>
          <td><input type="radio" name="job" value="00000001"></td>
          <td>00000001</td>
          <td>Babysitter</td>
          <td>1 year experience</td>
          <td>DC</td>
          <td>5000</td>
          <td>Admin Reviewing</td>
        </tr>
        <tr>
          <td><input type="radio" name="job" value="00000001"></td>
          <td>00000001</td>
          <td>Babysitter</td>
          <td>1 year experience</td>
          <td>DC</td>
          <td>5000</td>
          <td>Admin Reviewing</td>
        </tr>
        <tr>
          <td><input type="radio" name="job" value="00000001"></td>
          <td>00000001</td>
          <td>Babysitter</td>
          <td>1 year experience</td>
          <td>DC</td>
          <td>5000</td>
          <td>Admin Reviewing</td>
        </tr>
        <tr>
          <td><input type="radio" name="job" value="00000001"></td>
          <td>00000001</td>
          <td>Babysitter</td>
          <td>1 year experience</td>
          <td>DC</td>
          <td>5000</td>
          <td>Admin Reviewing</td>
        </tr>
        <tr>
          <td><input type="radio" name="job" value="00000001"></td>
          <td>00000001</td>
          <td>Babysitter</td>
          <td>1 year experience</td>
          <td>DC</td>
          <td>5000</td>
          <td>Admin Reviewing</td>
        </tr>
        <tr>
          <td><input type="radio" name="job" value="00000001"></td>
          <td>00000001</td>
          <td>Babysitter</td>
          <td>1 year experience</td>
          <td>DC</td>
          <td>5000</td>
          <td>Admin Reviewing</td>
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
    request.open('GET', 'http://localhost:8080/employer/action/profile', true);
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

      if (data.description != null) {
        document.getElementById("employerEditDescription").value = data.description;
      } else {
        document.getElementById("employerEditDescription").value = '';
      }

    }
    request.send(null);
  }

  function employerProfileEditEnable(){
    document.getElementById("employerEditName"). disabled = "";
    document.getElementById("employerEditCity").disabled = "";
    document.getElementById("employerEditType").disabled = "";
    document.getElementById("employerEditPhone"). disabled = "";
    document.getElementById("employerEditEmail").disabled = "";
    document.getElementById("employerEditDescription").disabled = "";
  }


  function updateEmployerProfile() {
    let name = document.getElementById("employerEditName").value
    let location = document.getElementById("employerEditCity").value
    let type = document.getElementById("employerEditType").value
    let phone = document.getElementById("employerEditPhone").value
    let email = document.getElementById("employerEditEmail").value
    let description = document.getElementById("employerEditDescription").value



    const request = new XMLHttpRequest();
    request.open('POST', 'http://localhost:8080/employer/action/update/profile', true);
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
      description = data.description;
      document.getElementById('employerEditDescription').disabled = true;
    }
    request.send(JSON.stringify({
      "name": name,
      "location": location,
      "type": type,
      "phone": phone,
      "email": email,
      "description": description
    }))
  }

  function buttonJump(destination){
    window.location.href=destination;
  }

</script>
</html>