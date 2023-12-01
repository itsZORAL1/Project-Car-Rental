package com.jsp.servlet;

import java.io.IOException;
import java.util.List;
import com.jsp.Models.Voiture;
import com.jsp.Models.Reservation;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


public class PersonnelCarsServlet extends HttpServlet {
    private EntityManagerFactory factory;

    @Override
    public void init() {
        factory = Persistence.createEntityManagerFactory("LocationVoiture");
    }

    @Override
    public void destroy() {
        if (factory != null && factory.isOpen()) {
            factory.close();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Fetch reservations data from JPA
        List<Voiture> voitures = getAllCars();

        // Store reservations data in the session
        request.getSession().setAttribute("voitures",voitures);

        // Redirect to the JSP page
        response.sendRedirect("pages/tables/car-table.jsp");
    }

    private List<Voiture> getAllCars() {
        EntityManager entityManager = factory.createEntityManager();
        Query query = entityManager.createQuery("SELECT r FROM Voiture r");
        List<Voiture> cars = query.getResultList();
        entityManager.close();  // Close the EntityManager to avoid resource leaks
        return cars;
    }
}