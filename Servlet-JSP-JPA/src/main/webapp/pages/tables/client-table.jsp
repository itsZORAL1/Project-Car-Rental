<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import="java.util.List" %>
<%@ page import="com.jsp.Models.Client" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="com.jsp.Models.Reservation" %>

    

<% List<Client> clients = (List<Client>)request.getSession().getAttribute("clients"); %>
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
    <!-- End layout styles --  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&display=swap">
    <!-- endinject -->
    <!-- Plugin css for this page -->
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <!-- endinject -->
    <!-- Layout styles -->
    <link rel="stylesheet" href="../../assets/css/style.css">
    <style type="text/css">
    
       .custom-btn1 {
        /* Add your custom styling here */
        background-color: #d29518; /* Custom background color */
  
        border: 1px solid #d29518; /* Border color */
        border-radius: 30px; /* Border radius */
        padding: 15px 25px; /* Padding inside the button */
        text-decoration: none; /* Remove underline from links */
        transition: background-color 0.3s ease; /* Add a smooth transition effect */
    }

    .custom-btn1:hover {
        background-color:#363123; /* Change background color on hover */
        border-color: #363123; /* Change border color on hover */
    }
       .custom-btn2 {
        /* Add your custom styling here */
        background-color: #d29518; /* Custom background color */
  
        border: 1px solid #d29518; /* Border color */
        border-radius: 30px; /* Border radius */
        padding: 15px 25px; /* Padding inside the button */
        text-decoration: none; /* Remove underline from links */
        transition: background-color 0.3s ease; /* Add a smooth transition effect */
        margin-left:80px;
    }

    .custom-btn2:hover {
        background-color:#363123; /* Change background color on hover */
        border-color: #363123; /* Change border color on hover */
    }
    
     h1 ,th{
            color:#363123;
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
  <body>
    <div class="container-scroller" style=" background-color: #bc6629">
      <!-- partial:../../partials/_navbar.html -->
      <nav class="navbar default-layout-navbar col-lg-12 col-12 p-0 fixed-top d-flex flex-row" style=" background-color :#363123;">
        <div class="text-center navbar-brand-wrapper d-flex align-items-center justify-content-center" style=" background-color :#363123;">
          
        </div>
        <div class="navbar-menu-wrapper d-flex align-items-stretch">
          
          <div class="search-field d-none d-xl-block">
            
          </div>
          <ul class="navbar-nav navbar-nav-right">
           
          
           
          </ul>
       
        </div>
      </nav>
      <!-- partial -->
      <div class="container-fluid page-body-wrapper">
        <!-- partial:../../partials/_sidebar.html -->
        <nav class="sidebar sidebar-offcanvas" id="sidebar" style="background-color:#d29518">
          <ul class="nav">
        
            
            
          </ul>
        </nav>
        <!-- partial -->
       <div class="main-panel" style="background-color:#d29518">
        <div class="content-wrapper" style="background-color:#d29518">
            <div class="row">
                <div class="col-lg-12 grid-margin stretch-card">
                    <div class="card" style="margin-left: -30px; border-radius: 20px 120px; box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.6);">
                        <div class="card-body">
                            <h1 class="card-title" style="   margin-left: 40%;
            font-weight: bold; font-size:30px; color:#363123; font-family: 'Montserrat', sans-serif;">Client Table</h1>
                            <p class="card-description"><code></code></p>
                            <table class="table table-striped">
                            <thead>
        <tr>
            <th style=" font-weight: bold;color:#363123; font-family: 'Montserrat', sans-serif;">Client First Name</th>
            <th style=" font-weight: bold;color:#363123; font-family: 'Montserrat', sans-serif;">Client Last Name</th>
            <th style=" font-weight: bold;color:#363123; font-family: 'Montserrat', sans-serif;">Email</th>
             <th style=" font-weight: bold;color:#363123; font-family: 'Montserrat', sans-serif;">Password</th>
            <th style=" font-weight: bold;color:#363123; font-family: 'Montserrat', sans-serif;">Actions</th>
        </tr>
    </thead>
<tbody>
    <% if (clients != null) {
        for (Client client: clients) { %>
            <tr>
                <td><input type="text" name="nom" onchange="updateNom(this)"  value="<%= client.getNom() %>"  style="border: none; background-color: transparent; width: max-content;"></td>
                <td><input type="text" name="prenom"  onchange="updatePrenom(this)" value="<%= client.getPrenom() %>" style="border: none; background-color: transparent; width: max-content;"></td>
                <td><input type="text" name="email" onchange="updateEmail(this)"  value="<%= client.getEmail() %>" style="border: none; background-color: transparent; width: max-content;"></td>
                <td><input type="text" name="password" onchange="updatePassword(this)" value="<%= client.getPassword() %>" style="border: none; background-color: transparent; width: max-content;"></td>
                <td>
                    <form method="post" action="/Servlet-JSP-Project-School-Management-System/clientUpdate">
                        <!-- Add hidden input fields to store client information -->
                        <input type="hidden" name="clientId"  value="<%= client.getId_client() %>" />
                         <input type="hidden" name="clientName" id="clientNameHidden" value="<%= client.getNom()%>" />
                         <input type="hidden" name="clientPrenom"  id="clientPrenomHidden"value="<%= client.getPrenom()%>" />
                        <input type="hidden" name="clientEmail"  id="clientEmailHidden" value="<%=client.getEmail()%>" />
                        <input type="hidden" name="clientPassword" id="clientPasswordHidden"value="<%=client.getPassword()%>" />
                        <button type="submit" class="custom-btn1 ">Update</button>
                    </form>
                    <form method="post" action="/Servlet-JSP-Project-School-Management-System/clientDelete">
                        <!-- Add hidden input fields to store client information -->
                        <input type="hidden" name="clientId" value="<%= client.getId_client() %>" />
                        <button type="submit" class="custom-btn2 ">Delete</button>
                    </form>
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
          <footer class="footer" style="background-color:#d29518">
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
    <!-- plugins:js --
    >
    
 
    
    <script src="../../assets/vendors/js/vendor.bundle.base.js"></script>
    <!-- endinject -->
    <!-- Plugin js for this page -->
    <!-- End plugin js for this page -->
    <!-- inject:js -->
<script>
    function updateNom(inputElement) {
        var updatedValue = inputElement.value;
        console.log("Updated value for nom: " + updatedValue);
        
        // Set the updated value to the corresponding hidden input
        document.getElementById('clientNameHidden').value = updatedValue;
    }
    //--------------------------------------------------------
    function updatePrenom(inputElement) {
        var updatedValue = inputElement.value;
        console.log("Updated value for nom: " + updatedValue);
        
        // Set the updated value to the corresponding hidden input
        document.getElementById('clientPrenomHidden').value = updatedValue;
    }
    //---------------------------------------------------------
      function updateEmail(inputElement) {
        var updatedValue = inputElement.value;
        console.log("Updated value for nom: " + updatedValue);
        
        // Set the updated value to the corresponding hidden input
        document.getElementById('clientEmailHidden').value = updatedValue;
    }
      //---------------------------------------------------------
      function updatePassword(inputElement) {
        var updatedValue = inputElement.value;
        console.log("Updated value for nom: " + updatedValue);
        
        // Set the updated value to the corresponding hidden input
        document.getElementById('clientPasswordHidden').value = updatedValue;
    }
</script>
    <script src="../../assets/js/off-canvas.js"></script>
    <script src="../../assets/js/hoverable-collapse.js"></script>
    <script src="../../assets/js/misc.js"></script>
    <!-- endinject -->
    <!-- Custom js for this page -->
    <!-- End custom js for this page -->
  </body>
</html>