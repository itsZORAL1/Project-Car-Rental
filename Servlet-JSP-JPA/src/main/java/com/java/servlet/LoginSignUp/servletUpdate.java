package com.jsp.servlet.LoginSignUp;


import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import com.jsp.Models.Client;
import com.jsp.Models.Personnel;
import com.jsp.Service.ClientSignUp;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/UpdatePage")
public class servletUpdate extends HttpServlet {
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
                	Personnel pers= entityManager.find(Personnel.class,Integer.parseInt(ID));
                	pers.setEmail(email);
                	pers.setNom(nom);
                	pers.setPassword(password);
                	pers.setPrenom(prenom);
                	
                	entityManager.getTransaction().begin();
                	entityManager.merge(pers);
                	entityManager.getTransaction().commit();
                	rq.getRequestDispatcher("Login.jsp").forward(rq, res);
                	
                    
                } else {
                	
                	
                            res.sendRedirect("/Servlet-JSP-Project-School-Management-System/updatepersonnel.jsp?persId="+ID);
                }
	        } finally {
	            entityManager.close();
	        }

	       
	    }
}

