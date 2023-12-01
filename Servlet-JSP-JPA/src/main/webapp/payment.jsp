<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
    <title>Payment Details</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #2a2a2a;
            color: #e47142;
            display: flex;
            align-items: center;
            height: 100vh;
        }
        
        h1 {
            color: #2a2a2a;
            margin-bottom: 70px;
            opacity: 0;
            animation: fadeIn 5s forwards;
            font-family: 'Montserrat', sans-serif;
            margin-left: 34%;
            font-weight: bold;
        }

        @keyframes fadeIn {
            to {
                opacity: 1;
            }
        }

        #payment-container {
            display: flex;
            justify-content: space-around;
            width: 80%;
            margin: auto;
        }

        #icons {
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        #icons i {
            font-size: 80px; /* Larger size for the bank icon */
            color: #e47142;
            cursor: pointer;
            transition: color 0.3s ease-in-out;
            margin-bottom: 20px;
        }

        #icons i.bank-icon {
            font-size: 100px; /* Even larger size for better visibility */
        }

        #icons i:hover {
            color: #bf6728;
        }

        #payment-form {
            background-color: white;
            padding: 60px;
            border-radius: 10px 30px;
            width: 60%;
            box-shadow: 0 0 10px rgba(200, 97, 51, 0.3);
        }

        label {
            color: #e47142;
            font-weight: bold;
            display: block;
            margin-top: 15px;
        }

        input {
            width: calc(100% - 20px);
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #e47142;
            border-radius: 5px;
            background-color: #7a5943;
            color: #e47142;
        }

        button {
            background-color: #bf6728;
            color: #2a2a2a;
            padding: 10px 60px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease-in-out;
            margin-top: 40px;
            font-family: 'Montserrat', sans-serif;
            margin-left: 100%;
            font-weight: bold;
        }

        button:hover {
            background-color: #e47142;
        }

        #cardElement {
            margin-top: 30px;
            color: black;
        }
    </style>
    <!-- Include Stripe.js -->
    <script src="https://js.stripe.com/v3/"></script>
    <!-- Add Coinbase Commerce script -->
    <script src="https://commerce.coinbase.com/v2/checkout.js"></script>
    <script src="https://js.stripe.com/v3/"></script>
</head>

<body>

    <div id="payment-container">
        <div id="icons">
            <!-- Replaced existing icon with university icon for better representation of banks -->
            <i class="fas fa-university bank-icon"></i>
            <i class="fab fa-paypal"></i>
            <i class="fas fa-money-bill-wave bank-icon"></i>
        </div>

        <form id="payment-form" action="reserveCar" method="post">

            <h1>Payment Details</h1>

            <%
                // Store common parameters in session
                session.setAttribute("userId", request.getParameter("userId"));
                session.setAttribute("carId", request.getParameter("carId"));
                session.setAttribute("resrvdatedebut", request.getParameter("resrvdatedebut"));
                session.setAttribute("resrvdatefin", request.getParameter("resrvdatefin"));
                session.setAttribute("carPrix", request.getParameter("carPrix"));
                session.setAttribute("typePaiment", request.getParameter("typePaiment"));
                session.setAttribute("ResDate", request.getParameter("ResDate"));
                session.setAttribute("totalPrice", request.getParameter("totalPrice"));
               
            %>

            <%  String paymentType = request.getParameter("typePaiment");%>
            <input type="hidden" name="userId" value="<%= request.getParameter("userId") %>">
            <input type="hidden" name="carId" value="<%= request.getParameter("carId") %>">
            <input type="hidden" name="resrvdatedebut" value="<%= request.getParameter("resrvdatedebut") %>">
            <input type="hidden" name="resrvdatefin" value="<%= request.getParameter("resrvdatefin") %>">
            <input type="hidden" name="carPrix" value="<%= request.getParameter("carPrix") %>">
            <input type="hidden" name="typePaiment" value="<%= paymentType %>">
            <input type="hidden" name="ResDate" value="<%= request.getParameter("ResDate") %>">
            <input type="hidden" name="totalPrice" value="<%= request.getParameter("totalPrice") %>">
           

            <%
                if ("CART".equals(paymentType)) {
            %>
            <!-- Credit Card Section -->
            <label for="cardElement" style="font-family: 'Montserrat', sans-serif;font-weight:bold;">Credit Card Information</label>
            <div id="cardElement"></div>

            <!-- Submit button -->
            <button type="submit">Reserve Now</button>

            <!-- Script for Stripe integration -->
 <!-- Script for Stripe integration -->
<script>
    document.addEventListener('DOMContentLoaded', function () {
        var stripe = Stripe('pk_test_51OFiDdGdl01o1gyXU80n9G24TCdVRzklR7Nm39LsX2iBLi5n2cU7XHR2zzhKL58bs3gB1NaETjCdgS2yRFRJ4pHJ00QeoRgQZK');
        var elements = stripe.elements();
        var card = elements.create('card');

        card.mount('#cardElement');

        var form = document.getElementById('payment-form');
        form.addEventListener('submit', function (event) {
            event.preventDefault();

            stripe.createToken(card).then(function (result) {
                if (result.error) {
                    alert(result.error.message);
                } else {
                    var token = result.token.id;
                    var amount = parseInt(<%= request.getParameter("carPrix").replace("MAD","") %>);

                    // Create a hidden form dynamically
                    var hiddenForm = document.createElement('form');
                    hiddenForm.method = 'POST';
                    hiddenForm.action = '/Servlet-JSP-Project-School-Management-System/charge';
                    hiddenForm.style.display = 'none';

                    // Add token and amount as hidden input fields
                    var tokenInput = document.createElement('input');
                    tokenInput.type = 'hidden';
                    tokenInput.name = 'stripeToken';
                    tokenInput.value = token;
                    hiddenForm.appendChild(tokenInput);

                    var amountInput = document.createElement('input');
                    amountInput.type = 'hidden';
                    amountInput.name = 'amount';
                    amountInput.value = amount;
                    hiddenForm.appendChild(amountInput);

                    // Append the form to the document body and submit it
                    document.body.appendChild(hiddenForm);
                    hiddenForm.submit();
                }
            });
        });
    });
</script>


            <%
                } else if ("PAYPAL".equals(paymentType)) {
            %>
            <label for="paypalButton">Paypal Information:</label>
            <div id="paypalButton"></div>
            <button type="button" onclick="reserveNow()">Reserve Now</button>

            <script src="https://www.paypal.com/sdk/js?client-id=AbgKW-bLkNh_Qhdf0-URLoYyvVC5YSnNCkVOELnVckhvWVzPtnfkA8sdzSYhLAf-d-AxYu8wWTjU3jCp"></script>
            <script>
                function reserveNow() {
                    paypal.Buttons({
                        createOrder: function(data, actions) {
                            return actions.order.create({
                                purchase_units: [{
                                    amount: {
                                        value: '<%= request.getParameter("carPrix").replace("MAD","") %>',
                                    }
                                }]
                            });
                        },
                        onApprove: function(data, actions) {
                            return actions.order.capture().then(function(details) {
                                // Make an AJAX request to your Servlet
                                var xhr = new XMLHttpRequest();
                                xhr.open('POST', '/Servlet-JSP-Project-School-Management-System/paypal'); // Update with your actual Servlet mapping
                                xhr.setRequestHeader('Content-Type', 'application/json');

                                var payload = {
                                    paypalOrderId: data.orderID, // Send PayPal order ID to the Servlet
                                    amount: details.purchase_units[0].amount.value
                                };

                                xhr.onload = function() {
                                    if (xhr.status === 200) {
                                        alert(xhr.responseText);
                                        // Optionally, you can navigate after a successful response
                                        window.location.href = '/Servlet-JSP-Project-School-Management-System/index.jsp';
                                    } else {
                                        alert('Error during payment');
                                    }
                                };

                                xhr.send(JSON.stringify(payload));
                            });
                        },
                    }).render('#paypalButton');
                }
            </script>

            <%
                } else if ("ESPECE".equals(paymentType)) {
            %>
          
            <%
                }
            %>

        </form>
    </div>

    <!-- Script for Stripe integration -->
    <script>
    document.addEventListener('DOMContentLoaded', function () {
        var paymentType = '<%= request.getSession().getAttribute("typePaiment") %>';

        if (paymentType === 'ESPECE') {
            // If payment type is ESPECE, redirect to /Servlet-JSP-Project-School-Management-System/reservcar
            window.location.href = '/Servlet-JSP-Project-School-Management-System/reserveCar';
        }
    });
</script>
    
    <script>
        var stripe = Stripe('<YOUR_STRIPE_PUBLIC_KEY>');
        var elements = stripe.elements();

        // Create an instance of the card Element.
        var card = elements.create('card');

        // Add an instance of the card Element into the `cardElement` div.
        card.mount('#numeroCarte');

        // Handle real-time validation errors from the card Element.
        card.addEventListener('change', function(event) {
            var displayError = document.getElementById('cardErrors');
            if (event.error) {
                displayError.textContent = event.error.message;
            } else {
                displayError.textContent = '';
            }
        });

        // Handle form submission.
        var form = document.getElementById('payment-form');
        form.addEventListener('submit', function(event) {
            event.preventDefault();

            stripe.createToken(card).then(function(result) {
                if (result.error) {
                    // Inform the user if there was an error.
                    var errorElement = document.getElementById('cardErrors');
                    errorElement.textContent = result.error.message;
                } else {
                    // Send the token to your server.
                    stripeTokenHandler(result.token);
                }
            });
        });

        // Submit the form with the token ID.
        function stripeTokenHandler(token) {
            // Insert the token ID into the form so it gets submitted to the server.
            var form = document.getElementById('payment-form');
            var hiddenInput = document.createElement('input');
            hiddenInput.setAttribute('type', 'hidden');
            hiddenInput.setAttribute('name', 'stripeToken');
            hiddenInput.setAttribute('value', token.id);
            form.appendChild(hiddenInput);

            // Submit the form.
            form.submit();
        }
    </script>

    <!-- Script for PayPal integration -->
    <script src="https://www.paypal.com/sdk/js?client-id=<YOUR_PAYPAL_CLIENT_ID>&currency=USD"></script>
    <script>
        paypal.Buttons({
            createOrder: function(data, actions) {
                return actions.order.create({
                    purchase_units: [{
                        amount: {
                            value: '1.00'
                        }
                    }]
                });
            },
            onApprove: function(data, actions) {
                return actions.order.capture().then(function(details) {
                    alert('Transaction completed by ' + details.payer.name.given_name);
                });
            }
        }).render('#paypalButton');
    </script>

</body>

</html>
