// Add Employee
function addEmployee() {
  var studentID = $("#empID").val();
  var firstName = $("#empFirstName").val();
  var lastName = $("#empLastName").val();
  var age = $("#empAge").val();
  var courseID = $("#empCourseID").val();

  var student = {
    studentID: studentID,
    firstName: firstName,
    lastName: lastName,
    age: age,
    courseID: courseID,
  };

  $.ajax({
    url: "https://localhost:7186/api/students", // Update the API endpoint
    type: "POST",
    data: JSON.stringify(student),
    contentType: "application/json",
    success: function () {
      // Clear form
      $("#employeeForm")[0].reset();
      // Update Student List (You can replace "fetchStudents" with your actual function to update the list)
      fetchStudents();
    },
  });
}

// Add Department
function addCourse() {
  var courseID = $("#courseID").val();
  var courseName = $("#courseName").val();

  var course = {
    courseID: courseID,
    courseName: courseName,
  };

  $.ajax({
    url: "https://localhost:7186/api/courses", // Update the API endpoint
    type: "POST",
    data: JSON.stringify(course),
    contentType: "application/json",
    success: function () {
      // Clear the form
      $("#departmentForm")[0].reset();
      // Update Course List (You can replace "fetchCourses" with your actual function to update the list)
      fetchCourses();
    },
  });
}

// Fetch Employees
function fetchStudents() {
  $.ajax({
    url: "https://localhost:7186/api/students",
    type: "GET",
    success: function (data) {
      $("#employeeList").empty();
      data.forEach(function (student) {
        $("#employeeList").append(
          '<li class="list-group-item">' +
            "ID: " +
            student.studentID +
            ", " +
            "First Name: " +
            student.firstName +
            ", " +
            "Last Name: " +
            student.lastName +
            ", " +
            "Age: " +
            student.age +
            ", " +
            "Course ID: " +
            student.courseID +
            "</li>"
        );
      });
    },
  });
}

// Fetch Departments
function fetchCourses() {
  $.ajax({
    url: "https://localhost:7186/api/courses",
    type: "GET",
    success: function (data) {
      $("#departmentList").empty();
      data.forEach(function (course) {
        $("#departmentList").append(
          '<li class="list-group-item">' +
            "Course ID: " +
            course.courseID +
            ", " +
            "Course Name: " +
            course.courseName +
            "</li>"
        );
      });
    },
  });
}

// Initial fetch
$(document).ready(function () {
  fetchStudents();
  //fetchDepartments();
});
