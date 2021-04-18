<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="utf-8">
   <title>Deposit</title>
   <link rel="stylesheet" href="../../static/css/reset.css" />
   <link rel="stylesheet" href="../../static/css/global.css" />
   <script type="text/javascript" src="../../static/js/functions.js"></script>
</head>
<body class="employer_deposit-body">
  <div class="employer_deposit-div">
  <h1>Deposit</h1>
  <form action="">
    <div>
      <label class="employer_deposit-form-label" for="amount">Amount</label>
    </div>
    <div>
      <input id="employerDeposit" class="employer_deposit-form" type="text" name="employerDeposit" value="" required>
    </div>
    <button class="employer_deposit-button" type="button" onclick="depositMoney()">Deposit</button>
  </form>
  <button type="button" name="employer_depositBack" onclick="buttonJump('http://localhost:8080/page/employer/profile')">Back</button>
</div>
</body>

<script type="text/javascript">

  function depositMoney() {
    const amount = document.getElementById('employerDeposit');
    if (!Number.isInteger(amount)) {
      alert('The amount should be a number!');
      return;
    }
    const sign = Math.sign(amount);
    if (sign !== 1) {
      alert('The amount should be positive!');
      return;
    }

    const request = new XMLHttpRequest();
    request.open('POST', 'http://localhost:8080/employer/action/deposit', true);
    request.setRequestHeader("Content-Type", "application/json; charset=UTF-8");
    request.setRequestHeader("Authorization", localStorage.getItem("token"));
    request.onload = function () {
      const data = JSON.parse(this.response);
      if (data === 'successfully') {
        alert('Deposit Successfully!');
      } else if (data === 'card') {
        alert('Please add your card in your profile page!');
      } else {
        alert('System Error!');
      }
    }
    request.send(JSON.stringify({
      'amount': amount
    }));
  }

  function buttonJump(destination){
    window.location.href=destination;
  }
</script>
</html>
