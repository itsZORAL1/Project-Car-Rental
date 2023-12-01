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


@WebServlet("/UpdateclientPage")
public class servletUpdateClient extends HttpServlet {
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
	    public void doPost(HttpServletRequest rq, HttpServletResponse res) throws IOException, ServletException {
	        EntityManager entityManager = factory.createEntityManager();
	        try {
	         

	        	String ID=rq.getParameter("ID");
                String nom=rq.getParameter("Last Name");
                String prenom=rq.getParameter("First Name");
                String email=rq.getParameter("Email");
                String password=rq.getParameter("Password");
                String confirmpass=rq.getParameter("Confirm Password");

                if ( ID !=null && prenom != null && !prenom.trim().isEmpty()
                        && nom != null && !nom.trim().isEmpty()
                        && email != null && !email.trim().isEmpty()
                        && password != null && !password.trim().isEmpty()
                        && confirmpass != null && !confirmpass.trim().isEmpty()&&password.equals(confirmpass)) {
                	Client client= entityManager.find(Client.class,Integer.parseInt(ID));
                	client.setEmail(email);
                	client.setNom(nom);
                	client.setPassword(password);
                	client.setPrenom(prenom);
                	
                	entityManager.getTransaction().begin();
                	entityManager.merge(client);
                	entityManager.getTransaction().commit();
                	rq.getRequestDispatcher("Login.jsp").forward(rq, res);
                	
                	
                } else {
                	
                   res.sendRedirect("/Servlet-JSP-Project-School-Management-System/clientUpdateAccount.jsp?ID="+ID);
                }
	        } finally {
	            entityManager.close();
	        }

	       
	    }
}


