package com.jsp.servlet;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.jsp.Models.Client;
import com.jsp.Models.Reservation;

public class ClientUpdate extends HttpServlet {
    private static final long serialVersionUID = 1L;
    EntityManagerFactory emf = Persistence.createEntityManagerFactory("LocationVoiture");
    @Override
    public void destroy() {
        if (emf  != null && emf .isOpen()) {
        	emf .close();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        EntityManager em = emf.createEntityManager();

        try {
        	
            // Retrieve client ID from the request
            int clientId = Integer.parseInt(request.getParameter("clientId"));
System.out.println(clientId);
            // Retrieve the client from the database using the ID
            Client clientToUpdate = em.find(Client.class, clientId);
          


            // Update the client information
            clientToUpdate.setNom(request.getParameter("clientName"));
            clientToUpdate.setPrenom(request.getParameter("clientPrenom"));
            clientToUpdate.setEmail(request.getParameter("clientEmail"));
            clientToUpdate.setPassword(request.getParameter("clientPassword"));
            
          
            System.out.println(" Client ID: " + clientId);



            
            em.getTransaction().begin();
            em.merge(clientToUpdate);
            em.getTransaction().commit();
            List<Reservation> reservations = getAllReservations();

            request.getSession(false).setAttribute("reservations", reservations);
         
            
           

            // Redirect back to the previous page where the update button was clicked
            response.sendRedirect("pages/tables/basic-table.jsp");
           
        } catch (Exception e) {
            // Handle exceptions appropriately
            e.printStackTrace();
            response.sendRedirect("/Servlet-JSP-Project-School-Management-System/errorPage.jsp");
        } finally {
            em.close();
          
        }
    }
    private List<Reservation> getAllReservations() {
        EntityManager entityManager = emf.createEntityManager();
        Query query = entityManager.createQuery("SELECT r FROM reservation r");
        List<Reservation> reservations = query.getResultList();
        entityManager.close();  
        return reservations;
    }
}
