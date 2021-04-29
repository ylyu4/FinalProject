<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Remuneration</title>
    <link rel="stylesheet" href="../../static/css/reset.css"/>
    <link rel="stylesheet" href="../../static/css/global.css"/>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Fredoka+One&display=swap" rel="stylesheet">
</head>
<body class="freelancer_remuneration_history-body">
<div class="header">
    <p class="systemTitle">Job Search System</p>
</div>
<div class="accountBalance">
    <p id="freelancerAccountBalanceAmount"></p>
    <button class="freelancer_profile-top-button" type="button" name="freelancer_profileWithdraw" onclick="buttonJump('http://localhost:8080/page/freelancer/withdraw')">Withdraw Money</button>
</div>
<div class="freelancer_remuneration_history-div">
    <h1 id="remunerationHistory">Remuneration History</h1>
    <div class="freelancer_remuneration_history-table">
        <table border="0" cellspacing="0" frame=below rules=rows id="freelancerPaymentList">
            <tr>
                <th>Transaction ID</th>
                <th>Amount</th>
                <th>Date</th>
            </tr>
        </table>
    </div>
    <button type="button" name="freelancer_remuneration_historyBack"
            onclick="buttonJump('http://localhost:8080/page/freelancer/job')">Back
    </button>
</div>
</body>
<%--<footer>--%>
<%--    <div class="footerSetting">--%>
<%--        <p>&copy;2021 Job Search System. All Rights Reserved.</p>--%>
<%--    </div>--%>
<%--</footer>--%>

<script type="text/javascript">

  window.onload = function () {
    loadPaymentHistory();
    loadProfile();
  }

  function loadPaymentHistory () {
    const request = new XMLHttpRequest();
    request.open('GET', 'http://localhost:8080/freelancer/action/get/all/payment/history', true);
    request.setRequestHeader("Content-Type", "application/json; charset=UTF-8");
    request.setRequestHeader("Authorization", localStorage.getItem("token"));
    request.onload = function () {
      const data = JSON.parse(this.response);
      const div = document.getElementById("freelancerPaymentList");
      if (data != null) {
        for (let i = 0; i < data.length; i++) {
          let amount = data[i].amount;
          if (amount > 0) {
            amount = '+' + amount;
          }
          const transactionArray = data[i].transactionTime.split('T');
          const transactionTime = transactionArray[0] + ' ' + transactionArray[1];
          div.insertAdjacentHTML("beforeend", "<tr><td>" + data[i].paymentHistoryId + "</td>"
            + " <td>" + amount + "</td>"
            + " <td>" + transactionTime + "</td></tr> ");
        }
      }
    }
    request.send(null);
  }

  function loadProfile () {
    const request = new XMLHttpRequest();
    request.open('GET', 'http://localhost:8080/freelancer/action/profile', true);
    request.setRequestHeader("Content-Type", "application/json; charset=UTF-8");
    request.setRequestHeader("Authorization", localStorage.getItem("token"));
    request.onload = function () {
      const data = JSON.parse(this.response);
      document.getElementById("freelancerAccountBalanceAmount").innerText = "Account Balance: " + data.accountBalance + " USD";
    }
    request.send(null);
  }

  function buttonJump (destination) {
    window.location.href = destination;
  }
</script>
</html>
