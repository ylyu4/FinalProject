<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="utf-8">
   <title>Write Job Description</title>
   <link rel="stylesheet" href="reset.css" />
   <link rel="stylesheet" href="global.css" />
</head>
<body>
  <h1>Write Job Description</h1>

  <form>
    Job Name:          <input type="text" id="jobName" name="jobName"           value=""><br>
    Company:           <input type="text" id="jobCompany" name="jobCompany"        value=""><br>
    Experience:        <input type="text" id="jobExperience" name="jobExperience"     value=""><br>
    Location:          <input type="text" id="jobLocation" name="jobLocation"       value=""><br>
    Field:             <input type="text" id="jobField" name="jobField"          value=""><br>
    Salary:            <input type="text" id="jobSalary" name="jobSalary"         value=""><br>
    Contact:           <input type="text" id="jobContact" name="jobContact"        value=""><br>
    Due Date:          <input type="date" id="jobDueDate" name="jobDueDate"        value=""><br>
    Description:       <input type="text" id="jobDescription" name="jobDescription"    value=""><br>
    <input type="button" name="employer_write_job_descriptionPost" value="Post" onclick="createJob()"><br>
  </form>

</body>

<script type="text/javascript">
    function createJob(){
        const jobName = document.getElementById("jobName").value;
        const company = document.getElementById("jobCompany").value;
        const experience = document.getElementById("jobExperience").value;
        const location = document.getElementById("jobLocation").value;
        const field = document.getElementById("jobField").value;
        const salary = document.getElementById("jobSalary").value;
        const contact = document.getElementById("jobContact").value;
        const dueDate = document.getElementById("jobDueDate").value;
        const description = document.getElementById("jobDescription").value;

        const request = new XMLHttpRequest();
        request.open('POST', 'http://localhost:8080/employer/action/create/job', true);
        request.setRequestHeader("Content-Type", "application/json; charset=UTF-8");
        request.setRequestHeader("Authorization", localStorage.getItem("token"))
        request.onload = function () {
            const data = JSON.parse(this.response);
            if (data === "Created") {
                alert("Create Job Successfully!");
                buttonJump('http://localhost:8080/page/employer/profile');
            } else {
                alert("System Error!");
            }
        }
        request.send(JSON.stringify({
            "name": jobName,
            "company": company,
            "experience": experience,
            "location": location,
            "field": field,
            "salary": salary,
            "contact": contact,
            "deadline": dueDate,
            "description": description
        }));
    }

    function buttonJump(destination){
        window.location.href=destination;
    }
</script>

</html>
