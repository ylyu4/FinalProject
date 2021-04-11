<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="utf-8">
   <title>Applicants List</title>
   <link rel="stylesheet" href="../../static/css/reset.css" />
   <link rel="stylesheet" href="../../static/css/global.css" />
</head>
<body class="employer_applicants_list-body">
  <div class="employer_applicants_list-div">
    <h1>Applicants</h1>
    <table border="0" cellspacing="0" frame=below rules=rows id="applicantsList">
        <tr>
            <th></th>
            <th>Applicant ID</th>
            <th>Status</th>
        </tr>
    </table>
    <button class="employer_applicants_list-button" type="button" name="employer_applicants_listViewApplicant" onclick="buttonJump('')">View</button>
    <button class="employer_applicants_list-button" type="button" name="employer_payment_historyBack" onclick="buttonJump('http://localhost:8080/page/employer/profile')">Back</button>
    </div>
</body>

<script type="text/javascript">

  window.onload = function () {
    checkApplicantList();
  }


  function checkApplicantList() {
    const request = new XMLHttpRequest();
    request.open('GET', 'http://localhost:8080/employer/action/check/job/applicants?jobId=' + localStorage.getItem("employerViewJobId"), true);
    request.setRequestHeader("Content-Type", "application/json; charset=UTF-8");
    request.setRequestHeader("Authorization", localStorage.getItem("token"));
    request.onload = function () {
      const data = JSON.parse(this.response);
      const div = document.getElementById("applicantsList");
      if (data != null) {
        for (let i = 0; i < data.length; i++) {
          div.insertAdjacentHTML("beforeend", "<tr><td><input id='radio' type='radio' name='applicant' class='" + i + "'></td>"
            + " <td>" + data[i].freelancerId + "</td>"
            + " <td>" + data[i].applicationStatus + "</td></tr>");
        }
      }
    }
    request.send();
  }

    function buttonJump(destination){
      window.location.href=destination;
    }
</script>
</html>