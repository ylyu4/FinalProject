<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Available Jobs</title>
    <link rel="stylesheet" href="../../static/css/reset.css"/>
    <link rel="stylesheet" href="../../static/css/global.css"/>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Fredoka+One&display=swap" rel="stylesheet">
</head>
<body class="freelancer_browse_jobs-body">
<div class="header">
    <p class="systemTitle">Job Search System</p>
</div>
<div class="freelancer_browse_jobs-div">
    <h1>Available Jobs</h1>
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
    </div>
    <button type="button" name="freelancer_browse_jobsDetails" onclick="viewAvailableJob()">Details</button>
    <button type="button" name="freelancer_browse_jobsBack" onclick="buttonJump('${pageContext.request.contextPath}/page/freelancer/job')">Back</button>
</div>
</body>
<%--<footer>--%>
<%--    <div class="footerSetting">--%>
<%--        <p>&copy;2021 Job Search System. All Rights Reserved.</p>--%>
<%--    </div>--%>
<%--</footer>--%>

<script type="text/javascript">

  window.onload = function () {
    loadAvailableJobs();
  }

  function loadAvailableJobs () {
    const request = new XMLHttpRequest();
    request.open('GET', '${pageContext.request.contextPath}/freelancer/action/get/available-jobs', true);
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

  function viewAvailableJob () {
    const radios = document.getElementsByName("availableJob");
    for (let i = 0; i < radios.length; i++) {
      if (radios[i].checked) {
        const tr = document.getElementsByTagName("tr")[i + 1];
        const td = tr.getElementsByTagName("td")[1];
        console.log(td.innerHTML);
        localStorage.setItem("freelancerViewAvailableJobId", td.innerHTML);
        buttonJump('${pageContext.request.contextPath}/page/freelancer/browse-job-details');
        return;
      }
    }
    alert("Please select a job from the list!");
  }

  function buttonJump (destination) {
    window.location.href = destination;
  }

</script>
</html>
