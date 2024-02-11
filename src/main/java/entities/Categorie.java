package entities;

import java.util.Set;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;

@Entity
public class Categorie {
	@Id
	@GeneratedValue
	private Long id;

	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getNom_categorie() {
		return nom_categorie;
	}
	public void setNom_categorie(String nom_categorie) {
		this.nom_categorie = nom_categorie;
	}
	public Set<Produits> getProduits() {
		return produits;
	}
	public void setProduits(Set<Produits> produits) {
		this.produits = produits;
	}
	private String nom_categorie;
	
	 // Relation
	// 1 categorie peut avoir plusieurs produits
	 @OneToMany(mappedBy="categorie")
	 private Set<Produits> produits;
	 
	 public Categorie() {
		 
	 }
	 public Categorie(String nom_cat) {
		 this.nom_categorie = nom_cat;
	 }
}
