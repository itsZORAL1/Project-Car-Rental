package com.jsp.Models;

import java.util.ArrayList;
import java.util.List;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;



@Entity
@Table(name="voiture")
public class Voiture {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="voiture_id")
	private  int id_voiture;
	@Column(name="marque")
	private String marque;
	@Column(name="prix")
	private String prix;
	@Column(name="date_dispo")
	@Temporal(TemporalType.DATE)
	private Date date_dispo;
	@Column(name="annee_fabrication")
	@Temporal(TemporalType.DATE)
	private Date annee_fabrication;
	@Column(name="image_path")
	private String image_path;

	
	public int getId_voiture() {
		return id_voiture;
	}
	public void setId_voiture(int id_voiture) {
		this.id_voiture = id_voiture;
	}
	public String getMarque() {
		return marque;
	}
	public void setMarque(String marque) {
		this.marque = marque;
	}
	public String getPrix() {
		return prix;
	}
	public void setPrix(String prix) {
		this.prix = prix;
	}
	public void setDispo(Date date) {
		this.date_dispo=date;
	}
	public Date getDispo() {
		return this.date_dispo;
	}
	public void setfabrication(Date date) {
		this.annee_fabrication=date;
	}
	public Date getfabrication() {
		return this.annee_fabrication;
	}
	public void setImage(String image) {
		this.image_path=image;
	}
	public String getImage() {
		return this.image_path;
	}


}