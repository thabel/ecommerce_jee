package entities;

import java.time.LocalDateTime;
import java.util.Set;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "Commande")
public class Commande {

	@Id
	@GeneratedValue
	@Column(name="command_id")
	private Long id;
	
	private LocalDateTime date_command; 
	/*
	 * status_command sera l'un des suivantes
	 * Encours et traité
	 */
	private String status_command;
	
	 public Commande(LocalDateTime date_command, String status_command) {
		super();
		this.date_command = date_command;
		this.status_command = status_command;
	}

	@OneToMany(mappedBy="commande")
	 private Set<Achat> achats;
	 
	 public Commande() {
		 
	 }
	
	
	
	
	
}
