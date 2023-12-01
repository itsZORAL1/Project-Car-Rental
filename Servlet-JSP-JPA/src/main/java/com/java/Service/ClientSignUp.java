package com.jsp.Service;

import javax.persistence.EntityManager;

import com.jsp.Models.Client;

public class ClientSignUp {
	 private EntityManager entityManager;

	

	    public ClientSignUp(EntityManager entityManager2) {
	    	this.entityManager = entityManager2;
		}

		public void saveClient(Client client) {
	        EntityManager em = entityManager;
	        em.getTransaction().begin();
	        em.persist(client);
	        em.getTransaction().commit();
	    }
}
