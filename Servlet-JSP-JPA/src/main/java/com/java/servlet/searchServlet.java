package com.jsp.servlet;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Date;
import java.util.Calendar;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.persistence.Query;

import com.jsp.Models.Reservation;
import com.jsp.Models.Voiture;
import com.jsp.Models.Paiment;
import com.jsp.Models.Client;

import com.jsp.Service.getCarService;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/search")
public class searchServlet extends HttpServlet{
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
		System.out.print("tessssssssssssssssst");
		EntityManager em=factory.createEntityManager();

				String jpql2="select e from Voiture e ";

				Query query2=(Query) em.createQuery(jpql2);
				List<Voiture> listvoiture =query2.getResultList();
				

				req.setAttribute("voitures", listvoiture);
				req.getRequestDispatcher("index.jsp").forward(req, res);
			
			
	em.close();
	
	}

}

