package dao;

import static java.lang.System.out;

import java.util.ArrayList;
import java.util.List;

import entities.Categorie;
import entities.Produits;
import test.EventObj;
import util.JpaUtil;

public class AppDao {
	public static void addNewEntity(Object cat) {
		JpaUtil.inTransaction(entityManager -> {
			entityManager.persist(cat);
		});
	}

	public static Categorie getCategorie(String name) {

		List<Categorie> data = new ArrayList<>();
		JpaUtil.inTransaction(entityManager -> {
			String queryString = "SELECT c FROM Categorie c WHERE c.nom_categorie = :nom_categorie";
			var categorie = entityManager.createQuery(queryString, Categorie.class).setParameter("nom_categorie", name)
					.getSingleResult();
			data.add(categorie);

		});
		return data.get(0);

	}

	public static Produits getProductByName(String nom) {

		List<Produits> data = new ArrayList<>();
		JpaUtil.inTransaction(entityManager -> {
			String queryString = "SELECT p FROM Produits p WHERE p.nom = :nom_produit";
			var prod = entityManager.createQuery(queryString, Produits.class).setParameter("nom_produit", nom)
					.getSingleResult();
			data.add(prod);

		});
		return data.get(0);

	}

	public static List<Produits> getProduit(String name) {

		List<Produits> data = new ArrayList<>();
		JpaUtil.inTransaction(entityManager -> {
			String queryString = "SELECT p FROM Produits p "
					+ (!name.equals("total") ? "WHERE p.categorie.nom_categorie = :nom_categorie" : "");
			if (name.equals("total")) {
				data.addAll(entityManager.createQuery(queryString, Produits.class).getResultList());
				return;
			}
			var prod = entityManager.createQuery(queryString, Produits.class).setParameter("nom_categorie", name)
					.getResultList();
			data.addAll(prod);

		});
		return data;
	}

}
