<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Administrator Profile</title>
    <link rel="stylesheet" type="text/css" href="../../static/css/reset.css"/>
    <link rel="stylesheet" type="text/css" href="../../static/css/global.css"/>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Fredoka+One&display=swap" rel="stylesheet">
</head>
<body class="administrator_job-body">
<div class="header">
    <p class="systemTitle">Job Search System</p>
    <nav class="userNav">
        <ul>
            <li>
                <div class="dropDown">
                    <button onclick="dropDownFunction()" class="dropDownElement">Profile</button>
                    <div id="myDropdown" class="dropDownContent">
                        <p class="firstDropDownItem" onclick="buttonJump('${pageContext.request.contextPath}/page/admin/profile')">Personal Information</p>
                        <p onclick="buttonJump('${pageContext.request.contextPath}/page/admin/transaction-history')">Transaction History</p>
                    </div>
                </div>
            </li>
            <li>
                <button onclick="buttonJump('${pageContext.request.contextPath}/')">Logout</button>
            </li>
        </ul>
    </nav>
</div>
<div class="administrator_profile-div">
    <div class="administrator_profile-div-middle">
        <h1 id="jobNeedToReview">Jobs Need To Review</h1>
        <div class="administrator_profile-table">
            <table border="0" cellspacing="0" frame=below rules=rows id="jobList">
                <thead>
                <tr>
                    <th>Job ID</th>
                    <th>Company</th>
                    <th>Job Name</th>
                    <th>Experience</th>
                    <th>Location</th>
                    <th>Salary</th>
                    <th>Creator ID</th>
                    <th></th>
                </tr>
                </thead>
            </table>
        </div>
    </div>
</div>
</body>

<script type="text/javascript">

  window.onload = function () {
    checkNewJobs();
  }

  function checkNewJobs () {
    const request = new XMLHttpRequest();
    request.open('GET', '${pageContext.request.contextPath}/admin/action/get/jobs', true);
    request.setRequestHeader("Content-Type", "application/json; charset=UTF-8");
    request.setRequestHeader("Authorization", localStorage.getItem("token"));
    request.onload = function () {
      const data = JSON.parse(this.response);
      const div = document.getElementById("jobList");
      if (data != null) {
        for (let i = 0; i < data.length; i++) {
          div.insertAdjacentHTML("beforeend", "<tr id='review" + i + "'><td>" + data[i].id + "</td>"
            + " <td>" + data[i].company + "</td>"
            + " <td>" + data[i].name + "</td>"
            + " <td>" + data[i].experience + "</td>"
            + " <td>" + data[i].location + "</td>"
            + " <td>" + data[i].salary + "</td>"
            + " <td>" + data[i].createdBy + "</td>"
            + " <td><button class='administrator_profile-bottom-button' type='button' onclick='viewNewJob(this.id)' id=" + i + ">View</button>" + "</td></tr> ");
        }
      }
    }
    request.send(null);
  }

  function viewNewJob (id) {
    const tr = document.getElementById("review" + id);
    const td = tr.getElementsByTagName("td")[0];
    console.log(td.innerHTML);
    localStorage.setItem("administratorViewJobId", td.innerHTML);
    buttonJump('${pageContext.request.contextPath}/page/admin/view-job');
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
