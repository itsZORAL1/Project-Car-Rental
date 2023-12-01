<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
 <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&display=swap">
    <title>Reserve Car</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #2a2a2a;
            color: #fff;
            display: flex;
            justify-content: space-around;
            align-items: center;
            height: 100vh;
        }
        input, select{
        background-color:#c26d2c;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
        
        }
        input:hover{
        background-color: rgba(200, 97, 51, 0.5); 


        }

        form {
            background-color: #c26d2c;
            padding: 60px;
            width: 40%;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            margin-left:120px;
            box-shadow: 0 0 10px rgba(255, 255, 255, 0.3);
            
        }

        input, select, button {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            box-sizing: border-box;
            border: none;
            border-radius: 5px;
        }

        button {
            background-color: #c64621;
            color: #fff;
            padding: 10px 20px; /* Adjusted button size */
            cursor: pointer;
            transition: background-color 0.3s ease-in-out;
        }

        button:hover {
            background-color: #a2351b;
        }

        .invoice-container {
            background-color: #c26d2c;
            padding: 20px;
            width: 30%;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            display: none;
            margin-left:-40px;
            
        }
            h1 {
            color: #2a2a2a;
            margin-bottom: 70px; /* Increased margin */
            opacity: 0;
            animation: fadeIn 5s forwards;
          font-family: 'Montserrat', sans-serif;
          margin-left:10%;
        }

        @keyframes fadeIn {
            to {
                opacity: 1;
            }
        }


        .invoice-container p,
        .invoice-container span {
            color: #fff;
        }

        .invoice-container h2 {
            color: #dfa738; /* Different color for heading */
        }

        #totalPriceDisplay {
            font-weight: bold;
            font-size: 18px;
        }
        .facturebutton{
        width:120px;
        height:50px;
        border-raduis:30px;
        color:#2a2a2a;
        font-weight:bold;
        font-family: 'Montserrat', sans-serif;
        margin-left:-60px;
        
        }
    </style>
</head>
<body>

    <form action="payment.jsp" method="post">
        <!-- Reservation Information -->
        <h1> Continuation Reservation Form</h1>
        <input type="hidden" name="userId" value="<%= request.getParameter("userId") %>">
        <input type="hidden" name="carId" value="<%= request.getParameter("carId") %>">
        <input type="hidden" name="carPrix" value="<%= request.getParameter("carPrix") %>">
        <input type="hidden" name="ResDate" value="<%= request.getParameter("ResDate") %>">
        <input type="hidden" name="totalPrice" id="totalPrice" value="">
            
        <label for="resrvdatedebut" style="margin-top:-10px ; color:#7a5943;font-family: 'Montserrat', sans-serif; font-weight:bold"> Reservation Start Date:</label>
        <input type="date" name="resrvdatedebut" id="resrvdatedebut"  required>
        <label for="resrvdatefin" style="margin-top:-10px ; color:#7a5943;font-family: 'Montserrat', sans-serif; font-weight:bold"> Reservation  End Date:</label>
        <input type="date" name="resrvdatefin" id="resrvdatefin" required>

        <!-- Payment Type -->
        <label for="typePaiment"style="margin-top:4px ; color:#7a5943;font-family: 'Montserrat', sans-serif; font-weight:bold">Payment Type:</label>
        <select id="typePaiment" name="typePaiment">
            <option value="CART">Credit Card</option>
            <option value="PAYPAL">PayPal</option>
            <option value="ESPECE">Espece</option>
        </select>

        <input type="submit"  onclick="calculateTotalPrice2()" style="margin-top:15px ; background-color:#7a5943;font-family: 'Montserrat', sans-serif; font-weight:bold" value="PAYMENT">
    </form>

    <button onclick="calculateTotalPrice()" class="facturebutton"> GENERATE INVOICE</button>

    <!-- Second Half: Invoice -->
<!-- Second Half: Invoice -->
<div class="invoice-container" id="invoiceContainer" style="display: none; background-color: #fff; color: #2a2a2a; padding: 20px; border-radius: 10px; margin-left: -40px;">

    <h2 style="color: #c86133; text-align: center;">INVOICE</h2>

    <div style="border-bottom: 1px solid #c86133; margin-bottom: 10px;"></div>

    <h3 style="color: #c86133; font-family: 'Montserrat', sans-serif; font-weight:bold">Reservation Details</h3>
    <p><span id="carId"></span></p>
    <p style="color: #7a5943;font-family: 'Montserrat', sans-serif; font-weight:bold ">Car Brand: <span id="carBrand" style="color: black;font-family: 'Montserrat', sans-serif; font-weight:bold "><%= request.getParameter("carMarque") %></span></p>
    <p style="color: #7a5943;font-family: 'Montserrat', sans-serif; font-weight:bold ">Car Price: <span id="carPrice" style="color: black;font-family: 'Montserrat', sans-serif; font-weight:bold "><%= request.getParameter("carPrix") %></span></p>
    <p style="color: #7a5943;font-family: 'Montserrat', sans-serif; font-weight:bold ">Reservation Start Date: <span style="color: black;font-family: 'Montserrat', sans-serif; font-weight:bold "id="resrvdatedebutDisplay"></span></p>
    <p style="color: #7a5943;font-family: 'Montserrat', sans-serif; font-weight:bold ">Reservation End Date: <span style="color: black;font-family: 'Montserrat', sans-serif; font-weight:bold "id="resrvdatefinDisplay"></span></p>
    <p style="color: #7a5943;font-family: 'Montserrat', sans-serif; font-weight:bold ">Payment Type: <span style="color: black;font-family: 'Montserrat', sans-serif; font-weight:bold "id="typePaimentDisplay"></span></p>
    <p style="color: #7a5943;font-family: 'Montserrat', sans-serif; font-weight:bold ">Reservation Time: <span style="color: black;font-family: 'Montserrat', sans-serif; font-weight:bold "id="resvTimeDisplay"></span></p>

    <div style="border-bottom: 1px solid #c86133; margin-bottom: 10px;"></div>

    <h3 style="color: #c86133;font-family: 'Montserrat', sans-serif; font-weight:bold">Total Price</h3>
    <p style="color: #7a5943;font-family: 'Montserrat', sans-serif; font-weight:bold " id="totalPriceDisplay"></p>
</div>


    <script>
        function calculateTotalPrice() {
            var resrvdatedebut = document.getElementById("resrvdatedebut").value;
            var resrvdatefin = document.getElementById("resrvdatefin").value;
            var carPrix = parseFloat("<%= request.getParameter("carPrix").replace("MAD", "") %>");

            var reservationDebut = new Date(resrvdatedebut);
            var reservationFin = new Date(resrvdatefin);
            var numberOfDays = Math.ceil((reservationFin - reservationDebut) / (1000 * 60 * 60 * 24));
            var totalPrice = carPrix * numberOfDays;

           
            document.getElementById("resrvdatedebutDisplay").innerText = resrvdatedebut;
            document.getElementById("resrvdatefinDisplay").innerText = resrvdatefin;
            document.getElementById("typePaimentDisplay").innerText = document.getElementById("typePaiment").value;
            document.getElementById("resvTimeDisplay").innerText = "Reservation took place at <%= request.getParameter("ResDate") %>";
            document.getElementById("totalPriceDisplay").innerText = totalPrice.toFixed(2) + " MAD";
            document.getElementById("totalPrice").value = totalPrice.toFixed(2);

            
            document.getElementById("invoiceContainer").style.display = "block";
        }
        function calculateTotalPrice2() {
            var resrvdatedebut = document.getElementById("resrvdatedebut").value;
            var resrvdatefin = document.getElementById("resrvdatefin").value;
            var carPrix = parseFloat("<%= request.getParameter("carPrix").replace("MAD", "") %>");

            var reservationDebut = new Date(resrvdatedebut);
            var reservationFin = new Date(resrvdatefin);
            var numberOfDays = Math.ceil((reservationFin - reservationDebut) / (1000 * 60 * 60 * 24));
            var totalPrice = carPrix * numberOfDays;

           
            document.getElementById("totalPrice").value = totalPrice.toFixed(2);

        }
    </script>

</body>
</html>
