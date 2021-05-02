<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Payment History</title>
    <link rel="stylesheet" href="../../static/css/reset.css"/>
    <link rel="stylesheet" href="../../static/css/global.css"/>
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Fredoka+One&display=swap" rel="stylesheet">
</head>
<body class="admin_payment_history-body">
<div class="header">
    <p class="systemTitle">Job Search System</p>
</div>
<div class="accountBalance">
    <p id="systemBalance"></p>
</div>
<div class="employer_payment_history-div">
    <h1>Transaction History</h1>
    <div class="administrator_profile-table">
        <table border="1" cellspacing="0" frame=below rules=rows id="adminPaymentList">
            <thead>
            <tr>
                <th>Payment ID</th>
                <th>Amount</th>
                <th>Date</th>
            </tr>
            </thead>
        </table>
    </div>
    <button type="button" name="admin_payment_historyBack" onclick="buttonJump('${pageContext.request.contextPath}/page/admin/job')">Back</button>
</div>
</body>

<script type="text/javascript">

  window.onload = function () {
    checkCurrentBalance();
    loadPaymentHistory();
  }

  function loadPaymentHistory () {
    const request = new XMLHttpRequest();
    request.open('GET', '${pageContext.request.contextPath}/admin/action/get/all/payment/history', true);
    request.setRequestHeader("Content-Type", "application/json; charset=UTF-8");
    request.setRequestHeader("Authorization", localStorage.getItem("token"));
    request.onload = function () {
      const data = JSON.parse(this.response);
      const div = document.getElementById("adminPaymentList");
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

  function checkCurrentBalance () {
    const request = new XMLHttpRequest();
    request.open('GET', '${pageContext.request.contextPath}/admin/action/get/system-balance', true);
    request.setRequestHeader("Content-Type", "application/json; charset=UTF-8");
    request.setRequestHeader("Authorization", localStorage.getItem("token"));
    request.onload = function () {
      const data = JSON.parse(this.response);
      const element = document.getElementById("systemBalance");
      element.innerText = "Account Balance: " + data + " USD";
    }
    request.send();
  }

  function buttonJump (destination) {
    window.location.href = destination;
  }


</script>
</html>