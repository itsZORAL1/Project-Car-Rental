<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import="java.net.URLDecoder , java.util.Date" %>
<html>
<head>
    <title>Car Details</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&display=swap">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #2a2a2a;
            color: #fff;
            margin: 0;
            padding: 0;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }

        .container {
            background-color: #3a3a3a;
            padding: 170px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(255, 255, 255, 0.1);
            text-align: center;
            position: relative;
            overflow: hidden;
        }

        h1 {
            color: #e46e4b;
            margin-bottom: 70px; /* Increased margin */
            opacity: 0;
            animation: fadeIn 5s forwards;
          font-family: 'Montserrat', sans-serif;
        }

        @keyframes fadeIn {
            to {
                opacity: 1;
            }
        }

        h2 {
            color: #c57339;
            font-style: italic;
            margin-top: 40px; /* Increased margin */
            margin-bottom: 20px; /* Increased margin */
        }

        p {
            color: #fff;
            font-style: italic;
            margin-bottom: 20px; /* Increased margin */
        }

        form {
            margin-top: 40px; /* Increased margin */
        }

        button {
            background-color: #dc6841;
            color: #fff;
            padding: 15px 30px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease-in-out;
            position: absolute;
            bottom: 20px;
            right: 20px;
        }

        button:hover {
            background-color: #be6928;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Car Details</h1>

        <%
            // Retrieve parameters from the URL
            String userId = request.getParameter("userId");
            String userName = request.getParameter("userName");
            int carId = Integer.parseInt(request.getParameter("carId"));
            String carMarque = URLDecoder.decode(request.getParameter("carMarque"), "UTF-8");
            String carPrix = URLDecoder.decode(request.getParameter("carPrix"), "UTF-8");
            String carImage = URLDecoder.decode(request.getParameter("carImage"), "UTF-8");
        %>
         <p><span style="color: #c57339;">Reservation Date:</span>  Reservation to be noted at <%=new Date() %> </p>
        <p><span style="color: #c57339;">User Name:</span> Reservation for <%= userName %></p>
        <p><span style="color: #c57339;">Car Brand:</span><%= carMarque %></p>
        <p><span style="color: #c57339;">Car Price:</span> <%= carPrix %> Per Day</p>

        

        <form action="reserveCar.jsp" method="post">
            <input type="hidden" name="userId" value="<%= userId %>">
            <input type="hidden" name="carId" value="<%= carId %>">
            <input type="hidden" name="carPrix" value="<%= carPrix %>">
            <input type="hidden" name="carMarque" value="<%= carMarque %>">
            <input type="hidden" name="ResDate" value="<%= new Date() %>">
            <button type="submit">Reserve Now</button>
        </form>
    </div>
</body>
</html>
