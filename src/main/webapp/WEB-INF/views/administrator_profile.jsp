<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="utf-8">
   <title>Administrator Profile</title>
</head>
<body>

  <!-- Title Administrator Profile-->
  <h1>Administrator Profile</h1>
  <p>Account Balance: 1000000 USD</p>
  <form>
    <button type="button" name="administrator_profileEdit" onclick="administratorProfileEditEnable()">Edit</button>
    <input type="button" name="administrator_profileSave" value="Save" onclick="updateAdminProfile()"><br>
    Name:  <input id="administratorEditName"  type="text" name="administratorName"  disabled="disabled" value=""><br>
    Phone: <input id="administratorEditPhone" type="text" name="administratorPhone" disabled="disabled" value=""><br>
    Email: <input id="administratorEditEmail" type="text" name="administratorEmail" disabled="disabled" value=""><br>
  </form>

  <!-- Title Review Job Post-->
  <h1>Review Job Post</h1>
  <table border="1" cellspacing="0">
    <tr>
      <th>Job ID</th>
      <th>Employer ID</th>
      <th>Job Name</th>
      <th>Experience</th>
      <th>Location</th>
      <th>Salary</th>
      <th>Action</th>
    </tr>
    <tr>
      <td>00000001</td>
      <td>00000001</td>
      <td>Babysitter</td>
      <td>1 year experience</td>
      <td>DC</td>
      <td>5000</td>
      <td><button type="button" name="administrator_profileTableView" onclick="buttonJump('administrator_view_job.jsp?JobID=00000001&EmployerID=00000001')">View</button></td>
    </tr>
    <tr>
      <td>00000002</td>
      <td>00000001</td>
      <td>Piano Teacher</td>
      <td>5 year experience</td>
      <td>MI</td>
      <td>25000</td>
      <td><button type="button" name="administrator_profileTableView" onclick="buttonJump('administrator_view_job.jsp?JobID=00000002&EmployerID=00000001')">View</button></td>
    </tr>
  </table>

  <!-- Title Payment History-->
  <h1>Payment History</h1>
  <table border="1" cellspacing="0">
    <tr>
      <th>Job ID</th>
      <th>User ID</th>
      <th>Amount</th>
      <th>Date</th>
    </tr>
    <tr>
      <td>00000001</td>
      <td>00000001</td>
      <td>-5000</td>
      <td>2020.02.17</td>
    </tr>
    <tr>
      <td>00000002</td>
      <td>00000002</td>
      <td>+10000</td>
      <td>2020.02.19</td>
    </tr>
  </table>

  <!-- Button -->
  <button type="button" name="administrator_profileBack" onclick="buttonJump('main.jsp')">Return to main page...</button>

</body>

<script type="text/javascript">

  window.onload = function () {
    loadProfile();
  }

  function loadProfile() {
    const request = new XMLHttpRequest();
    request.open('GET', 'http://localhost:8080/admin/action/profile', true);
    request.setRequestHeader("Content-Type", "application/json; charset=UTF-8");
    request.setRequestHeader("Authorization", localStorage.getItem("adminToken"));
    request.onload = function () {
      const data = JSON.parse(this.response);
      if (data.name === null) {
        document.getElementById("administratorEditName").value = '';
      } else {
        document.getElementById("administratorEditName").value = data.name;
      }

      if (data.phone === null) {
        document.getElementById("administratorEditPhone").value = '';
      } else {
        document.getElementById("administratorEditPhone").value = data.phone;
      }

      if (data.email === null) {
        document.getElementById("administratorEditEmail").value = '';
      } else {
        document.getElementById("administratorEditEmail").value = data.email;
      }

    }
    request.send(null);
  }

  function administratorProfileEditEnable(){
    document.getElementById("administratorEditName"). disabled = "";
    document.getElementById("administratorEditPhone").disabled = "";
    document.getElementById("administratorEditEmail").disabled = "";
  }


  function updateAdminProfile() {
    let name = document.getElementById("administratorEditName").value
    let phone = document.getElementById("administratorEditPhone").value
    let email = document.getElementById("administratorEditEmail").value


    const request = new XMLHttpRequest();
    request.open('POST', 'http://localhost:8080/admin/action/update/profile', true);
    request.setRequestHeader("Content-Type", "application/json; charset=UTF-8");
    request.setRequestHeader("Authorization", localStorage.getItem("adminToken"))
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
</script>
</html>
