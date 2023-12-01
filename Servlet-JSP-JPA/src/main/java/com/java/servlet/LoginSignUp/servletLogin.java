package com.jsp.servlet.LoginSignUp;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import com.jsp.Models.Client;
import com.jsp.Models.Personnel;
import com.jsp.Models.Reservation;
import com.jsp.Models.Voiture;
import com.jsp.Service.ClientLogIn;
import com.jsp.Service.PersonnelLog;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import javax.persistence.Query;
import javax.servlet.http.HttpSession;

@WebServlet("/LogInPage")
public class servletLogin  extends HttpServlet{
	private EntityManagerFactory factory;
	@Override
	public void init() {
		factory =Persistence.createEntityManagerFactory("LocationVoiture");
	}
	@Override
	public void destroy() {
		if(factory!=null & factory.isOpen()) {
			factory.close();
		}
	}
	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	    EntityManager em = factory.createEntityManager();

	    String EMAIL = (String) req.getParameter("EMAIL");
	    String PASSWORD = (String) req.getParameter("PASSWORD");
	    ClientLogIn log = new ClientLogIn(em);
	    PersonnelLog log2 = new PersonnelLog(em);
	    Client client = new Client();
	    Personnel pers = new Personnel();
	    pers.setEmail(EMAIL);
	    pers.setPassword(PASSWORD);
	    client.setEmail(EMAIL);
	    client.setPassword(PASSWORD);
	    Cookie[] cookies = req.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("user".equals(cookie.getName()) || "userID".equals(cookie.getName())) {
                    cookie.setMaxAge(0); 
                    res.addCookie(cookie);
                }
            }
        }

	    if (log.validateUser(client) == true) {

	        String jpql = "select e from client e where e.email=:email and e.password=:pass";
	        String jpql2 = "select e from Voiture e ";
	        Query query = (Query) em.createQuery(jpql);
	        Query query2 = (Query) em.createQuery(jpql2);
	        query.setParameter("email", EMAIL);
	        query.setParameter("pass", PASSWORD);
	        List<Voiture> listvoiture = query2.getResultList();
	        Client clientName = (Client) query.getSingleResult();
	        Cookie userCookie = new Cookie("user", clientName.getNom() + "-" + clientName.getPrenom());
	        Cookie userCookieID = new Cookie("userID", String.valueOf(clientName.getId_client()));
	        userCookie.setDomain(req.getServerName());
	        userCookieID.setDomain(req.getServerName());

	        userCookie.setPath(req.getContextPath());
	        userCookieID.setPath(req.getContextPath());

	        userCookie.setHttpOnly(true);
	        userCookieID.setHttpOnly(true);
	        res.addCookie(userCookie);
	        res.addCookie(userCookieID);

	        req.setAttribute("voitures", listvoiture);
	        req.getRequestDispatcher("index.jsp").forward(req, res);
	    } else if (log2.validatePersonnel(pers) == true) {
	    	String jpql = "select e from personnel e where e.email=:email and e.password=:pass";
	       
	        Query query = (Query) em.createQuery(jpql);
	   
	        query.setParameter("email", EMAIL);
	        query.setParameter("pass", PASSWORD);

	        Personnel persName = (Personnel) query.getSingleResult();
	        Cookie userCookie = new Cookie("persName", persName.getNom() + "-" + persName.getPrenom());
	        Cookie userCookieID = new Cookie("persID", String.valueOf(persName.getPersonnel_id()));
	        userCookie.setDomain(req.getServerName());
	        userCookieID.setDomain(req.getServerName());

	        userCookie.setPath(req.getContextPath());
	        userCookieID.setPath(req.getContextPath());

	        userCookie.setHttpOnly(true);
	        userCookieID.setHttpOnly(true);
	        res.addCookie(userCookie);
	        res.addCookie(userCookieID);

	 System.out.println(persName.getNom() + "-" + persName.getPrenom());
	        req.getRequestDispatcher("EspacePersonnel.jsp").forward(req, res);
	    } else {
	    	// Before forwarding
	    	req.setAttribute("errorMessage", "Invalid username or password");

	    	// Forwarding to Login.jsp
	    	req.getRequestDispatcher("Login.jsp").forward(req, res);

	    }

	    em.close();
	}


}
