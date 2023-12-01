package com.jsp.Models;

import javax.annotation.processing.Generated;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity(name="personnel")
@Table(name="personnel")
public class Personnel {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="personnel_id")
	private int personnel_id;
	@Column(name="nom")
	private String nom;
	@Column(name="prenom")
	private String prenom;
	@Column(name="email")
	private String email;
	@Column(name="password")
	private String password;
	@Column(name="fonction")
	@Enumerated(EnumType.ORDINAL)
	private Role role;
	public int getPersonnel_id() {
		return personnel_id;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public void setPersonnel_id(int personnel_id) {
		this.personnel_id = personnel_id;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public String getPrenom() {
		return prenom;
	}
	public void setPrenom(String prenom) {
		this.prenom = prenom;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	

}
