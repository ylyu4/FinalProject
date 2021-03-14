<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="utf-8">
   <title>Capstone Group A</title>
</head>
<body>

  <!-- Title Employer Profile-->
  <h1>Employer Profile</h1>
  <p>Account Balance: 1000000 USD<button type="button" name="employer_profileDeposit" onclick="buttonJump('employer_deposit.jsp')">Deposit</button></p>
  <form>
    <button type="button" name="employer_profileEdit" onclick="employerProfileEditEnable()">Edit</button>
    <input type="button" name="employer_profileSave" value="Save" onclick="updateEmployerProfile()"><br>
    Name:        <input id="employerEditName"        type="text" name="employerName"        disabled="disabled" ><br>
    Location:    <input id="employerEditLocation"        type="text" name="employerCity"        disabled="disabled" ><br>
    Type:        <input id="employerEditType"        type="text" name="employerType"        disabled="disabled" ><br>
    Phone:       <input id="employerEditPhone"       type="text" name="employerPhone"       disabled="disabled" ><br>
    Email:       <input id="employerEditEmail"       type="text" name="employerEmail"       disabled="disabled" ><br>
    Description: <input id="employerEditDescription" type="text" name="employerDescription" disabled="disabled" ><br>
  </form>

  <!-- Title Job Posted-->
  <h1>Job Posted</h1>
  <button type="button" name="employer_profilePostNewJob" onclick="buttonJump('http://localhost:8080/page/employer/create/job')">Post New Job</button>
  <table border="1" cellspacing="0">
    <tr>
      <th>Job ID</th>
      <th>Job Name</th>
      <th>Experience</th>
      <th>Location</th>
      <th>Salary</th>
      <th>Status</th>
      <th>Actions</th>
    </tr>
    <tr>
      <td>00000001</td>
      <td>Babysitter</td>
      <td>1 year experience</td>
      <td>DC</td>
      <td>5000</td>
      <td>Admin Reviewing</td>
      <td>
        <button type="button" name="employer_profileTableApplicants" onclick="buttonJump('employer_applicants_list.jsp?JobID=00000001')">Applicants</button>
        <button type="button" name="employer_profileTableDetails"    onclick="buttonJump('employer_view_posted_job_details.jsp?JobID=00000001')">Details</button>
        <button type="button" name="employer_profileTablePrepay"     onclick="employerPrepay('00000001')">Prepay</button>
        <button type="button" name="employer_profileTableDelete"     onclick="employerProfileDelete('00000001')">Delete</button>
        <button type="button" name="employer_profileTableConfirm"    onclick="employerConfirmWork('00000001')">Confirm</button>
      </td>
    </tr>
    <tr>
      <td>00000002</td>
      <td>Piano Teacher</td>
      <td>5 year experience</td>
      <td>MI</td>
      <td>25000</td>
      <td>Completed</td>
      <td>
        <!-- XXXXXXXXXXXXXXXXXXXXX -->
        <!-- XXXXXXXXXXXXXXXXXXXXX -->
        <!-- XXXXXXXXXXXXXXXXXXXXX -->
        <!-- XXXXXXXXXXXXXXXXXXXXX -->
        <!-- XXXXXXXXXXXXXXXXXXXXX -->
        <!-- XXXXXXXXXXXXXXXXXXXXX -->
      </td>
    </tr>
  </table>

  <!-- Button -->
  <button type="button" name="employer_profileReturn"         onclick="buttonJump('http://localhost:8080/page/homepage')">Return to main page</button>
  <button type="button" name="employer_profilePaymentHistory" onclick="buttonJump('employer_payment_history.jsp')">Payment History</button>

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
        document.getElementById("employerEditLocation").value = data.location;
      } else {
        document.getElementById("employerEditLocation").value = '';
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
    document.getElementById("employerEditLocation").disabled = "";
    document.getElementById("employerEditType").disabled = "";
    document.getElementById("employerEditPhone"). disabled = "";
    document.getElementById("employerEditEmail").disabled = "";
    document.getElementById("employerEditDescription").disabled = "";
  }


  function updateEmployerProfile() {
    let name = document.getElementById("employerEditName").value
    let location = document.getElementById("employerEditLocation").value
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
      document.getElementById('employerEditLocation').disabled = true;
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
