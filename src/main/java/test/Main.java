package test;


import java.io.IOException;
import dao.AppDao;
import entities.Categorie;
import entities.Client;


public class Main {
	 protected  static void addCategories() {
		 Categorie [] cats = {
				 new Categorie("Viandes"),new Categorie("Pain"), new Categorie("Legumes"),
				 new Categorie("Fromages")
		 };
		 for(Categorie cat:cats) {
			 AppDao.addNewEntity(cat);
		 }
	 }
	 
	 
	 public static void main(String[] args) throws IOException {

		 //var cat = new Categorie("test_cat");
		 //AppDao.addNewEntity(cat);
		// 
		 
		// var cat = AppDao.getCategorie("test_cat");
		 System.out.println("id "+AppDao.getProduit("Viandes"));
		
		 //System.out.println(new File("").getAbsolutePath());
		//var prod = new Produits("name",12.0,cat,"boeuf.jsp");
		 //AppDao.addNewEntity(prod);
		 
		 // new client
		 var client = new Client("Albert","albert@bio.ma","+212646645312",
				 "13 Rue Ibn Kattane Res Sebarra","1234567","albert02");
		 
		
	}
	 // add a product

}
