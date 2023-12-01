package com.jsp.servlet.LoginSignUp;

import java.io.IOException;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import com.jsp.Models.Client;
import com.jsp.Service.ClientSignUp;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/SignUpPage")
public class servletSignUp extends HttpServlet {
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
	            ClientSignUp clientService = new ClientSignUp(entityManager);


                String nom=rq.getParameter("Last Name");
                String prenom=rq.getParameter("First Name");
                String email=rq.getParameter("Email");
                String password=rq.getParameter("Password");
                String confirmpass=rq.getParameter("Confirm Password");

                if (prenom != null && !prenom.trim().isEmpty()
                        && nom != null && !nom.trim().isEmpty()
                        && email != null && !email.trim().isEmpty()
                        && password != null && !password.trim().isEmpty()
                        && confirmpass != null && !confirmpass.trim().isEmpty()) {
                    if (confirmpass.equals(password)) {
                        Client client = new Client();
                        client.setNom(nom);
                        client.setPrenom(prenom);
                        client.setEmail(email);
                        client.setPassword(password);
                        clientService.saveClient(client);
                        System.out.println("test1");
                        rq.getRequestDispatcher("Login.jsp").forward(rq, res);
                    } else {
                    	System.out.println("test2");
                        rq.setAttribute("errorMessage", "Password and Confirm Password do not match.");
                        rq.getRequestDispatcher("signUp.jsp").forward(rq, res);
                    }
                } else {
                	System.out.println("test3");
                    rq.setAttribute("errorMessage", "All fields are required.");
                    rq.getRequestDispatcher("signUp.jsp").forward(rq, res);
                }
	        } finally {
	            entityManager.close();
	        }

	       
	    }
}
