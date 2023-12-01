package com.jsp.Service;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.Query;
import com.jsp.Models.Personnel;

public class PersonnelLog {
    private EntityManager entityManager;

    public PersonnelLog(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    public boolean validatePersonnel(Personnel personnel) {
        EntityManager em = this.entityManager;

        Query query = em.createQuery("select e from personnel e where e.email = :email and e.password = :password");
        query.setParameter("email", personnel.getEmail());
        query.setParameter("password", personnel.getPassword());

        List<Personnel> resultList = query.getResultList();

        return !resultList.isEmpty();
    }
}
