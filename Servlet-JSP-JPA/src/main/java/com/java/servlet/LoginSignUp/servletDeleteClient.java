package com.jsp.servlet.LoginSignUp;


import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import com.jsp.Models.Client;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/clientDeleteAccount")
public class servletDeleteClient extends HttpServlet {
	 private EntityManagerFactory factory;

	    @Override
	    public void init() throws ServletException {
	        factory = Persistence.createEntityManagerFactory("LocationVoiture");
	    }

	    @Override
	    public void destroy() {
	        if (factory != null && factory.isOpen()) {
	            factory.close();
	        }
	    }

	    @Override
	    public void doGet(HttpServletRequest rq, HttpServletResponse res) throws IOException, ServletException {
	        EntityManager entityManager = factory.createEntityManager();
	        try {
	         

	        	int clientId = Integer.parseInt(rq.getParameter("ID"));
	        	 Client clientToUpdate = entityManager.find(Client.class, clientId);

	        	 entityManager.getTransaction().begin();
	        
	        	 entityManager.createQuery("DELETE FROM reservation r WHERE r.client = :client")
	               .setParameter("client", clientToUpdate )
	               .executeUpdate();

	        	 entityManager.remove(clientToUpdate );
	        	 entityManager.getTransaction().commit();
	        	 res.sendRedirect("/Servlet-JSP-Project-School-Management-System/signUp.jsp?");
	          
	        	
	        } finally {
	            entityManager.close();
	        }

	       
	    }
}



