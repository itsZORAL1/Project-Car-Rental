package com.jsp.servlet;

import java.io.IOException;
import java.sql.Date;
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
import com.jsp.Models.Voiture;
import com.jsp.Models.Reservation;

public class OneReservationUpdate extends HttpServlet {
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
            int carId = Integer.parseInt(request.getParameter("carId"));
System.out.println(carId);
           
            Voiture carToUpdate = em.find(Voiture.class, carId);
          


            // Update the client information
            carToUpdate.setMarque(request.getParameter("carMarque"));
            carToUpdate.setPrix(request.getParameter("carPrix"));
            carToUpdate.setfabrication(Date.valueOf(request.getParameter("carFabrication")));
            carToUpdate.setDispo(Date.valueOf(request.getParameter("carDispo")));
            
        



            
            em.getTransaction().begin();
            em.merge(carToUpdate);
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
