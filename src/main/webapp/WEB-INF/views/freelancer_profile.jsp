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
      <p id="freelancerAccountBalance"></p>
      <div>
        <button class="freelancer_profile-top-button" type="button" name="freelancer_profileWithdraw" onclick="buttonJump('http://localhost:8080/page/freelancer/withdraw')">Withdraw</button>
      </div>
      <div>
        <button class="freelancer_profile-top-button" type="button" name="freelancer_profilePaymentHistory" onclick="buttonJump('http://localhost:8080/page/freelancer/remuneration/history')">Remuneration History</button>
      </div>
      <div>
        <button class="freelancer_profile-top-button" type="button" name="freelancer_profileViewResume" onclick="buttonJump('http://localhost:8080/page/freelancer/view-resume')">View Resume</button>
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
      <button class="freelancer_profile-top-button-browseJobs" type="button" name="freelancer_profileBrowseJobs" onclick="buttonJump('http://localhost:8080/page/freelancer/browse-jobs')">Browse Jobs</button>
      <div>
        <button class="freelancer_profile-right-button" type="button" name="freelancer_profileTableDetails"  onclick="buttonJump('http://localhost:8080/page/freelancer/view/applied-job-details')">Details</button>
        <button class="freelancer_profile-right-button" type="button" name="freelancer_profileTableAccept"   onclick="acceptOfferOrInterview()">Accept</button>
        <button class="freelancer_profile-right-button" type="button" name="freelancer_profileTableDecline"   onclick="rejectOfferOrInterview()">Decline</button>
        <button class="freelancer_profile-right-button" type="button" name="freelancer_profileTableStart"    onclick="startWork()">Start Work</button>
        <button class="freelancer_profile-bottom-button-completeWork" type="button" name="freelancer_profileTableComplete" onclick="completeWork()">Complete Work</button>
      </div>
      <table border="0" cellspacing="0" frame=below rules=rows id="appliedJobs">
        <tr>
          <th></th>
          <th>Job ID</th>
          <th>Job Name</th>
          <th>Experience</th>
          <th>Location</th>
          <th>Salary</th>
          <th>Status</th>
          <th>Paid</th>
        </tr>
      </table>
    </div>
  </div>
</body>

<script type="text/javascript">

  window.onload = function () {
    loadProfile();
    loadAppliedJobs();
  }

  function loadAppliedJobs() {
    const request = new XMLHttpRequest();
    request.open('GET', 'http://localhost:8080/freelancer/action/get/applied-jobs', true);
    request.setRequestHeader("Content-Type", "application/json; charset=UTF-8");
    request.setRequestHeader("Authorization", localStorage.getItem("token"));
    request.onload = function () {
      const jobList = JSON.parse(this.response);
      const listTable = document.getElementById("appliedJobs");
      if (jobList != null) {
        for (let i = 0; i < jobList.length; i++) {
          let paidFlag = 'No';
          if (jobList[i].paid === true) {
            paidFlag = 'Yes';
          }
          listTable.insertAdjacentHTML("beforeend", "<tr><td><input id='radio' type='radio' name='appliedJob'></td>"
                  + " <td>" + jobList[i].id + "</td>"
                  + " <td>" + jobList[i].name + "</td>"
                  + " <td>" + jobList[i].experience + "</td>"
                  + " <td>" + jobList[i].location + "</td>"
                  + " <td>" + jobList[i].salary + "</td>"
                  + " <td>" + jobList[i].status + "</td>"
                  + " <td>" + paidFlag + "</td></tr> ");
        }
      }
    }
    request.send();
  }

  function loadProfile() {
    const request = new XMLHttpRequest();
    request.open('GET', 'http://localhost:8080/freelancer/action/profile', true);
    request.setRequestHeader("Content-Type", "application/json; charset=UTF-8");
    request.setRequestHeader("Authorization", localStorage.getItem("token"));
    request.onload = function () {
      const data = JSON.parse(this.response);
      document.getElementById("freelancerAccountBalance").innerText = "Account Balance: " + data.accountBalance + " USD";
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
    document.getElementById("freelancerEditName").disabled = "";
    document.getElementById("freelancerEditAge").disabled = "";
    document.getElementById("freelancerEditLocation").disabled = "";
    document.getElementById("freelancerEditPhone").disabled = "";
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

  function acceptOfferOrInterview() {
    const radios = document.getElementsByName("appliedJob");
    for (let i = 0; i < radios.length; i++) {
      if (radios[i].checked) {
        const tr = document.getElementsByTagName("tr")[i+1];
        const status = tr.getElementsByTagName("td")[6];
        if (status === 'INVITING' || status === 'APPROVED') {
          const request = new XMLHttpRequest();
          request.open('POST', 'http://localhost:8080/freelancer/action/accept/interview-offer', true);
          request.setRequestHeader("Content-Type", "application/json; charset=UTF-8");
          request.setRequestHeader("Authorization", localStorage.getItem("token"))
          request.onload = function () {
            const data = JSON.parse(this.response);
            if (data === 'successfully') {
              alert('Accept Successfully!');
              buttonJump('http://localhost:8080/page/freelancer/profile');
            } else {
              alert('System Error');
            }
          }
        } else {
          alert("You cannot accept this job right now!")
        }

      }
    }
    alert("Please select a job from the list!");
  }

  function rejectOfferOrInterview() {
    const radios = document.getElementsByName("appliedJob");
    for (let i = 0; i < radios.length; i++) {
      if (radios[i].checked) {
        const tr = document.getElementsByTagName("tr")[i+1];
        const status = tr.getElementsByTagName("td")[6];
        if (status === 'INVITING' || status === 'APPROVED') {
          const request = new XMLHttpRequest();
          request.open('POST', 'http://localhost:8080/freelancer/action/decline/interview-offer', true);
          request.setRequestHeader("Content-Type", "application/json; charset=UTF-8");
          request.setRequestHeader("Authorization", localStorage.getItem("token"))
          request.onload = function () {
            const data = JSON.parse(this.response);
            if (data === 'successfully') {
              alert('Decline Successfully!');
              buttonJump('http://localhost:8080/page/freelancer/profile');
            } else {
              alert('System Error');
            }
          }
        } else {
          alert("You cannot decline this job right now!")
        }
      }
    }
    alert("Please select a job from the list!");
  }


  function viewAppliedJobDetail() {
    const radios = document.getElementsByName("appliedJob");
    for (let i = 0; i < radios.length; i++) {
      if (radios[i].checked) {
        const tr = document.getElementsByTagName("tr")[i+1];
        const td = tr.getElementsByTagName("td")[1];
        console.log(td.innerHTML);
        localStorage.setItem("freelancerViewAppliedJobId", td.innerHTML);
        buttonJump('http://localhost:8080/page/employer/view/job/details');
        return;
      }
    }
    alert("Please select a job from the list!");
  }

  function startWork() {
    const radios = document.getElementsByName("appliedJob");
    for (let i = 0; i < radios.length; i++) {
      if (radios[i].checked) {
        const tr = document.getElementsByTagName("tr")[i + 1];
        const status = tr.getElementsByTagName("td")[6];
        if (status === 'ASSIGNED') {
          const request = new XMLHttpRequest();
          request.open('POST', 'http://localhost:8080/freelancer/action/start/work', true);
          request.setRequestHeader("Content-Type", "application/json; charset=UTF-8");
          request.setRequestHeader("Authorization", localStorage.getItem("token"))
          request.onload = function () {
            const data = JSON.parse(this.response);
            if (data === 'successfully') {
              alert('Start work successfully!')
            } else {
              alert('System Error!')
            }
          }
          request.send(JSON.stringify({
            'jobId': tr,
            'status': status
          }));
        } else {
          alert('You can not start this job!')
        }
      }
      alert("Please select a job from the list!");
    }
  }

  function completeWork() {
    const radios = document.getElementsByName("appliedJob");
    for (let i = 0; i < radios.length; i++) {
      if (radios[i].checked) {
        const tr = document.getElementsByTagName("tr")[i + 1];
        const status = tr.getElementsByTagName("td")[6];
        if (status === 'WORKING') {
          const request = new XMLHttpRequest();
          request.open('POST', 'http://localhost:8080/freelancer/action/complete/work', true);
          request.setRequestHeader("Content-Type", "application/json; charset=UTF-8");
          request.setRequestHeader("Authorization", localStorage.getItem("token"))
          request.onload = function () {
            const data = JSON.parse(this.response);
            if (data === 'successfully') {
              alert('Update job working progress successfully!')
            } else {
              alert('System Error!')
            }
          }
          request.send(JSON.stringify({
            'jobId': tr,
            'status': status
          }));
        } else {
          alert('You can not complete this job!')
        }
      }
      alert("Please select a job from the list!");
    }
  }

  function buttonJump(destination){
    window.location.href=destination;
  }

</script>
</html>
