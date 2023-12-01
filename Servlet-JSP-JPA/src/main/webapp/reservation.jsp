
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%@ page import="java.util.List, com.jsp.Models.Reservation" %>

<html>
<head>
    <title>Reservation List</title>
</head>
<body>
    <h1>Reservation List</h1>
    <table border="1">
        <tr>
 
            <th>Client Email</th>
            <th>Voiture Marque</th>
        
        </tr>
        <%
            // Replace this code with your logic to retrieve reservations from the database
            // For simplicity, we assume you have a list of reservations available
            List<Reservation> reservations =(List<Reservation>) request.getAttribute("reservation");

            for (Reservation reservation : reservations) {
        %>
            <tr>
   
                <td><%= reservation.getClient().getEmail() %>
                <td><%= reservation.getVoiture().getMarque() %></td>
               
            </tr>
        <%
            }
        %>
    </table>
</body>
</html>
