package com.jsp.servlet;

import com.jsp.Models.Voiture;
import com.jsp.Service.getCarService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import java.io.IOException;

@WebServlet("/carDetails")
public class CarDetailsServlet extends HttpServlet {
    private EntityManagerFactory entityManagerFactory;

    @Override
    public void init() throws ServletException {
        entityManagerFactory = Persistence.createEntityManagerFactory("LocationVoiture");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.print("servlettttttttttttttttttt");
    	int carId = Integer.parseInt(request.getParameter("carId"));
        String userId = request.getParameter("userId");

        getCarService carService = new getCarService(entityManagerFactory);
        EntityManager entityManager=entityManagerFactory.createEntityManager();
        Voiture car = carService.getCarById(carId,entityManager);

        if (car != null) {
            request.setAttribute("car", car);
            request.setAttribute("userId", userId);

            RequestDispatcher dispatcher = request.getRequestDispatcher("carDetails.jsp");
            dispatcher.forward(request, response);
        } else {
    
            System.err.println("Car is null for carId: " + carId);

        }
    }

    @Override
    public void destroy() {
        if (entityManagerFactory != null && entityManagerFactory.isOpen()) {
            entityManagerFactory.close();
        }
    }
}
