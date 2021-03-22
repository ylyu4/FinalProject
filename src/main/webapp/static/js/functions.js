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
}
