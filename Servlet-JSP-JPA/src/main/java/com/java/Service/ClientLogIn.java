package com.jsp.Service;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.Query;
import com.jsp.Models.Client;

public class ClientLogIn {
    private EntityManager entityManager;

    public ClientLogIn(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

    public boolean validateUser(Client client) {
        EntityManager em = this.entityManager;

        Query query = em.createQuery("select e from client e where e.email = :email and e.password = :password");
        query.setParameter("email", client.getEmail());
        query.setParameter("password", client.getPassword());

        List<Client> resultList = query.getResultList();

        return !resultList.isEmpty();
    }
}
