package com.jsp.Models;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
@Entity(name="reservation")
@Table(name="reservation")

public class Reservation {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int reserve_id;

    @ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JoinColumn(name = "client_id")
    private Client client;

    @ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JoinColumn(name = "voiture_id")
    private Voiture voiture;

    @Column(name = "date_reservdebut")
    @Temporal(TemporalType.DATE)
    private Date date_reservdebut;

    @Column(name = "date_reservfin")
    @Temporal(TemporalType.DATE)
    private Date date_reservfin;

    @Column(name = "type_paiment")
    @Enumerated(EnumType.STRING)
    private Paiment type_paiment;
    
    @Column(name = "prix")
    private float prix;

    @Column(name = "ResDate")
    private String ResDate;
  

	public String getResDate() {
		return ResDate;
	}

	public void setResDate(String resDate) {
		ResDate = resDate;
	}

	public float getPrix() {
		return prix;
	}

	public void setPrix(float prix) {
		this.prix = prix;
	}

	public int getReserve_id() {
		return reserve_id;
	}

	public void setReserve_id(int reserve_id) {
		this.reserve_id = reserve_id;
	}

	public Client getClient() {
		return client;
	}

	public void setClient(Client client) {
		this.client = client;
	}

	public Voiture getVoiture() {
		return voiture;
	}

	public void setVoiture(Voiture voiture) {
		this.voiture = voiture;
	}

	public Date getDate_reservdebut() {
		return date_reservdebut;
	}

	public void setDate_reservdebut(Date date_reservdebut) {
		this.date_reservdebut = date_reservdebut;
	}

	public Paiment getType_paiment() {
		return type_paiment;
	}

	public void setType_paiment(Paiment type_paiment) {
		this.type_paiment = type_paiment;
	}

	

	public Date getDate_reservfin() {
		return date_reservfin;
	}

	public void setDate_reservfin(Date date_reservfin) {
		this.date_reservfin = date_reservfin;
	}

    
}
