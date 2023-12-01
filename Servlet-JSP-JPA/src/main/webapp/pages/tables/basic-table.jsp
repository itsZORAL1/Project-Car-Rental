<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import="java.util.List" %>
<%@ page import="com.jsp.Models.Client" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="com.jsp.Models.Reservation" %>

    

<% List<Reservation> reservations = (List<Reservation>)request.getSession().getAttribute("reservations"); %>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>LV</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="../../assets/vendors/mdi/css/materialdesignicons.min.css">
    <link rel="stylesheet" href="../../assets/vendors/flag-icon-css/css/flag-icon.min.css">
    <link rel="stylesheet" href="../../assets/vendors/css/vendor.bundle.base.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&display=swap">
    <!-- endinject -->
    <!-- Plugin css for this page -->
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <!-- endinject -->
    <!-- Layout styles -->
    <link rel="stylesheet" href="../../assets/css/style.css">
    <style type="text/css">

    .custom-btn {
        /* Add your custom styling here */
        background-color: #c57339; /* Custom background color */
  
        border: 1px solid #c57339; /* Border color */
        border-radius: 30px; /* Border radius */
        padding: 15px 25px; /* Padding inside the button */
        text-decoration: none; /* Remove underline from links */
        transition: background-color 0.3s ease; /* Add a smooth transition effect */
    }

    .custom-btn:hover {
        background-color: #5b432e; /* Change background color on hover */
        border-color: #5b432e; /* Change border color on hover */
    }

    
     h1 ,th{
            color: #5b432e;
            margin-bottom: 70px;
            opacity: 0;
            animation: fadeIn 5s forwards;
            font-family: 'Montserrat', sans-serif;
            margin-left: 40%;
            font-weight: bold;
            
          
        }

        @keyframes fadeIn {
            to {
                opacity: 1;
            }
        }
    </style>
    <!-- End layout styles -->
 
  </head>
  <body style=" background-color: #bc6629">
    <div class="container-scroller">
      <!-- partial:../../partials/_navbar.html -->
      <nav class="navbar default-layout-navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row" style=" background-color :#5b432e;">
        <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center" style=" background-color :#5b432e;">
          <a class="navbar-brand brand-logo"style=" color :#c06225;" ></a>
       
        </div>
        <div class="navbar-menu-wrapper d-flex align-items-stretch">
        
          <div class="search-field d-none d-xl-block">
         
          </div>
          <ul class="navbar-nav navbar-nav-right">
           
          
           
            
            
          </ul>
          <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
            <span class="mdi mdi-menu"></span>
          </button>
        </div>
      </nav>
      <!-- partial -->
      <div class="container-fluid page-body-wrapper">
        <!-- partial:../../partials/_sidebar.html -->
        <nav class="sidebar sidebar-offcanvas" id="sidebar" style=" background-color :#ba6825">
          <ul class="nav">
           
            

        
           
          
           
          </ul>
        </nav>
        <!-- partial -->
       <div class="main-panel"  style=" background-color:#ba6825 ; " >
        <div class="content-wrapper"  style=" background-color: #ba6825" >
            <div class="row">
                <div class="col-lg-12 grid-margin stretch-card"  >
                    <div class="card" style="margin-left: -30px; border-radius: 20px 120px; box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.6);">
                        <div class="card-body"  >
                            <h1 class="card-title" style="color: #5b432e;
           font-size:30px;
            opacity: 0;
            animation: fadeIn 5s forwards;
            font-family: 'Montserrat', sans-serif;
            margin-left: 36%;
            font-weight: bold;">Reservation Table</h1>
                            <p class="card-description"><code></code></p>
                            <table class="table table-striped ">
                            <thead>
        <tr>
            <th style="color: #5b432e; font-weight: bold;font-family: 'Montserrat', sans-serif;"></th>
            <th style="color:#5b432e; font-weight: bold;font-family: 'Montserrat', sans-serif;">Client Name</th>
            <th style="color: #5b432e; font-weight: bold;font-family: 'Montserrat', sans-serif;">Voiture Brand</th>
            <th style="color: #5b432e; font-weight: bold;font-family: 'Montserrat', sans-serif;">Start Date</th>
            <th style="color: #5b432e; font-weight: bold;font-family: 'Montserrat', sans-serif;">End Date</th>
            <th style="color: #5b432e; font-weight: bold;font-family: 'Montserrat', sans-serif;">Payment Type</th>
            <th ></th>
           
       
            <th style="color: #5b432e; font-weight: bold;font-family: 'Montserrat', sans-serif;">Actions</th>
        </tr>
    </thead>
    <tbody>
        <% if (reservations != null) {
            for (Reservation reservation : reservations) { %>
                <tr>
                    <td></td>
                    <td><%= reservation.getClient().getNom()+" "+ reservation.getClient().getPrenom() %></td>
                    <td><%= reservation.getVoiture().getMarque() %></td>
                    <td><%= reservation.getDate_reservdebut() %></td>
                    <td><%= reservation.getDate_reservfin() %></td>
                    <td><%= reservation.getType_paiment() %></td>
                    <td>
               
                       <!-- Inside the table cell where you have the "Update Client" and "Update Car" buttons -->
<td>
    <a href="/Servlet-JSP-Project-School-Management-System/allclients" class="btn btn-warning btn-sm custom-btn">Update Clients</a>
<a href="/Servlet-JSP-Project-School-Management-System/cars" class="btn btn-danger btn-sm custom-btn">Update Cars</a>

</td>

                    </td>
                </tr>
        <% } } %>
    </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
              
          <!-- content-wrapper ends -->
          <!-- partial:../../partials/_footer.html -->
          <footer class="footer"  style=" background-color: #ba6825 ; ">
            <div class="footer-inner-wraper">
              <div class="d-sm-flex justify-content-center justify-content-sm-between">
               
              
              </div>
            </div>
          </footer>
          <!-- partial -->
        </div>
        <!-- main-panel ends -->
      </div>
      <!-- page-body-wrapper ends -->
    </div>
    <!-- container-scroller -->
    <!-- plugins:js -->
    <script src="../../assets/vendors/js/vendor.bundle.base.js"></script>
    <!-- endinject -->
    <!-- Plugin js for this page -->
    <!-- End plugin js for this page -->
    <!-- inject:js -->
    <script src="../../assets/js/off-canvas.js"></script>
    <script src="../../assets/js/hoverable-collapse.js"></script>
    <script src="../../assets/js/misc.js"></script>
    <!-- endinject -->
    <!-- Custom js for this page -->
    <!-- End custom js for this page -->
  </body>
</html>