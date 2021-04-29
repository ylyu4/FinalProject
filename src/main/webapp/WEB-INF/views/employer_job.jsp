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
<body class="employer_job-body">
<div class="header">
    <p class="systemTitle">Job Search System</p>
    <nav class="userNav">
        <ul>
            <li>
                <div class="dropDown">
                    <button onclick="dropDownFunction()" class="dropDownElement">Profile</button>
                    <div id="myDropdown" class="dropDownContent">
                        <p class="firstDropDownItem" onclick="buttonJump('http://localhost:8080/page/employer/profile')">Personal Information</p>
                        <p onclick="buttonJump('http://localhost:8080/page/employer/payment-history')">Transaction History</p>
                    </div>
                </div>
            </li>
            <li><button onclick="buttonJump('http://localhost:8080/page/homepage')">Logout</button></li>
        </ul>
    </nav>
</div>
<div class="employer_profile-div-right">
    <h1>Job Created</h1>
    <table border="0" cellspacing="0" frame=below rules=rows id="createdJobs">
        <col style="width:10%">
        <col style="width:10%">
        <col style="width:10%">
        <col style="width:10%">
        <col style="width:10%">
        <col style="width:10%">
        <col style="width:40%">
        <tr class="tableHead">
            <th style="max-width: 150px; min-width: 150px;">Job ID</th>
            <th style="max-width: 150px; min-width: 150px;">Job Name</th>
            <th style="max-width: 150px; min-width: 150px;">Experience</th>
            <th style="max-width: 150px; min-width: 150px;">Location</th>
            <th style="max-width: 150px; min-width: 150px;">Salary</th>
            <th style="max-width: 150px; min-width: 150px;">Status</th>
            <th style="max-width: 300px; min-width: 300px;"></th>
        </tr>
    </table>
    <div id="createNewJob">
        <h1 id="createNewJobTitle">Click Here For Creating A New Job</h1>
        <button class="employer_profile-top-button-postNewJob" type="button" name="employer_profilePostNewJob" onclick="buttonJump('http://localhost:8080/page/employer/create-job')">Create New Job</button>
    </div>
</div>
</body>
<%--<footer>--%>
<%--    <div class="footerSetting">--%>
<%--        <p>&copy;2021 Job Search System. All Rights Reserved.</p>--%>
<%--    </div>--%>
<%--</footer>--%>

<script type="text/javascript">

  window.onload = function () {
    loadPostedJobs();
  }

  function loadPostedJobs () {
    const request = new XMLHttpRequest();
    request.open('GET', 'http://localhost:8080/employer/action/posted-jobs', true);
    request.setRequestHeader("Content-Type", "application/json; charset=UTF-8");
    request.setRequestHeader("Authorization", localStorage.getItem("token"));
    request.onload = function () {
      const jobList = JSON.parse(this.response);
      const listTable = document.getElementById("createdJobs");
      if (jobList != null) {
        for (let i = 0; i < jobList.length; i++) {
          listTable.insertAdjacentHTML("beforeend", "<tr id='created" + i + "'><td>" + jobList[i].id + "</td>"
            + " <td>" + jobList[i].name + "</td>"
            + " <td>" + jobList[i].experience + "</td>"
            + " <td>" + jobList[i].location + "</td>"
            + " <td>" + jobList[i].salary + "</td>"
            + " <td>" + jobList[i].jobStatus + "</td>"
            + " <td><button class='employer_profile-right-button-Application' type='button' onclick='checkApplicants(this.id)' id=" + i + ">Applicants</button>" +
            "<button class='employer_profile-right-button' type='button' onclick='viewPostedJobDetail(this.id)' id=" + i + ">Details</button>" +
            "<button class='employer_profile-right-button' type='button' onclick='postNewReleasedJob(this.id)' id=" + i + ">Post</button>" +
            "<button class='employer_profile-right-button' type='button' onclick='approveCompleteWork(this.id)' id=" + i + ">Confirm</button>" +
            "<button class='employer_profile-right-button' type='button' onclick='rejectCompleteWork(this.id)' id=" + i + ">Reject</button>" + "</td></tr>");
        }
      }
    }
    request.send(null);
  }

  function checkApplicants (id) {
    const tr = document.getElementById("created" + id);
    const td = tr.getElementsByTagName("td")[0];
    console.log(td.innerHTML);
    localStorage.setItem("employerViewJobId", td.innerHTML);
    buttonJump('http://localhost:8080/page/employer/check-applicants-list');
  }

  function viewPostedJobDetail (id) {
    const tr = document.getElementById("created" + id);
    const td = tr.getElementsByTagName("td")[0];
    console.log(td.innerHTML);
    localStorage.setItem("employerViewDetailsJobId", td.innerHTML);
    buttonJump('http://localhost:8080/page/employer/view-post-job-details');
  }

  function postNewReleasedJob (id) {
    const tr = document.getElementById("created" + id);
    const jobId = tr.getElementsByTagName("td")[0].innerHTML;
    const status = tr.getElementsByTagName("td")[5].innerHTML;
    if (status === 'APPROVED') {
      const request = new XMLHttpRequest();
      request.open('POST', 'http://localhost:8080/employer/action/post/job', true);
      request.setRequestHeader("Content-Type", "application/json; charset=UTF-8");
      request.setRequestHeader("Authorization", localStorage.getItem("token"))
      request.onload = function () {
        const data = JSON.parse(this.response);
        if (data === 'successfully') {
          alert('Post the job successfully!')
          buttonJump('http://localhost:8080/page/employer/job');
        } else {
          alert('System Error!')
        }
      }
      request.send(JSON.stringify({
        'jobId': jobId,
        'status': status
      }));
    } else {
      alert('You can not post this job!')
    }
  }

  function approveCompleteWork (id) {
    const tr = document.getElementById("created" + id);
    const jobId = tr.getElementsByTagName("td")[0].innerHTML;
    const status = tr.getElementsByTagName("td")[5].innerHTML;
    if (status === 'FINISHED') {
      const request = new XMLHttpRequest();
      request.open('POST', 'http://localhost:8080/employer/action/confirm/completed-work', true);
      request.setRequestHeader("Content-Type", "application/json; charset=UTF-8");
      request.setRequestHeader("Authorization", localStorage.getItem("token"))
      request.onload = function () {
        const data = JSON.parse(this.response);
        if (data === 'successfully') {
          alert('Confirm the qualified job successfully!')
          buttonJump('http://localhost:8080/page/employer/job');
        } else {
          alert('System Error!')
        }
      }
      request.send(JSON.stringify({
        'jobId': jobId,
        'status': status
      }));
    } else {
      alert('You can not confirm this job!')
    }
  }

  function rejectCompleteWork (id) {
    const tr = document.getElementById("created" + id);
    const jobId = tr.getElementsByTagName("td")[0].innerHTML;
    const status = tr.getElementsByTagName("td")[5].innerHTML;
    if (status === 'FINISHED') {
      const request = new XMLHttpRequest();
      request.open('POST', 'http://localhost:8080/employer/action/reject/completed-work', true);
      request.setRequestHeader("Content-Type", "application/json; charset=UTF-8");
      request.setRequestHeader("Authorization", localStorage.getItem("token"))
      request.onload = function () {
        const data = JSON.parse(this.response);
        if (data === 'successfully') {
          alert('Reject the unqualified job successfully!')
          buttonJump('http://localhost:8080/page/employer/job');
        } else {
          alert('System Error!')
        }
      }
      request.send(JSON.stringify({
        'jobId': jobId,
        'status': status
      }));
    } else {
      alert('You can not reject this job!')
    }
  }

  function buttonJump (destination) {
    window.location.href = destination;
  }

  function dropDownFunction() {
    document.getElementById("myDropdown").classList.toggle("show");
  }

  window.onclick = function(event) {
    if (!event.target.matches('.dropDownElement')) {
      var dropdowns = document.getElementsByClassName("dropDownContent");
      var i;
      for (i = 0; i < dropdowns.length; i++) {
        var openDropdown = dropdowns[i];
        if (openDropdown.classList.contains('show')) {
          openDropdown.classList.remove('show');
        }
      }
    }
  }

</script>
</html>
