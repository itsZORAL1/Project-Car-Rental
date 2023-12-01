<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Edu+TAS+Beginner&family=Knewave&family=Roboto+Mono:wght@100&display=swap" rel="stylesheet">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <style>
        :root {
            --background: black;
            --color: #ffffff;
            --primary-color: #BB4430;
        }

        * {
            box-sizing: border-box;
        }

        html {
            scroll-behavior: smooth;
        }

        body {
            margin: 0;
            box-sizing: border-box;
            font-family: "poppins";
            background: var(--background);
            color: var(--color);
            letter-spacing: 1px;
            transition: background 0.2s ease;
            -webkit-transition: background 0.2s ease;
            -moz-transition: background 0.2s ease;
            -ms-transition: background 0.2s ease;
            -o-transition: background 0.2s ease;
            display: flex;
            align-items: center;
            justify-content: center; /* Horizontally center content */
        }

        a {
            text-decoration: none;
            color: var(--color);
        }

        h1 {
            font-size: 2.5rem;
            margin-left:35%;
            font-family:Edu TAS Beginner;
            margin-top:-6px;
           
        }

    h1.opacity {
        opacity: 0.6;
        animation: fadeIn 1.5s ease-in-out;
    }

    @keyframes fadeIn {
        0% {
            opacity: 0;
        }
        100% {
            opacity: 0.6;
        }
    }
        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            flex: 1; /* Fill the available horizontal space */
        }

        .login-container {
            position: relative;
            width: 70%; /* 70% width for the form container */
            display: flex;
            justify-content: center;
            align-items: center;

   
            
        }

        .form-container {
           width: 70%; 
        height: 90vh; 
            border: 1px solid hsla(0, 0%, 65%, 0.158);
            box-shadow: 0 0 36px 1px rgba(0, 0, 0, 0.2);
            border-radius: 10px;
            backdrop-filter: blur(20px);
            z-index: 99;
            padding: 2rem;
            -webkit-border-radius: 10px;
            -moz-border-radius: 10px;
            -ms-border-radius: 10px;
            -o-border-radius: 10px;
        }

        .login-container form input {
            display: block;
            padding: 14.5px;
           margin-top:0.5rem;
            width: 100%;
            color: var(--color);
            outline: none;
            background-color: #9191911f;
            border: none;
            border-radius: 5px;
            font-weight: 500;
            letter-spacing: 0.8px;
            font-size: 15px;
            backdrop-filter: blur(15px);
        }

        .login-container form input:focus {
            box-shadow: 0 0 16px 1px rgba(0, 0, 0, 0.2);
            animation: wobble 0.3s ease-in;
        }

        .login-container form button {
            background-color: var(--primary-color);
            margin-top: 1rem;
            color: var(--color);
            display: block;
            padding: 13px;
            border-radius: 5px;
            outline: none;
            font-size: 18px;
            letter-spacing: 1.5px;
            font-weight: bold;
            width: 100%;
            cursor: pointer;
            margin-bottom: 2rem;
        }
        .form-group {
    margin-top: 1.5rem;
}

        .login-container form button:hover {
            box-shadow: 0 0 10px 1px rgba(0, 0, 0, 0.15);
            transform: scale(1.02);
        }

        .circle {
            width: 8rem;
            height: 8rem;
            background: var(--primary-color);
            border-radius: 50%;
            -webkit-border-radius: 50%;
            -moz-border-radius: 50%;
            -ms-border-radius: 50%;
            -o-border-radius: 50%;
            position: absolute;
        }

        .illustration {
            position: absolute;
            top: -14%;
            right: -2px;
            width: 90%;
        }

        .circle-one {
            top: 0;
            left: 0;
            z-index: -1;
            transform: translate(-45%, -45%);
            -webkit-transform: translate(-45%, -45%);
            -moz-transform: translate(-45%, -45%);
            -ms-transform: translate(-45%, -45%);
            -o-transform: translate(-45%, -45%);
        }

        .circle-two {
            bottom: 0;
            right: 0;
            z-index: -1;
            transform: translate(45%, 45%);
            -webkit-transform: translate(45%, 45%);
            -moz-transform: translate(45%, 45%);
            -ms-transform: translate(45%, 45%);
            -o-transform: translate(45%, 45%);
        }

        .register-forget {
            margin: 1rem 0;
            display: flex;
            justify-content: space-between;
        }

        .opacity {
            opacity: 0.6;
        }

        .theme-btn-container {
            position: absolute;
            left: 0;
            bottom: 2rem;
        }

        .theme-btn {
            cursor: pointer;
            transition: all 0.3s ease-in;
        }

        .theme-btn:hover {
            width: 40px !important;
        }

        .right-image {
            width: 30%; /* 30% width for the image container */
        }

        .right-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            margin-left:-100px;
        }

        @keyframes wobble {
            0% {
                transform: scale(1.025);
                -webkit-transform: scale(1.025);
                -moz-transform: scale(1.025);
                -ms-transform: scale(1.025);
                -o-transform: scale(1.025);
            }
            25% {
                transform: scale(1);
                -webkit-transform: scale(1);
                -moz-transform: scale(1);
                -ms-transform: scale(1);
                -o-transform: scale(1);
            }
            75% {
                transform: scale(1.025);
                -webkit-transform: scale(1.025);
                -moz-transform: scale(1.025);
                -ms-transform: scale(1.025);
                -o-transform: scale(1.025);
            }
            100% {
                transform: scale(1);
                -webkit-transform: scale(1);
                -moz-transform: scale(1);
                -ms-transform: scale(1);
                -o-transform: scale(1);
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="login-container">
            <div class="form-container">
                <h1 class="opacity">ADD ur CAR</h1>
               <form action="AddCarServlet" method="post" class="form">
    <div class="form-group">
        <label for="marque">Car Brand</label>
        <input type="text" name="marque" id="marque" required>
    </div>
    <div class="form-group">
 <label for="currencyInput">Enter Amount and Currency (e.g., 130UGB):</label>
  <input type="text" id="currencyInput" onkeyup="convertCurrency()" name="prix">
  <div id="result"></div>
    </div>
<input type="text" id="convertedPrix" name="convertedPrix" readonly style="display: none;">

   
    <div class="form-group">
        <label for="date_dispo">Availability Date</label>
        <input type="date" name="date_dispo" id="date_dispo" required>
    </div>
    <div class="form-group">
        <label for="annee_fabrication">Manufacture Year</label>
        <input type="date" name="annee_fabrication" id="annee_fabrication" required>
    </div>
    <div class="form-group">
        <label for="image">Car Image</label>
        <input type="file" name="image" id="image" accept="image/*" required>
    </div>
    <button type="submit">Add Car</button>
</form>

                <% String errorMessage = (String) request.getAttribute("errorMessage");
        		
                   if (errorMessage != null) { %>
                    <p class="error-message"><%= errorMessage %></p>
                <% } %>
            </div>
        </div>
        <div class="right-image">
        <img src='https://i.postimg.cc/15tQzgr9/voiture.jpg' border='0' alt='voiture'/>
        </div>
        <div class="theme-btn-container"></div>
    </div>
    <script>
    function convertCurrency() {
        const inputField = document.getElementById('currencyInput');
        const resultField = document.getElementById('result');
        const convertedPrix = document.getElementById('convertedPrix');

        const inputText = inputField.value.trim();
        const currencyCode = inputText.slice(-3);
        const amount = inputText.slice(0, -3);

        // You can implement a currency conversion logic here
        // For simplicity, let's assume a conversion rate of 1 UGB (British Pound) to 10 MAD (Moroccan Dirham)
        const conversionRate = 10;
        const convertedAmount = amount * conversionRate;

        if (!isNaN(convertedAmount)) {
          resultField.innerText = `Converted Amount: ${convertedAmount} MAD`;
          convertedPrix.value = `${convertedAmount} MAD`; 
        } else {
          resultField.innerText = 'Invalid input';
        }
      }
        const setTheme = (theme) => {
            const root = document.querySelector(":root");
            root.style.setProperty("--background", theme.background);
            root.style.setProperty("--color", theme.color);
            root.style.setProperty("--primary-color", theme.primaryColor);
            root.style.setProperty("--glass-color", theme.glassColor);
        };

        const displayThemeButtons = () => {
            const btnContainer = document.querySelector(".theme-btn-container");
            themes.forEach((theme) => {
                const div = document.createElement("div");
                div.className = "theme-btn";
                div.style.cssText = `background: ${theme.background}; width: 25px; height: 25px`;
                btnContainer.appendChild(div);
                div.addEventListener("click", () => setTheme(theme));
            });
        };

        displayThemeButtons();
    </script>
</body>
</html>