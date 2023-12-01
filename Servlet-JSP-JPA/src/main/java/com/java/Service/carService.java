package com.jsp.Service;


import com.jsp.Models.Voiture;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import java.sql.Date;

public class carService {
    private final EntityManagerFactory factory;

    public carService(EntityManagerFactory factory) {
        this.factory = factory;
    }

    public void addCar(String marque, String prix, Date date_dispo, Date annee_fabrication, String image_path) {
        EntityManager entityManager = factory.createEntityManager();

        try {
            entityManager.getTransaction().begin();

            Voiture voiture = new Voiture();
            voiture.setMarque(marque);
            voiture.setPrix(prix);
            voiture.setDispo(date_dispo);
            voiture.setfabrication(annee_fabrication);
            voiture.setImage(image_path);

            entityManager.persist(voiture);
            entityManager.getTransaction().commit();
        } catch (Exception e) {
            if (entityManager.getTransaction().isActive()) {
                entityManager.getTransaction().rollback();
            }
            e.printStackTrace();
        } finally {
            entityManager.close();
        }
    }
}
