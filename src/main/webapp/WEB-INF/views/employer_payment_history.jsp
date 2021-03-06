<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Payment History</title>
    <link rel="stylesheet" href="../../static/css/reset.css"/>
    <link rel="stylesheet" href="../../static/css/global.css"/>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Fredoka+One&display=swap" rel="stylesheet">
    <script type="text/javascript" src="../../static/js/functions.js"></script>
</head>
<body class="employer_payment_history-body">
<div class="header">
    <p class="systemTitle">Job Search System</p>
</div>
<div class="accountBalance">
    <p id="employerAccountBalanceAmount"></p>
    <button class="employer_profile-top-button" type="button" name="employer_profileRecharge" onclick="buttonJump('${pageContext.request.contextPath}/page/employer/recharge')">Recharge Money</button>
</div>
<div class="employer_payment_history-div">
    <h1>Transaction History</h1>
    <div class="employer_payment_history-table">
        <table border="0" cellspacing="0" frame=below rules=rows id="employerPaymentList">
            <tr>
                <th>Transaction ID</th>
                <th>Amount</th>
                <th>Date</th>
            </tr>
        </table>
    </div>
    <button type="button" name="employer_payment_historyBack"
            onclick="buttonJump('${pageContext.request.contextPath}/page/employer/job')">Back
    </button>
</div>
</body>


<script type="text/javascript">

  window.onload = function () {
    loadPaymentHistory();
    loadProfile();
  }

  function loadProfile () {
    const request = new XMLHttpRequest();
    request.open('GET', '${pageContext.request.contextPath}/employer/action/profile', true);
    request.setRequestHeader("Content-Type", "application/json; charset=UTF-8");
    request.setRequestHeader("Authorization", localStorage.getItem("token"));
    request.onload = function () {
      const data = JSON.parse(this.response);
      document.getElementById("employerAccountBalanceAmount").innerText = "Account Balance: " + data.accountBalance + " USD";
    }
    request.send(null);
  }

  function loadPaymentHistory () {
    const request = new XMLHttpRequest();
    request.open('GET', '${pageContext.request.contextPath}/employer/action/get/all/payment/history', true);
    request.setRequestHeader("Content-Type", "application/json; charset=UTF-8");
    request.setRequestHeader("Authorization", localStorage.getItem("token"));
    request.onload = function () {
      const data = JSON.parse(this.response);
      const div = document.getElementById("employerPaymentList");
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

  function buttonJump (destination) {
    window.location.href = destination;
  }
</script>

</html>
