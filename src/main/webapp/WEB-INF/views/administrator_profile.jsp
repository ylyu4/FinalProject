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
      <p id="systemBalance"></p>
      <form>
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
        <table border="0" cellspacing="0" frame=below rules=rows id="jobList">
          <thead>
            <tr>
              <th></th>
              <th>Job ID</th>
              <th>Company</th>
              <th>Job Name</th>
              <th>Experience</th>
              <th>Location</th>
              <th>Salary</th>
              <th>Creator ID</th>
            </tr>
          </thead>
        </table>
        <button class="administrator_profile-bottom-button" type="button" name="administrator_profileTableView" onclick="viewJobs()">View</button>
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
    checkNewJobs();
    checkCurrentBalance();
  }

  function checkCurrentBalance() {
    const request = new XMLHttpRequest();
    request.open('GET', 'http://localhost:8080/admin/action/get/system-balance', true);
    request.setRequestHeader("Content-Type", "application/json; charset=UTF-8");
    request.setRequestHeader("Authorization", localStorage.getItem("token"));
    request.onload = function () {
      const data = JSON.parse(this.response);
      const element = document.getElementById("systemBalance");
      element.innerText = "Account Balance: " + data + " USD";
    }
    request.send();
  }

  function checkNewJobs() {
    const request = new XMLHttpRequest();
    request.open('GET', 'http://localhost:8080/admin/action/get/jobs', true);
    request.setRequestHeader("Content-Type", "application/json; charset=UTF-8");
    request.setRequestHeader("Authorization", localStorage.getItem("token"));
    request.onload = function () {
      const data = JSON.parse(this.response);
      const div = document.getElementById("jobList");
      if (data != null) {
        for (let i = 0; i < data.length; i++) {
         div.insertAdjacentHTML("beforeend", "<tr><td><input id='radio' type='radio' name='newJob' class='"+i+"'></td>"
                                              + " <td>"+data[i].id+"</td>"
                                              + " <td>"+data[i].company+"</td>"
                                              + " <td>"+data[i].name+"</td>"
                                              + " <td>"+data[i].experience+"</td>"
                                              + " <td>"+data[i].location+"</td>"
                                              + " <td>"+data[i].salary+"</td>"
                                              + " <td>"+data[i].createdBy+"</td></tr> ");
        }
      }
    }
    request.send(null);
  }

  function viewJobs() {
    const radios = document.getElementsByName("newJob");
    for (let i = 0; i < radios.length; i++) {
      if (radios[i].checked) {
        const tr = document.getElementsByTagName("tr")[i+1];
        const td = tr.getElementsByTagName("td")[1];
        console.log(td.innerHTML);
        localStorage.setItem("administratorViewJobId", td.innerHTML);
        buttonJump('http://localhost:8080/page/admin/view-job');
      } else {
        alert("Please select a job from the list!")
      }
    }
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

  function buttonJump(destination){
    window.location.href=destination;
  }

</script>
</html>
