<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="utf-8">
   <title>Administrator Profile</title>
   <link rel="stylesheet" type="text/css" href="../../static/css/reset.css" />
   <link rel="stylesheet" type="text/css" href="../../static/css/global.css" />
</head>
<body class="administrator_profile-body">
<div class="administrator_profile-div">
  <div class="administrator_profile-div-left">
      <h1>Administrator Profile</h1>
      <p>Account Balance: 1000000 USD</p>
      <form action="" method="">
        <div>
          <label class="administrator_profile-form-label" for="name">Name</label>
        </div>
        <div>
          <input id="administratorEditName" class="administrator_profile-form" type="text" name="administratorName"  disabled="disabled" value="" required>
        </div>
        <div>
          <label class="administrator_profile-form-label" for="phone">Phone</label>
        </div>
        <div>
          <input id="administratorEditPhone" class="administrator_profile-form" type="text" name="administratorPhone"  disabled="disabled" value="" required>
        </div>
        <div>
          <label class="administrator_profile-form-label" for="email">Email</label>
        </div>
        <div>
          <input id="administratorEditEmail" class="administrator_profile-form" type="text" name="administratorEmail"  disabled="disabled" value="" required>
        </div>
      </form>
      <button class="administrator_profile-top-button" type="button" name="administrator_profileEdit" onclick="administratorProfileEditEnable()">Edit</button>
      <button class="administrator_profile-top-button" type="button" name="administrator_profileSave" onclick="updateAdminProfile()">Save</button>
      <button class="administrator_profile-top-button" type="button" name="administrator_profileBack" onclick="buttonJump('http://localhost:8080/page/homepage')">Quit</button>
  </div>
  <div class="administrator_profile-div-middle">
      <h1>Review Job Post</h1>
      <div class="administrator_profile-table">
        <table border="0" cellspacing="0" frame=below rules=rows>
          <thead>
            <tr>
              <th></th>
              <th>Job ID</th>
              <th>Administrator ID</th>
              <th>Job Name</th>
              <th>Experience</th>
              <th>Location</th>
              <th>Salary</th>
            </tr>
          </thead>
          <div>
            <tr>
              <td><input id="radio" type="radio" name="job" value="00000001" checked></td>
              <td>00000001</td>
              <td>00000001</td>
              <td>Babysitter</td>
              <td>1 year experience</td>
              <td>DC</td>
              <td>5000</td>
            </tr>
            <tr>
              <td><input id="radio" type="radio" name="job" value="00000002" ></td>
              <td>00000002</td>
              <td>00000001</td>
              <td>Piano Teacher</td>
              <td>5 year experience</td>
              <td>MI</td>
              <td>25000</td>
            </tr>
            <tr>
              <td><input id="radio" type="radio" name="job" value="00000002" ></td>
              <td>00000002</td>
              <td>00000001</td>
              <td>Piano Teacher</td>
              <td>5 year experience</td>
              <td>MI</td>
              <td>25000</td>
            </tr>
            <tr>
              <td><input id="radio" type="radio" name="job" value="00000002" ></td>
              <td>00000002</td>
              <td>00000001</td>
              <td>Piano Teacher</td>
              <td>5 year experience</td>
              <td>MI</td>
              <td>25000</td>
            </tr>
            <tr>
              <td><input id="radio" type="radio" name="job" value="00000002" ></td>
              <td>00000002</td>
              <td>00000001</td>
              <td>Piano Teacher</td>
              <td>5 year experience</td>
              <td>MI</td>
              <td>25000</td>
            </tr>
            <tr>
              <td><input id="radio" type="radio" name="job" value="00000002" ></td>
              <td>00000002</td>
              <td>00000001</td>
              <td>Piano Teacher</td>
              <td>5 year experience</td>
              <td>MI</td>
              <td>25000</td>
            </tr>
            <tr>
              <td><input id="radio" type="radio" name="job" value="00000002" ></td>
              <td>00000002</td>
              <td>00000001</td>
              <td>Piano Teacher</td>
              <td>5 year experience</td>
              <td>MI</td>
              <td>25000</td>
            </tr>
            <tr>
              <td><input id="radio" type="radio" name="job" value="00000002" ></td>
              <td>00000002</td>
              <td>00000001</td>
              <td>Piano Teacher</td>
              <td>5 year experience</td>
              <td>MI</td>
              <td>25000</td>
            </tr>
            <tr>
              <td><input id="radio" type="radio" name="job" value="00000002" ></td>
              <td>00000002</td>
              <td>00000001</td>
              <td>Piano Teacher</td>
              <td>5 year experience</td>
              <td>MI</td>
              <td>25000</td>
            </tr>
            <tr>
              <td><input id="radio" type="radio" name="job" value="00000002" ></td>
              <td>00000002</td>
              <td>00000001</td>
              <td>Piano Teacher</td>
              <td>5 year experience</td>
              <td>MI</td>
              <td>25000</td>
            </tr>
            <tr>
              <td><input id="radio" type="radio" name="job" value="00000002" ></td>
              <td>00000002</td>
              <td>00000001</td>
              <td>Piano Teacher</td>
              <td>5 year experience</td>
              <td>MI</td>
              <td>25000</td>
            </tr>
          </div>
        </table>
        <button class="administrator_profile-bottom-button" type="button" name="administrator_profileTableView" onclick="buttonJump('administrator_view_job.html?JobID=00000002&administratorID=00000001')">View</button>
      </div>
  </div>
  <div class="administrator_profile-div-right">
      <h1>Payment History</h1>
      <div class="administrator_profile-table">
        <table border="1" cellspacing="0" frame=below rules=rows>
          <thead>
            <tr>
              <th>Job ID</th>
              <th>User ID</th>
              <th>Amount</th>
              <th>Date</th>
            </tr>
          </thead>
          <tbody>
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
            <tr>
              <td>00000002</td>
              <td>00000002</td>
              <td>+10000</td>
              <td>2020.02.19</td>
            </tr>
            <tr>
              <td>00000002</td>
              <td>00000002</td>
              <td>+10000</td>
              <td>2020.02.19</td>
            </tr>
            <tr>
              <td>00000002</td>
              <td>00000002</td>
              <td>+10000</td>
              <td>2020.02.19</td>
            </tr>
            <tr>
              <td>00000002</td>
              <td>00000002</td>
              <td>+10000</td>
              <td>2020.02.19</td>
            </tr>
            <tr>
              <td>00000002</td>
              <td>00000002</td>
              <td>+10000</td>
              <td>2020.02.19</td>
            </tr>
            <tr>
              <td>00000002</td>
              <td>00000002</td>
              <td>+10000</td>
              <td>2020.02.19</td>
            </tr>
            <tr>
              <td>00000002</td>
              <td>00000002</td>
              <td>+10000</td>
              <td>2020.02.19</td>
            </tr>
            <tr>
              <td>00000002</td>
              <td>00000002</td>
              <td>+10000</td>
              <td>2020.02.19</td>
            </tr>
            <tr>
              <td>00000002</td>
              <td>00000002</td>
              <td>+10000</td>
              <td>2020.02.19</td>
            </tr>
            <tr>
              <td>00000002</td>
              <td>00000002</td>
              <td>+10000</td>
              <td>2020.02.19</td>
            </tr>
            <tr>
              <td>00000002</td>
              <td>00000002</td>
              <td>+10000</td>
              <td>2020.02.19</td>
            </tr>
          </tbody>
        </table>
      </div>
  </div>
</div>
</body>

<script type="text/javascript">

  window.onload = function () {
    loadProfile();
  }

  function loadProfile() {
    const request = new XMLHttpRequest();
    request.open('GET', 'http://localhost:8080/admin/action/profile', true);
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
</script>
</html>
