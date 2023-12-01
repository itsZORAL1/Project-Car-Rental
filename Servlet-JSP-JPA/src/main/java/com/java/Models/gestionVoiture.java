package com.jsp.Models;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.ManyToOne;
import javax.persistence.JoinColumn;
import java.sql.Date;

@Entity
@Table(name="gestionVoiture")
public class gestionVoiture {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="gestion_id")
	private int gestion_id;
	@ManyToOne(cascade=CascadeType.ALL, fetch=FetchType.EAGER)
	@JoinColumn(name="personnel")
	private Personnel personnel;
	@ManyToOne(cascade=CascadeType.ALL, fetch=FetchType.EAGER)
	@JoinColumn(name="voiture")
	private Voiture voiture;
	@Column(name="date_debut")
	private Date date_debut;
	@Column(name="date_fin")
	private Date date_fin;
	@Column(name="prix_gestion")
	private float prix;


}
