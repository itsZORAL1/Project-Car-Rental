package com.jsp.servlet;

import java.io.IOException;
import java.util.List;
import com.jsp.Models.Client;
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


public class PersonnelClientsServlet extends HttpServlet {
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
    	 List<Client> clients = getAllClients();

         // Store reservations data in the session
         request.getSession().setAttribute("clients", clients);

         // Redirect to the JSP page
         response.sendRedirect("pages/tables/client-table.jsp");
    }

    private List<Client> getAllClients() {
        EntityManager entityManager = factory.createEntityManager();
        Query query = entityManager.createQuery("SELECT r FROM client r");
        List<Client> clients = query.getResultList();
        entityManager.close();  // Close the EntityManager to avoid resource leaks
        return clients;
    }
}