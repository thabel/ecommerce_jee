package entities;

import java.util.Set;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "Client")
public class Client {
	

	@Id
	@GeneratedValue
	@Column(name="client_id")
	private Long id;

	private String nom;
	private String email;
	private String numero_tel;
	private String adresse;
	private String carte_credit;
	private String mot_de_passe;
	
	 @OneToMany(mappedBy="client")
	 private Set<Achat> achats;
	
	
	public Client(String nom, String email, String numero_tel, String adresse, String carte_credit,
			String mot_de_passe) {
		super();
		this.nom = nom;
		this.email = email;
		this.numero_tel = numero_tel;
		this.adresse = adresse;
		this.carte_credit = carte_credit;
		this.mot_de_passe = mot_de_passe;
	}


	public Client() {
		
	}
	
}
