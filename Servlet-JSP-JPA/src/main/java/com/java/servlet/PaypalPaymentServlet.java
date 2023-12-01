package com.jsp.servlet;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.StringReader;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.json.JSONTokener;


public class PaypalPaymentServlet extends HttpServlet {
	
    private static final long serialVersionUID = 1L;

    // Replace these with your actual PayPal credentials
    private static final String PAYPAL_CLIENT_ID = "AbgKW-bLkNh_Qhdf0-URLoYyvVC5YSnNCkVOELnVckhvWVzPtnfkA8sdzSYhLAf-d-AxYu8wWTjU3jCp";
    private static final String PAYPAL_SECRET_KEY = "ELkVoLj7E9pJvqr3mOnRxVOM-KjW632QQYwGjmTliiWwI28kWdE0kLACBgeT1WbRrltHIRGNGcGml0KX";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
    
        // Read the JSON payload from the request
        BufferedReader reader = new BufferedReader(new InputStreamReader(request.getInputStream()));
        StringBuilder json = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            json.append(line);
        }

        
        JSONObject jsonObject = new JSONObject(new JSONTokener(json.toString()));
        String paypalOrderId = jsonObject.getString("paypalOrderId");
        double amount = jsonObject.getDouble("amount");

      
        PrintWriter out = response.getWriter();
        out.println("Payment successful!");
    }
}
