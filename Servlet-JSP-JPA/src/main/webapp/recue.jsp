<%@ page import="com.jsp.Models.Reservation" %>
<%@ page import="java.util.List" %>
<%@ page import="java.math.BigDecimal" %>

<!-- ... Your HTML header and other content ... -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&display=swap">
<style>
    body {
        font-family: 'Arial', sans-serif;
        background-color: #252219;
        color: #d9d9d9;
        margin: 0;
        padding: 0;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        height: 100vh;
    }
      .print-button {
        background-color: #c7753b; /* Orange color */
        color: #fff; /* White text color */
        border: none;
        padding: 10px 20px;
        border-radius: 5px;
        cursor: pointer;
        font-family: 'Montserrat', sans-serif;
        font-weight: bold;
        margin-top: 20px;
        transition: background-color 0.3s;
    }

    .print-button:hover {
        background-color: #a65a2a; /* Darker orange color on hover */
    }

    .receipt-container {
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        gap: 20px;
        margin-top: 20px;
    }

    .receipt {
        background-color: #fff;
        border: 1px solid #d9d9d9;
        border-radius: 10px;
        padding: 20px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        max-width: 400px;
        width: 100%;
    }

    p {
        margin: 5px 0;
        font-family: 'Montserrat', sans-serif;
        color: #c7753b;
        font-weight: bold;
    }

    span {
        font-weight: bold;
        color: #3d3d3d;
        font-family: 'Montserrat', sans-serif;
    }

    .total-price, .user-name {
        font-weight: bold;
        color: #c7753b; /* Orange color */
        margin-top: 15px;
    }

    .car-brand {
        color: #d15428; /* Reddish color */
        font-weight: bold;
    }

    .reservation-timing {
        color: #d2462f; /* Darker red color */
    }
</style>

<%-- Iterate over Reservations and display information --%>
<div class="receipt-container">
    <% for (Reservation reservation : (List<Reservation>)request.getAttribute("reservations")) { %>
        <div class="receipt">
            <h1>Receipt</h1>
            <p>Car Brand: <span><%= reservation.getVoiture().getMarque() %></span></p>
            <p>Reservation Start Date: <span><%= reservation.getDate_reservdebut() %></span></p>
            <p>Reservation End Date: <span><%= reservation.getDate_reservfin() %></span></p>
            <p>Payment Type: <span><%= reservation.getType_paiment() %></span></p>
            <p>Reservation Timing: <span><%= reservation.getResDate() %></span></p>
            <p>Reservation Price: <span><%= reservation.getPrix() %> MAD</span></p>
        </div>
    <% } %>
</div>

<%-- Display total price, user name, and other information --%>
<p class="total-price">Total Price: <%= request.getAttribute("totalPrice") %> MAD</p>
<p class="user-name">User Name: <%= request.getAttribute("userName") %></p>

<%-- Your additional HTML content here --%>

<%-- Your JavaScript content here --%>

<button class="print-button" onclick="printPage()">Print this page</button>
<!-- ... Your HTML footer and other content ... -->
<script>
        function printPage() {
            window.print();
        }
    </script>
