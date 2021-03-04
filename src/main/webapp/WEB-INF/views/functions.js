function buttonJump(destination){
  window.location.href=destination;
}

function administratorSignUp(){
  // Check account and key
  // if Account && Key correct
    alert("Successful!");
    window.location.href="administrator_profile.html";
  // else account exists
    alert("Account already exists.");
  // else key doesn't exist
    alert("The key doesn't exist.");

}

function employerSignUp(){
  // Check account
  // if Account correct
    alert("Successful!");
    window.location.href="employer_profile.html";
  // else account exists
    alert("Account already exists.");
}

function freelancerSignUp(){
  // Check account
  // if Account correct
    alert("Successful!");
    window.location.href="freelancer_profile.html";
  // else account exists
    alert("Account already exists.");
}

function administratorProfileEditEnable(){
  document.getElementById("administratorEditName"). disabled = "";
  document.getElementById("administratorEditPhone").disabled = "";
  document.getElementById("administratorEditEmail").disabled = "";
}

function employerProfileEditEnable(){
  document.getElementById("employerEditName"). disabled = "";
  document.getElementById("employerEditPhone").disabled = "";
  document.getElementById("employerEditEmail").disabled = "";
  document.getElementById("employerEditCity"). disabled = "";
  document.getElementById("employerEditType").disabled = "";
  document.getElementById("employerEditDescription").disabled = "";
}

function freelancerProfileEditEnable(){
  document.getElementById("freelancerEditName"). disabled = "";
  document.getElementById("freelancerEditAge").disabled = "";
  document.getElementById("freelancerEditLocation").disabled = "";
  document.getElementById("freelancerEditPhone"). disabled = "";
  document.getElementById("freelancerEditEmail").disabled = "";
}

function freelancerViewResumeEditEnable(){
  document.getElementById("freelancerEditEEFrom"). disabled = "";
  document.getElementById("freelancerEditEETo"). disabled = "";
  document.getElementById("freelancerEditEESchool"). disabled = "";
  document.getElementById("freelancerEditEEDegree"). disabled = "";
  document.getElementById("freelancerEditEEMajor"). disabled = "";
  document.getElementById("freelancerEditEEDescription"). disabled = "";

  document.getElementById("freelancerEditWEFrom"). disabled = "";
  document.getElementById("freelancerEditWETo"). disabled = "";
  document.getElementById("freelancerEditWESchool"). disabled = "";
  document.getElementById("freelancerEditWEDegree"). disabled = "";
  document.getElementById("freelancerEditWEMajor"). disabled = "";
  document.getElementById("freelancerEditWEDescription"). disabled = "";

  document.getElementById("freelancerEditLanguages"). disabled = "";
  document.getElementById("freelancerEditSkills"). disabled = "";
  document.getElementById("freelancerEditSelfReviews"). disabled = "";
}

function employerDepositAmount(){
  var x = document.getElementById("employerDeposit");
  alert("Successful!"+ String(x.value));
  window.location.href="employer_profile.html";
}

function freelancerWithdrawAmount(){
  var y = document.getElementById("freelancerWithdraw");

  // if enough
  alert("Successful!"+ String(y.value));
  // if NOT
  alert("Not enough balance!"+ String(y.value));

  window.location.href="freelancer_profile.html";
}

function employerPrepay(jobID){
  var r=confirm("Are you sure to prepay the job (Job ID: "+jobID+") ?");
  if (r==true) {
    // Check balance, give alert.
    // if
    alert("Payment Successful!");
    // else
    alert("Insufficient balance.");
  }
}

function employerProfileDelete(jobID){
  var r=confirm("Are you sure to delete the job (Job ID: "+jobID+") ?");
  if (r==true) {
    // DB Delete job
    alert("The job has been deleted.");
  }
}

function freelancerProfileDelete(jobID){
  var r=confirm("Are you sure to delete the job (Job ID: "+jobID+") ?");
  if (r==true) {
    // DB Delete job
    alert("The job has been deleted.");
  }
}

function freelancerProfileStartWork(jobID){
  var r=confirm("Are you sure to start the work (Job ID: "+jobID+") ?");
  if (r==true) {
    // DB start work
    alert("You started the work.");
  }
}

function freelancerProfileCompleteWork(jobID){
  var r=confirm("Are you sure to complete the work (Job ID: "+jobID+") ?");
  if (r==true) {
    // DB complete work
    alert("You completed the work.");
  }
}

function employerConfirmWork(jobID){
  var r=confirm("Are you sure to confirm the work (Job ID: "+jobID+") ?");
  if (r==true) {
    // Status change to Confirmed
    alert("The work has been confirmed.");
  }
}

function freelancerApplyJob(jobID){
  // send application request
  alert("Application received. (Job ID: 0000001)");
  window.location.href="freelancer_profile.html";
}
