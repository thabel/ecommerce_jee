package entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "Achat")
public class Achat {
	@Id
	@GeneratedValue
	@Column(name="achat_id")
	private Long id;
	
	private Integer quantite;
	private boolean is_commander;
	
	@ManyToOne
	@JoinColumn(name="client_id", nullable=false)
	private Client client;
	
	@ManyToOne
	@JoinColumn(name="product_id", nullable=false)
	private Produits produit;
	
	@ManyToOne
	@JoinColumn(name="command_id", nullable=false)
	private Commande commande;
	
	
	
	public Achat() {
		
	}

	public Achat(Integer quantite,Produits prod,Commande commande,Client c) {
		this.quantite = quantite;
		this.produit = prod;
		this.commande = commande;
		this.client =c;
	}
	
}
