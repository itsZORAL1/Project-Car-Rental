package com.jsp.servlet;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Date;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
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

@WebServlet("/reserveCar")
public class ReservationServlet extends HttpServlet {
    private EntityManagerFactory factory;
    private getCarService carService;

    @Override
    public void init() {
        factory = Persistence.createEntityManagerFactory("LocationVoiture");
        carService = new getCarService(factory);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      System.out.println("servleeeeeeeeeeeeeeeeeeeeeet");
   
    String userId = (String) request.getAttribute("userId");
    String Ptotal = (String) request.getAttribute("Prixtotal");
    String ResDate = (String) request.getAttribute("ResDate");
        int carId = Integer.parseInt((String) request.getAttribute("carId"));
        // Retrieve other parameters as needed

        System.out.println(Ptotal +" TESTING"+ResDate+"SEEEEEEEEEEE");
        EntityManager entityManager = factory.createEntityManager();
        EntityTransaction transaction = entityManager.getTransaction();
        Reservation reservation = null;

        
        try {
            transaction.begin();
            
            
		

            // Retrieve car and user entities
            Voiture car = carService.getCarById(carId,entityManager);
            Integer userIdInt = Integer.parseInt(userId);
            Client user = entityManager.find(Client.class, userIdInt);

            reservation = new Reservation();
            reservation.setClient(user);
            reservation.setVoiture(car);
            System.out.println("resrvdatedebut: " + request.getAttribute("resrvdatedebut"));
            reservation.setDate_reservdebut(Date.valueOf((String) request.getAttribute("resrvdatedebut")));
            reservation.setDate_reservfin(Date.valueOf((String) request.getAttribute("resrvdatefin")));
            reservation.setType_paiment(Paiment.valueOf(Paiment.class,(String) request.getAttribute("typePaimenent")));
        

            // Set the calculated price to the reservation
            reservation.setPrix(Float.parseFloat(Ptotal));
            reservation.setResDate(ResDate);
            


           


            entityManager.persist(reservation);
            Date newAvailabilityDate = addDays((Date) reservation.getDate_reservfin(), 1);

            car.setDispo(newAvailabilityDate);
            entityManager.merge(car);
            transaction.commit();
            String jpql="select e from client e where e.email=:email and e.password=:pass";
			String jpql2="select e from Voiture e ";
			Query query=(Query)  entityManager.createQuery(jpql);
			Query query2=(Query)  entityManager.createQuery(jpql2);
			query.setParameter("email", user.getEmail());
			query.setParameter("pass", user.getPassword());
		
			List<Voiture> listvoiture =query2.getResultList();
			Client  clientName = (Client) query.getSingleResult();
			Cookie userCookie = new Cookie("user", clientName.getNom()+"-"+clientName.getPrenom());  
			Cookie userCookieID = new Cookie("userID",String.valueOf(clientName.getId_client()) ); 
			userCookie.setDomain(request.getServerName());
			userCookieID.setDomain(request.getServerName());


			userCookie.setPath(request.getContextPath());
			userCookieID.setPath(request.getContextPath());

			userCookie.setHttpOnly(true);
			userCookieID.setHttpOnly(true);
			response.addCookie(userCookie);
			response.addCookie(userCookieID );

			
			request.setAttribute("voitures", listvoiture);
			request.getRequestDispatcher("index.jsp").forward(request, response);
			

        } catch (Exception e) {
            if (transaction != null && transaction.isActive()) {
                transaction.rollback();
            }
            e.printStackTrace();
            request.getRequestDispatcher("payment.jsp").forward(request, response);
        } finally {
            entityManager.close();
        }


	    
       
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("servleeeeeeeeeeeeeeeeeeeeeet");
     
        String userId = (String) request.getSession().getAttribute("userId");
	    String resrvdatedebut = (String) request.getSession().getAttribute("resrvdatedebut");
	    String resrvdatefin = (String) request.getSession().getAttribute("resrvdatefin");
	    String carPrix = (String) request.getSession().getAttribute("carPrix");
	    String typePaimenent = (String) request.getSession().getAttribute("typePaiment");
	    String Prixtotal = (String) request.getSession().getAttribute("totalPrice");
	    String ResDate = (String) request.getSession().getAttribute("ResDate");
      int carId = Integer.parseInt((String) request.getSession().getAttribute("carId"));
          // Retrieve other parameters as needed

          System.out.println(Prixtotal +" TESTING"+ResDate+"SEEEEEEEEEEE");
          EntityManager entityManager = factory.createEntityManager();
          EntityTransaction transaction = entityManager.getTransaction();
          Reservation reservation = null;

          
          try {
              transaction.begin();
              
              
  		

              // Retrieve car and user entities
              Voiture car = carService.getCarById(carId,entityManager);
              Integer userIdInt = Integer.parseInt(userId);
              Client user = entityManager.find(Client.class, userIdInt);

              reservation = new Reservation();
              reservation.setClient(user);
              reservation.setVoiture(car);
              reservation.setDate_reservdebut(Date.valueOf(resrvdatedebut));
              reservation.setDate_reservfin(Date.valueOf(resrvdatefin));
              reservation.setType_paiment(Paiment.valueOf(Paiment.class,typePaimenent ));
          

              // Set the calculated price to the reservation
              reservation.setPrix(Float.parseFloat(Prixtotal));
              reservation.setResDate(ResDate);
              


             


              entityManager.persist(reservation);
              Date newAvailabilityDate = addDays((Date) reservation.getDate_reservfin(), 1);

              car.setDispo(newAvailabilityDate);
              entityManager.merge(car);
              transaction.commit();
              String jpql="select e from client e where e.email=:email and e.password=:pass";
  			String jpql2="select e from Voiture e ";
  			Query query=(Query)  entityManager.createQuery(jpql);
  			Query query2=(Query)  entityManager.createQuery(jpql2);
  			query.setParameter("email", user.getEmail());
  			query.setParameter("pass", user.getPassword());
  		
  			List<Voiture> listvoiture =query2.getResultList();
  			Client  clientName = (Client) query.getSingleResult();
  			Cookie userCookie = new Cookie("user", clientName.getNom()+"-"+clientName.getPrenom());  
  			Cookie userCookieID = new Cookie("userID",String.valueOf(clientName.getId_client()) ); 
  			userCookie.setDomain(request.getServerName());
  			userCookieID.setDomain(request.getServerName());


  			userCookie.setPath(request.getContextPath());
  			userCookieID.setPath(request.getContextPath());

  			userCookie.setHttpOnly(true);
  			userCookieID.setHttpOnly(true);
  			response.addCookie(userCookie);
  			response.addCookie(userCookieID );

  			
  			request.setAttribute("voitures", listvoiture);
  			request.getRequestDispatcher("index.jsp").forward(request, response);
  			

          } catch (Exception e) {
              if (transaction != null && transaction.isActive()) {
                  transaction.rollback();
              }
              e.printStackTrace();
              request.getRequestDispatcher("payment.jsp").forward(request, response);
          } finally {
              entityManager.close();
          }


  	    
         
      }
   
    private Date addDays(Date date, int days) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.add(Calendar.DAY_OF_YEAR, days);
        return new Date(calendar.getTimeInMillis());
    }

    }

