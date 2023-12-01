package com.jsp.servlet;

import com.stripe.Stripe;
import com.stripe.exception.StripeException;
import com.stripe.model.Charge;
import com.stripe.param.ChargeCreateParams;

import org.json.JSONObject;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.IOException;
import java.util.Date;


public class PaymentServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {
	    String userId = (String) request.getSession().getAttribute("userId");
	    String carId = (String) request.getSession().getAttribute("carId");
	    String resrvdatedebut = (String) request.getSession().getAttribute("resrvdatedebut");
	    String resrvdatefin = (String) request.getSession().getAttribute("resrvdatefin");
	    String carPrix = (String) request.getSession().getAttribute("carPrix");
	    String typePaimenent = (String) request.getSession().getAttribute("typePaiment");
	    String Prixtotal = (String) request.getSession().getAttribute("totalPrice");
	    String ResDate = (String) request.getSession().getAttribute("ResDate");

	    System.out.print(typePaimenent);

	    // Get parameters directly from request
	    String token = request.getParameter("stripeToken");
	    int amount = Integer.parseInt(request.getParameter("amount"));  // You might get the amount from the client

	    // Set your secret key: remember to change this to your live secret key in production
	    Stripe.apiKey = "private key";

	    // Create a charge
	    try {
	        Charge charge = Charge.create(
	                new ChargeCreateParams.Builder()
	                        .setAmount((long) amount)
	                        .setCurrency("MAD")
	                        .setSource(token)
	                        .build()
	        );

	        request.setAttribute("userId", userId);
	        request.setAttribute("carId", carId);
	        request.setAttribute("resrvdatedebut", resrvdatedebut);
	        request.setAttribute("resrvdatefin", resrvdatefin);
	        request.setAttribute("carPrix", carPrix);
	        request.setAttribute("typePaimenent", typePaimenent);
	        request.setAttribute("Prixtotal", Prixtotal);
	        request.setAttribute("ResDate", ResDate);
	        System.out.print(ResDate + " yyyyy");

	        request.getRequestDispatcher("/reserveCar").forward(request, response);
	        response.getWriter().write("Payment successful!" + " " + amount + "MAD");
	    } catch (StripeException e) {
	        // Handle charge failure
	        response.getWriter().write("Error: " + e.getMessage());
	    }
	}

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        StringBuilder buffer = new StringBuilder();
        BufferedReader reader = request.getReader();
        String line;
        while ((line = reader.readLine()) != null) {
            buffer.append(line);
        }

        JSONObject json = new JSONObject(buffer.toString());
        String token = json.getString("stripeToken");
        int amount = json.getInt("amount");  // You might get the amount from the client

        // Set your secret key: remember to change this to your live secret key in production
        Stripe.apiKey = "private key";

        // Create a charge
        try {
            Charge charge = Charge.create(
                    new ChargeCreateParams.Builder()
                            .setAmount((long) amount)
                            .setCurrency("usd")
                            .setSource(token)
                            .build()
            );

            // Handle successful charge
            response.getWriter().write("Payment successful!");
        } catch (StripeException e) {
            // Handle charge failure
            response.getWriter().write("Error: " + e.getMessage());
        }
    }
}

