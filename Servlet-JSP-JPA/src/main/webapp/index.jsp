<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.jsp.Models.Client,com.jsp.Models.Voiture,java.util.List, java.util.ArrayList" %>
    <%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.ParseException" %>
<!DOCTYPE html>
<html>
 <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>VL</title>
    <!-- plugins:css --> 
    <link rel="stylesheet" href="assets/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="assets/vendors/flag-icon-css/css/flag-icon.min.css">
    <link rel="stylesheet" href="assets/vendors/css/vendor.bundle.base.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.15.0/font/bootstrap-icons.css" rel="stylesheet">
    <!-- endinject -->
    <!-- Plugin css for this page -->
    <link rel="stylesheet" href="assets/vendors/font-awesome/css/font-awesome.min.css" />
    <link rel="stylesheet" href="assets/vendors/bootstrap-datepicker/bootstrap-datepicker.min.css">
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <!-- endinject -->
    <!-- Layout styles -->
    <link rel="stylesheet" href="assets/css/style.css">
    <!-- End layout styles -->
   
  
  </head>
  <body>

<%
    String userName = null;
    String userId = null;  // Add this line
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if ("user".equals(cookie.getName())) {
                userName = cookie.getValue();
            } if ("userID".equals(cookie.getName())) {
                userId = cookie.getValue();  
                
            }
        }
    }
 
%>
    
    <div class="container-scroller">
      <!-- partial:partials/_navbar.html -->
      <nav class="navbar default-layout-navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row"  >
        <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center" style="background-color:black;">
          <a class="navbar-brand brand-logo" href="#" style="margin-top:20px; margin-left:-30px" ><i class="bi bi-car" style="color: #dc6841; font-style: italic; ">LV's</i></a>

        </div>
        <div class="navbar-menu-wrapper d-flex align-items-stretch" style="background-color:black">
        
          <div class="search-field d-none d-xl-block">
          
          
<form class="d-flex align-items-center h-100" id="searchForm" method="post" action="search">

    <div class="input-group" style="margin-left: 70px;">
        <div class="input-group-prepend bg-transparent">
            <i class="input-group-text border-0 mdi mdi-magnify"></i>
        </div>
        <input type="text" class="form-control bg-transparent border-0" id="searchInput" name="searchInput" placeholder="Search products" style="border-radius: 25px 0 0 25px; border: 1px solid #be6928;">
    </div>
    
    <button type="submit" style="background-color: #be6928; height: 50px; width: 80px; font-style: italic; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); border-radius: 0 25px 25px 0;">Search</button>
    
</form>


       

          </div>
          <ul class="navbar-nav navbar-nav-right">
        <li>
        <form action="recue" method="post">
        <input type="hidden"   name="userId" value=<%=userId %>/>
         <input type="hidden"   name="userName" value=<%= userName %>/>
            <button type="submit" style="background-color: #be6928;   border-radius:10px;height:40px; margin-right:45px;  font-style: italic;" >Generate Receit</button>
        </form>

    </li>
            
        <li class="nav-item nav-profile dropdown">
              <a class="nav-link dropdown-toggle" id="profileDropdown" href="#" data-toggle="dropdown" aria-expanded="false">
                <div class="nav-profile-img">
                  <img src="assets/images/faces-clipart/pic-1.png" alt="image">
                </div>
                <div class="nav-profile-text">
                  <p class="mb-1 text-black" style="color:white"><%= userName  %></p>
                </div>
              </a>
     
            
            <li class="nav-item dropdown">
              <a class="nav-link count-indicator dropdown-toggle" id="notificationDropdown" href="#" data-toggle="dropdown">
            
                <span class="count-symbol bg-danger"></span>
              </a>
             
            </li>
          </ul>
          <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
            <span class="mdi mdi-menu"></span>
          </button>
        </div>
      </nav>
      <!-- partial -->
      <div class="container-fluid page-body-wrapper" >
        <!-- partial:partials/_sidebar.html -->
        <nav class="sidebar sidebar-offcanvas" id="sidebar" style="background-color:black">
          <ul class="nav">
            <li class="nav-item nav-category" style="margin-top: 60px;">Main</li>
            <li class="nav-item" style="margin-top: 20px;" >
              <a class="nav-link" href="#">
                <span class="icon-bg"><i class="mdi mdi-cube menu-icon" style="color: #bc6629;"></i></span>
                <span class="menu-title">All cars</span>
              </a>
            </li>

       
            <li class="nav-item" style="margin-top: 20px;">
              <a class="nav-link" data-toggle="collapse" href="#auth" aria-expanded="false" aria-controls="auth" >
                <span class="icon-bg"><i class="mdi mdi-lock menu-icon" style="color: #bc6629;"></i></span>
                <span class="menu-title">User Pages</span>
                <i class="menu-arrow"></i>
              </a>
              <div class="collapse" id="auth">
                <ul class="nav flex-column sub-menu">
                  <li class="nav-item"> <a class="nav-link" href="/Servlet-JSP-Project-School-Management-System/clientUpdateAccount.jsp?ID=<%=userId%>"> Update Account </a></li>
                  <li class="nav-item"> <a class="nav-link" href="/Servlet-JSP-Project-School-Management-System/Login.jsp"> LogIn</a></li>
                  <li class="nav-item"> <a class="nav-link"href="/Servlet-JSP-Project-School-Management-System/clientDeleteAccount?ID=<%=userId%>"> Delete Account </a></li>
                </ul>
              </div>
            </li>
           
            <li class="nav-item sidebar-user-actions" style="margin-top: 40px;">
              <div class="user-details">
                <div class="d-flex justify-content-between align-items-center">
                  <div>
                    <div class="d-flex align-items-center">
                      <div class="sidebar-profile-img">
                        <img src="assets/images/faces-clipart/pic-1.png" alt="image">
                      </div>
                      <div class="sidebar-profile-text">
                        <p class="mb-1"><%= userName  %></p>
                      </div>
                    </div>
                  </div>
             
                </div>
              </div>
            </li>
           
       
            <li class="nav-item sidebar-user-actions" style="margin-top: 30px;">
              <div class="sidebar-user-menu">
                <a href="/Servlet-JSP-Project-School-Management-System/Login.jsp" class="nav-link" ><i class="mdi mdi-logout menu-icon"></i>
                  <span class="menu-title" >Log Out</span></a>
              </div>
            </li>
          </ul>
        </nav>
        <!-- partial -->
        <div class="main-panel" >
          <div class="content-wrapper" style=" background-color:#353327">
            <div class="row" id="proBanner">
             
            <div class="row" >
              <div class="col-md-12">
            
                <div class="tab-content tab-transparent-content" >
                  <div class="tab-pane fade show active" id="business-1" role="tabpanel" aria-labelledby="business-tab">
                    <div class="row">
           
<%
// Get the current date
Date currentDate = new Date();

// Format the date to match the format of the availability date
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

List<Voiture> cars = (List<Voiture>) request.getAttribute("voitures");

// Get the search parameter from the request
String searchValue = request.getParameter("searchInput");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="path/to/your/bootstrap.css">
    <style>
        .card-container {
            position: relative;
            height: 450px;
            width: 300px;
            margin-right: 20px;
            margin-top: 20px;
            box-shadow: 0 4px 8px rgba(187, 68, 48, 0.1);
            border-radius: 10px 30px;
            overflow: hidden;
        }

        .card-image {
            background-size: cover;
            height: 100%;
            width: 100%;
        }

     .card-overlay {
    position: absolute;
    bottom: 0;
    left: 0;
    right: 0;
    color: white;
    padding: 20px;
    box-shadow: 0 -2px 8px rgba(187, 68, 48, 0.1);
    background-color: rgba(0, 0, 0, 0.5);
    border-radius: 10px;
    transform: translateY(100%);
    transition: transform 0.3s ease-in-out;
    text-align: center; /* Center text horizontally */
}


        .card-container:hover .card-overlay {
            transform: translateY(0);
        }

        .card-overlay h2, .card-overlay button {
            margin: 0; /* Remove default margin */
            padding: 10px;
            border-radius: 10px;
            text-align: center; /* Center text horizontally */
        }

        .card-overlay button {
            background-color: #BB4430;
            font-style: italic;
            border-radius: 5px;
            color: black;
            box-shadow: 0 2px 4px rgba(187, 68, 48, 0.1);
            align-items:center;
        }
    </style>
</head>
<body>

<%
if (searchValue != null && !searchValue.isEmpty()) {
    // Filter cars based on the search value
    List<Voiture> filteredCars = new ArrayList<>();

    for (Voiture car : cars) {
        // Check if the car's marque or date_dispo matches the search value
        if (car.getMarque().equalsIgnoreCase(searchValue) || sdf.format(car.getDispo()).equals(searchValue)) {
            // Check if the availability date is in the future
            boolean isReserved = false;

            try {
                Date availabilityDate = sdf.parse(sdf.format(car.getDispo()));

                // If the availability date is in the future, the car is reserved
                if (availabilityDate.after(currentDate)) {
                    isReserved = true;
                }
            } catch (ParseException e) {
                e.printStackTrace();
            }

            // Add the car to the filtered list
            filteredCars.add(car);
        }
    }

    if (!filteredCars.isEmpty()) {
        // Display filtered cars
        for (Voiture car : filteredCars) {
            // Declare isReserved outside the loop
            boolean isReserved = false;
%>
            <div class="card-container">
                <div class="card-image" style="background-image: url('<%= request.getContextPath() %>/Images/<%= car.getImage() %>');"></div>
                <div class="card-overlay">
                    <h2 class="mb-4 font-weight-bold"><%= car.getMarque() %></h2>
                    <h2 class="mb-4 font-weight-bold"><%= car.getPrix() %></h2>

                    <%
                    if (!isReserved) {
                    %>
                       <button class="btn btn-sm" style="background-color: #be6928; font-style: italic; border-radius: 5px; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);">
    <a href="carDetails.jsp?userName=<%= userName %>&userId=<%= userId %>&carId=<%= car.getId_voiture() %>&carMarque=<%= car.getMarque() %>&carPrix=<%= car.getPrix() %>&carImage=<%= car.getImage() %>" style="color: black !important; text-decoration: none;">
        Reserve Now
    </a>
</button>

                    <%
                    }
                    %>
                </div>
            </div>
<%
        }
    } else {
%>
        <p>No matching cars found</p>
<%
    }
} else {
    // If no search value provided, show all cars
    for (Voiture car : cars) {
        // Check if the availability date is in the future
        boolean isReserved = false;

        try {
            Date availabilityDate = sdf.parse(sdf.format(car.getDispo()));

            // If the availability date is in the future, the car is reserved
            if (availabilityDate.after(currentDate)) {
                isReserved = true;
            }
        } catch (ParseException e) {
            e.printStackTrace();
        }
%>
        <div class="card-container">
            <div class="card-image" style="background-image: url('<%= request.getContextPath() %>/Images/<%= car.getImage() %>');"></div>
            <div class="card-overlay">
                <h2 class="mb-4 font-weight-bold"><%= car.getMarque() %></h2>
                <h2 class="mb-4 font-weight-bold"><%= car.getPrix() %></h2>

                <%
                if (!isReserved) {
                %>
                   <button class="btn btn-sm" style="background-color: #be6928; font-style: italic; border-radius: 5px; box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);">
    <a href="carDetails.jsp?userName=<%= userName %>&userId=<%= userId %>&carId=<%= car.getId_voiture() %>&carMarque=<%= car.getMarque() %>&carPrix=<%= car.getPrix() %>&carImage=<%= car.getImage() %>" style="color: black !important; text-decoration: none;">
        Reserve Now
    </a>
</button>

                <%
                }
                %>
            </div>
        </div>
<%
    }

    if (cars.isEmpty()) {
%>
        <p>No cars available</p>
<%
    }
}
%>

<script>
    // Add JavaScript to handle hover effect for all card containers
    document.addEventListener("DOMContentLoaded", function () {
        var cardContainers = document.querySelectorAll(".card-container");

        cardContainers.forEach(function (cardContainer) {
            var cardOverlay = cardContainer.querySelector(".card-overlay");

            cardContainer.addEventListener("mouseenter", function () {
                cardOverlay.style.transform = "translateY(0)";
            });

            cardContainer.addEventListener("mouseleave", function () {
                cardOverlay.style.transform = "translateY(100%)";
            });
        });
    });
</script>






                   
                  </div>
                </div>
              </div>
            </div>
          </div>
          <!-- content-wrapper ends -->
          <!-- partial:partials/_footer.html -->
         
          <!-- partial -->
        </div>
        <!-- main-panel ends -->
      </div>
      <!-- page-body-wrapper ends -->
    </div>
    <!-- container-scroller -->
    <!-- plugins:js -->

    <script src="assets/vendors/js/vendor.bundle.base.js"></script>
    <!-- endinject -->
    <!-- Plugin js for this page -->
    <script src="assets/vendors/chart.js/Chart.min.js"></script>
    <script src="assets/vendors/jquery-circle-progress/js/circle-progress.min.js"></script>
    <!-- End plugin js for this page -->
    <!-- inject:js -->
    <script src="assets/js/off-canvas.js"></script>
    <script src="assets/js/hoverable-collapse.js"></script>
    <script src="assets/js/misc.js"></script>
    <!-- endinject -->
    <!-- Custom js for this page -->
    <script src="assets/js/dashboard.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
 <script>
    function redirectToCarDetails(userId, carId, carMarque, carPrix, carImage) {
        var url = 'carDetails.jsp?userId=' + userId +
            '&carId=' + carId +
            '&carMarque=' + encodeURIComponent(carMarque) +
            '&carPrix=' + encodeURIComponent(carPrix) +
            '&carImage=' + encodeURIComponent(carImage);
        window.location.href = url;
    }
</script>
 <script>
    // Function to check if a value is a date
    function isDate(value) {
        // Regular expression for a date in the format YYYY-MM-DD
        var dateRegex = /^\d{4}-\d{2}-\d{2}$/;
        return dateRegex.test(value);
    }

        var searchInput = document.getElementById("searchInput");

        // Access the value of the search input
        var searchValue = searchInput.value.trim(); // Trim to remove leading/trailing whitespaces

        // Check if the value is a date
        if (isDate(searchValue)) {
            console.log("Search value is a date: " + searchValue);
            // Add logic for handling a date (you can make an AJAX request or other actions)
        } else {
            console.log("Search value is a string: " + searchValue);
            // Add logic for handling a string (you can make an AJAX request or other actions)
        }

  
  
</script>


        <script>
  function changeLanguage(language) {
    if (language === 'arabic') {
      // Change the entire page content to Arabic
      $('body').css('direction', 'rtl'); // Right-to-left direction for Arabic
      // Add more code here to change other elements if needed
    } else {
      // Change the entire page content back to English or default language
      $('body').css('direction', 'ltr'); // Left-to-right direction for English
      // Add more code here to revert other changes if needed
    }
  }
</script>
  </body>
</html>