package entities;

import java.time.LocalDateTime;
import java.util.Set;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.Lob;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;


@Entity
@Table(name = "Produits")
public class Produits {

	@Id
	@GeneratedValue
	@Column(name="product_id")
	private Long id;

	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public double getPrix_produit() {
		return prix_produit;
	}
	public void setPrix_produit(double prix_produit) {
		this.prix_produit = prix_produit;
	}
	public String getImage_name() {
		return image_name;
	}
	public void setImage_name(String image_name) {
		this.image_name = image_name;
	}
	private String nom;
	private double prix_produit;
	
	@Lob
    @Column(name = "image_name") 
    private String image_name; 
	
	@ManyToOne
	@JoinColumn(name="cartegorie_id", nullable=false)
	private Categorie categorie;
	
	 @OneToMany(mappedBy="produit")
	 private Set<Achat> achats;
	 
	 
	public Produits(String nom, double prix_produit, Categorie cartegorie, String img) {
		this.nom = nom;
		this.prix_produit = prix_produit;
		this.categorie = cartegorie;
		this.image_name = img;
	}
	// 1 produit appartient à une catégorie
	public Produits(){
		
	}
	
	// Deal with images field
	

	

}
