package com.jsp.servlet;

import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.jsp.Models.Reservation;
import com.jsp.Models.Voiture;

public class Recue extends HttpServlet {
    private EntityManagerFactory factory;

    @Override
    public void init() {
        factory = Persistence.createEntityManagerFactory("LocationVoiture");
    }

    @Override
    public void destroy() {
        if (factory != null & factory.isOpen()) {
            factory.close();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        EntityManager entityManager = factory.createEntityManager();
        EntityTransaction transaction = null;

        try {
            // Get the user ID from the request, assuming you have a parameter named "userId"
            int userId = Integer.parseInt(req.getParameter("userId").replace("/", ""));
            String name = req.getParameter("userName");

            // Begin a transaction
            transaction = entityManager.getTransaction();
            transaction.begin();

            // JPQL query to retrieve reservations for the given user ID
            Query query = entityManager.createQuery("SELECT r FROM reservation r WHERE r.client.id = :userId");
            query.setParameter("userId", userId);
            List<Reservation> reservations = query.getResultList();

            // Convert reservations to Voiture objects and calculate total price
            float  PRICE=0;
            BigDecimal totalPrice = BigDecimal.ZERO;
            List<Voiture> voitures = new ArrayList<>();
            for (Reservation reservation : reservations) {
                Voiture voiture = reservation.getVoiture();
                  PRICE+=reservation.getPrix();
                
                try {
                    String priceString = voiture.getPrix().replaceAll("[^\\d.]+", "");
                    if (!priceString.isEmpty()) {
                        BigDecimal carPrice = new BigDecimal(priceString);
                        totalPrice = totalPrice.add(carPrice);
                    } else {
                        // Handle the case where the price string is empty
                    }
                } catch (NumberFormatException e) {
                    // Handle the case where the price is not a valid number
                    e.printStackTrace();
                }

                // Add the Voiture to the list
                voitures.add(voiture);
            }

            // Set total price, reservations, user name, and voitures as attributes
            req.setAttribute("totalPrice", PRICE);
            req.setAttribute("reservations", reservations);
            req.setAttribute("userName", name);
            req.setAttribute("voitures", voitures);

            // Forward the request to the facture JSP
            req.getRequestDispatcher("recue.jsp").forward(req, res);

            // Commit the transaction
            transaction.commit();
        } catch (Exception e) {
            // Rollback the transaction in case of an exception
            if (transaction != null && transaction.isActive()) {
                transaction.rollback();
            }
            e.printStackTrace();
        } finally {
            // Close the EntityManager
            if (entityManager != null && entityManager.isOpen()) {
                entityManager.close();
            }
        }
    }
}
