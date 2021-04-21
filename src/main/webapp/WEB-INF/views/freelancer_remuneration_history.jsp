<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="utf-8">
   <title>Remuneration History</title>
   <link rel="stylesheet" href="../../static/css/reset.css" />
   <link rel="stylesheet" href="../../static/css/global.css" />
   <script type="text/javascript" src="../../static/js/functions.js"></script>
</head>
<body class="freelancer_remuneration_history-body">
  <div class="freelancer_remuneration_history-div">
  <h1>Remuneration History for Freelancer</h1>
  <div class="freelancer_remuneration_history-table">
  <table border="0" cellspacing="0" frame=below rules=rows id="freelancerPaymentList">
    <tr>
      <th>Payment ID</th>
      <th>Amount</th>
      <th>Date</th>
    </tr>
  </table>
  </div>
  <button type="button" name="freelancer_remuneration_historyBack" onclick="buttonJump('http://localhost:8080/page/freelancer/profile')">Back</button>
  </div>
</body>

<script type="text/javascript">

  window.onload = function () {
    loadPaymentHistory();
  }

  function loadPaymentHistory() {
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
          div.insertAdjacentHTML("beforeend", "<tr><td>"+data[i].paymentHistoryId+"</td>"
                  + " <td>"+amount+"</td>"
                  + " <td>"+data[i].transactionTime+"</td></tr> ");
        }
      }
    }
    request.send(null);
  }

  function buttonJump(destination){
    window.location.href=destination;
  }
</script>
</html>
