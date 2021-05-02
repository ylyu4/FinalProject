<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Freelancer Job Information</title>
    <link rel="stylesheet" href="../../static/css/reset.css"/>
    <link rel="stylesheet" href="../../static/css/global.css"/>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Fredoka+One&display=swap" rel="stylesheet">
</head>
<body class="freelancer_job-body">
<div class="header">
    <p class="systemTitle">Job Search System</p>
    <nav class="userNav">
        <ul>
            <li>
                <div class="dropDown">
                    <button onclick="dropDownFunction()" class="dropDownElement">Profile</button>
                    <div id="myDropdown" class="dropDownContent">
                        <p class="firstDropDownItem" onclick="buttonJump('${pageContext.request.contextPath}/page/freelancer/profile')">Personal Information</p>
                        <p onclick="buttonJump('${pageContext.request.contextPath}/page/freelancer/view-resume')">Resume</p>
                        <p onclick="buttonJump('${pageContext.request.contextPath}/page/freelancer/remuneration-history')">Remuneration</p>
                    </div>
                </div>
            </li>
            <li><button onclick="buttonJump('${pageContext.request.contextPath}/')">Logout</button></li>
        </ul>
    </nav>
</div>
<div class="freelancer_job_detail">
    <h1 id="jobAppliedTitle">Job Applied</h1>
        <table border="0" cellspacing="0" frame=below rules=rows id="appliedJobs">
            <col style="width:10%">
            <col style="width:10%">
            <col style="width:10%">
            <col style="width:10%">
            <col style="width:10%">
            <col style="width:10%">
            <col style="width:8%">
            <col style="width:35%">
            <tr class="tableHead">
                <th style="max-width: 150px; min-width: 150px;">Job ID</th>
                <th style="max-width: 150px; min-width: 150px;">Job Name</th>
                <th style="max-width: 150px; min-width: 150px;">Experience</th>
                <th style="max-width: 150px; min-width: 150px;">Location</th>
                <th style="max-width: 150px; min-width: 150px;">Salary</th>
                <th style="max-width: 150px; min-width: 150px;">Status</th>
                <th style="max-width: 100px; min-width: 100px;">Paid</th>
                <th style="max-width: 200px; min-width: 200px;"></th>
            </tr>
        </table>
    <div id="searchAvailableJobs">
        <h1 id="searchMoreJobTitle">Check More Available Jobs</h1>
        <button class="freelancer_profile-top-button-browseJobs" type="button" name="freelancer_profileBrowseJobs" onclick="buttonJump('${pageContext.request.contextPath}/page/freelancer/browse-jobs')">Search Jobs</button>
    </div>
</div>
</body>
<script type="text/javascript">

  window.onload = function () {
    loadAppliedJobs();
  }

  function loadAppliedJobs () {
    const request = new XMLHttpRequest();
    request.open('GET', '${pageContext.request.contextPath}/freelancer/action/get/applied-jobs', true);
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
          listTable.insertAdjacentHTML("beforeend", "<tr id='applied" + i + "'><td>" + jobList[i].id + "</td>"
            + " <td>" + jobList[i].name + "</td>"
            + " <td>" + jobList[i].experience + "</td>"
            + " <td>" + jobList[i].location + "</td>"
            + " <td>" + jobList[i].salary + "</td>"
            + " <td>" + jobList[i].status + "</td>"
            + " <td>" + paidFlag + "</td>"
            + " <td><button class='freelancer_profile-right-button' type='button'  onclick='viewAppliedJobDetail(this.id)' id=" + i + ">Details</button>" +
            "<button class='freelancer_profile-right-button' type='button'  onclick='acceptOfferOrInterview(this.id)' id=" + i + ">Accept</button>" +
            "<button class='freelancer_profile-right-button' type='button'  onclick='rejectOfferOrInterview(this.id)' id=" + i + ">Decline</button>" +
            "<button class='freelancer_profile-right-button' type='button'  onclick='startWork(this.id)' id=" + i + ">Start</button>" +
            "<button class='freelancer_profile-right-button' type='button'  onclick='completeWork(this.id)' id=" + i + ">Complete</button>" + "</td></tr>");
        }
      }
    }
    request.send();
  }

  function acceptOfferOrInterview (id) {
    const tr = document.getElementById("applied" + id);
    const jobId = tr.getElementsByTagName("td")[0].innerHTML;
    const status = tr.getElementsByTagName("td")[5].innerHTML;
    if (status === 'INVITING' || status === 'OFFER') {
      const request = new XMLHttpRequest();
      request.open('POST', '${pageContext.request.contextPath}/freelancer/action/accept/interview-offer', true);
      request.setRequestHeader("Content-Type", "application/json; charset=UTF-8");
      request.setRequestHeader("Authorization", localStorage.getItem("token"))
      request.onload = function () {
        const data = JSON.parse(this.response);
        if (data === 'successfully') {
          alert('Accept Successfully!');
          buttonJump('${pageContext.request.contextPath}/page/freelancer/job');
        } else {
          alert('System Error');
        }
        return;
      }
      request.send(JSON.stringify({
        'jobId': jobId
      }));
    } else {
      alert("You cannot accept this job right now!")
    }
  }

  function rejectOfferOrInterview (id) {
    const tr = document.getElementById("applied" + id);
    const jobId = tr.getElementsByTagName("td")[0].innerHTML;
    const status = tr.getElementsByTagName("td")[5].innerHTML;
    if (status === 'INVITING' || status === 'OFFER') {
      const request = new XMLHttpRequest();
      request.open('POST', '${pageContext.request.contextPath}/freelancer/action/decline/interview-offer', true);
      request.setRequestHeader("Content-Type", "application/json; charset=UTF-8");
      request.setRequestHeader("Authorization", localStorage.getItem("token"))
      request.onload = function () {
        const data = JSON.parse(this.response);
        if (data === 'successfully') {
          alert('Decline Successfully!');
          buttonJump('${pageContext.request.contextPath}/page/freelancer/job');
        } else {
          alert('System Error');
        }
        return;
      }
      request.send(JSON.stringify({
        'jobId': jobId
      }));
    } else {
      alert("You cannot decline this job right now!")
    }
  }

  function startWork (id) {
    const tr = document.getElementById("applied" + id);
    const jobId = tr.getElementsByTagName("td")[0].innerHTML;
    const status = tr.getElementsByTagName("td")[5].innerHTML;
    if (status === 'ASSIGNED') {
      const request = new XMLHttpRequest();
      request.open('POST', '${pageContext.request.contextPath}/freelancer/action/start/work', true);
      request.setRequestHeader("Content-Type", "application/json; charset=UTF-8");
      request.setRequestHeader("Authorization", localStorage.getItem("token"));
      request.onload = function () {
        const data = JSON.parse(this.response);
        if (data === 'successfully') {
          alert('Start work successfully!');
          buttonJump('${pageContext.request.contextPath}/page/freelancer/job');
        } else {
          alert('System Error!');
        }
      }
      request.send(JSON.stringify({
        'jobId': jobId,
        'status': status
      }));
    } else {
      alert('You can not start this job!')
      return;
    }
  }

  function viewAppliedJobDetail (id) {
    const tr = document.getElementById("applied" + id);
    const td = tr.getElementsByTagName("td")[0];
    console.log(td.innerHTML);
    localStorage.setItem("freelancerViewAppliedJobId", td.innerHTML);
    buttonJump('${pageContext.request.contextPath}/page/freelancer/applied-job-details');
  }

  function completeWork (id) {
    const tr = document.getElementById("applied" + id);
    const jobId = tr.getElementsByTagName("td")[0].innerHTML;
    const status = tr.getElementsByTagName("td")[5].innerHTML;
    if (status === 'WORKING') {
      const request = new XMLHttpRequest();
      request.open('POST', '${pageContext.request.contextPath}/freelancer/action/complete/work', true);
      request.setRequestHeader("Content-Type", "application/json; charset=UTF-8");
      request.setRequestHeader("Authorization", localStorage.getItem("token"))
      request.onload = function () {
        const data = JSON.parse(this.response);
        if (data === 'successfully') {
          alert('Update job working progress successfully!')
          buttonJump('${pageContext.request.contextPath}/page/freelancer/job');
        } else {
          alert('System Error!')
        }
      }
      request.send(JSON.stringify({
        'jobId': jobId,
        'status': status
      }));
    } else {
      alert('You can not complete this job!')
      return;
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