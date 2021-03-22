function buttonJump(destination){
    window.location.href=destination;
}

function freelancerViewResumeEditEnable(){
  document.getElementById("freelancerEditEEFrom"). disabled = "";
  document.getElementById("freelancerEditEETo").disabled = "";
  document.getElementById("freelancerEditEESchool").disabled = "";
  document.getElementById("freelancerEditEEDegree"). disabled = "";
  document.getElementById("freelancerEditEEMajor").disabled = "";
  document.getElementById("freelancerEditEEDescription").disabled = "";

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
