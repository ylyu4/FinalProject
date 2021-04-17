<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="utf-8">
   <title>Browse Jobs</title>
   <link rel="stylesheet" href="../../static/css/reset.css" />
   <link rel="stylesheet" href="../../static/css/global.css" />
</head>
<body class="freelancer_browse_jobs-body">
  <div class="freelancer_browse_jobs-div">
    <h1>Browse Jobs</h1>
    <div class="freelancer_browse_jobs-table">
      <table border="0" cellspacing="0" frame=below rules=rows id="availableJobs">
        <tr>
          <th></th>
          <th>Job ID</th>
          <th>Employer ID</th>
          <th>Job Name</th>
          <th>Experience</th>
          <th>Location</th>
          <th>Salary</th>
        </tr>
      </table>
      <button type="button" name="freelancer_browse_jobsDetails" onclick="viewAvailableJob()">Details</button>
    </div>
    <button type="button" name="freelancer_browse_jobsBack" onclick="buttonJump('http://localhost:8080/page/freelancer/profile')">Back</button>
  </div>
</body>

<script type="text/javascript">

  window.onload = function () {
    loadAvailableJobs();
  }

  function loadAvailableJobs() {
    const request = new XMLHttpRequest();
    request.open('GET', 'http://localhost:8080/freelancer/action/get/available-jobs', true);
    request.setRequestHeader("Content-Type", "application/json; charset=UTF-8");
    request.setRequestHeader("Authorization", localStorage.getItem("token"));
    request.onload = function () {
      const jobList = JSON.parse(this.response);
      const listTable = document.getElementById("availableJobs");
      if (jobList != null) {
        for (let i = 0; i < jobList.length; i++) {
          listTable.insertAdjacentHTML("beforeend", "<tr><td><input id='radio' type='radio' name='availableJob'></td>"
                  + " <td>" + jobList[i].id + "</td>"
                  + " <td>" + jobList[i].createdBy + "</td>"
                  + " <td>" + jobList[i].name + "</td>"
                  + " <td>" + jobList[i].experience + "</td>"
                  + " <td>" + jobList[i].location + "</td>"
                  + " <td>" + jobList[i].salary + "</td></tr>");
        }
      }
    }
    request.send(null);
  }

  function viewAvailableJob() {
    const radios = document.getElementsByName("availableJob");
    for (let i = 0; i < radios.length; i++) {
      if (radios[i].checked) {
        const tr = document.getElementsByTagName("tr")[i+1];
        const td = tr.getElementsByTagName("td")[1];
        console.log(td.innerHTML);
        localStorage.setItem("freelancerViewAvailableJobId", td.innerHTML);
        buttonJump('http://localhost:8080/page/freelancer/view/applied-job-details');
        return;
      }
    }
    alert("Please select a job from the list!");
  }


  function buttonJump(destination){
    window.location.href=destination;
  }

</script>
</html>
