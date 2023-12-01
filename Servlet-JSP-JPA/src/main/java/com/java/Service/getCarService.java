package com.jsp.Service;

import com.jsp.Models.Voiture;

import java.util.Calendar;
import java.util.Date;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;

public class getCarService {
    private final EntityManagerFactory factory;

    public getCarService(EntityManagerFactory factory) {
        this.factory = factory;
    }
    public void updateCarAvailabilityDate(int carId, Date lastDateOfReservation, EntityManager entityManager) {
        EntityTransaction transaction = entityManager.getTransaction();

        try {
            if (!transaction.isActive()) {
                transaction.begin();
            }

            Voiture car = entityManager.find(Voiture.class, carId);

            // Check if the car is found in the database
            if (car != null) {
                // Calculate the new availability date as one day after the last date of reservation
                Date newAvailabilityDate = addDays(lastDateOfReservation, 1);

                car.setDispo(newAvailabilityDate);
                entityManager.merge(car);
                transaction.commit();
            } else {
                // Handle the case where the car with the given id is not found
                System.out.println("Car with id " + carId + " not found.");
            }
        } catch (Exception e) {
            if (transaction != null && transaction.isActive()) {
                transaction.rollback();
            }
            e.printStackTrace();
            // Handle the exception as needed
        }
    }

    // Helper method to add days to a date
    private Date addDays(Date date, int days) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.add(Calendar.DAY_OF_YEAR, days);
        return new Date(calendar.getTimeInMillis());
    }



    public Voiture getCarById(int carId, EntityManager entityManager) {
        Voiture car = null;

        try {
            // Use TypedQuery to fetch the car based on the carId
            TypedQuery<Voiture> query = entityManager.createQuery(
                    "SELECT v FROM Voiture v WHERE v.id_voiture = :carId", Voiture.class);
            query.setParameter("carId", carId);

            // Execute the query and get the single result
            car = query.getSingleResult();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return car;
    }
}
