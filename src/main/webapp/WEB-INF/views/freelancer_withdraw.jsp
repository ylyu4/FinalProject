<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Withdraw Money</title>
    <link rel="stylesheet" href="../../static/css/reset.css"/>
    <link rel="stylesheet" href="../../static/css/global.css"/>
    <script type="text/javascript" src="../../static/js/functions.js"></script>
</head>
<body class="freelancer_withdraw-body">
<div class="freelancer_withdraw-div">
    <h1>Withdraw Money</h1>
    <form action="">
        <div>
            <label class="freelancer_withdraw-form-label" for="amount">Amount</label>
        </div>
        <div>
            <input id="freelancerWithdraw" class="freelancer_withdraw-form" type="text" name="freelancerWithdraw"
                   value="" required>
        </div>
        <button class="freelancer_withdraw-button" type="button" onclick="freelancerWithdrawAmount()">Withdraw</button>
    </form>
    <button class="freelancer_withdraw-button" type="button" name="freelancer_withdrawBack"
            onclick="buttonJump('${pageContext.request.contextPath}/page/freelancer/remuneration-history')">Back
    </button>
</div>
</body>

<script type="text/javascript">

  function freelancerWithdrawAmount () {
    const amount = document.getElementById('freelancerWithdraw').value;
    if (!isNumeric(amount)) {
      alert('The amount should be a number!');
      return;
    }
    const sign = Math.sign(parseInt(amount));
    if (sign !== 1) {
      alert('The amount should be positive!');
      return;
    }
    const request = new XMLHttpRequest();
    request.open('POST', '${pageContext.request.contextPath}/freelancer/action/withdraw/money', true);
    request.setRequestHeader("Content-Type", "application/json; charset=UTF-8");
    request.setRequestHeader("Authorization", localStorage.getItem("token"));
    request.onload = function () {
      const data = JSON.parse(this.response);
      if (data === 'successfully') {
        alert('Withdraw Successfully!');
      } else if (data === 'card') {
        alert('Please add your card in your profile page!');
      } else if (data === 'shortage') {
        alert('Your withdraw amount is over your account balance!');
      } else {
        alert('System Error!');
      }
    }
    request.send(JSON.stringify({
      'amount': amount
    }));
  }

  function buttonJump (destination) {
    window.location.href = destination;
  }

  function isNumeric (num) {
    return !isNaN(num)
  }

</script>
</html>
