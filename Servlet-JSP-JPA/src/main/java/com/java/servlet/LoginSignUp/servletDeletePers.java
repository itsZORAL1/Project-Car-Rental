package com.jsp.servlet.LoginSignUp;


import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import com.jsp.Models.Personnel;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/updatepersonnel")
public class servletDeletePers extends HttpServlet {
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
	         

	        	int clientId = Integer.parseInt(rq.getParameter("persId"));
	        	 Personnel clientToUpdate = entityManager.find(Personnel.class, clientId);

	        	 entityManager.getTransaction().begin();
	        
	        	 entityManager.remove(clientToUpdate );
	        	 entityManager.getTransaction().commit();
	        	 System.out.println("WORKED");
	          
	        	
	        } finally {
	            entityManager.close();
	        }

	       
	    }
}





