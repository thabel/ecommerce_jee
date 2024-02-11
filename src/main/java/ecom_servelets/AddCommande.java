package ecom_servelets;

import java.io.IOException;
import java.time.LocalDateTime;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import dao.AppDao;
import entities.Achat;
import entities.Client;
import entities.Commande;

/**
 * Servlet implementation class AddCommande
 */
@WebServlet("/AddCommande")
public class AddCommande extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCommande() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// Create a client and achat
		var name = request.getParameter("name");
		var email = request.getParameter("email");
		var tel = request.getParameter("tel");
		var adresse = request.getParameter("adresse");
		var carte = request.getParameter("carte");
		var achats = request.getParameter("achats");
		
		// and commandes
		var out = response.getWriter();
		
		out.println("Name: " + name);
		out.println("Email: " + email);
		out.println("Tel: " + tel);
		out.println("Adresse: " + adresse);
		out.println("Carte: " + carte);
		out.println("Achats: " + achats);
		
		// Add client
		
		var client = new Client(name,email,tel,adresse,carte,"password");
		var commande = new Commande(LocalDateTime.now(),"pending");
		AppDao.addNewEntity(commande);
		AppDao.addNewEntity(client);
		
		// Add Achats and command
		 JSONArray achatsArray = new JSONArray(achats);
		 
		 for (int i = 0; i < achatsArray.length(); i++) {
	            JSONObject item = achatsArray.getJSONObject(i);
	            try {
	            	  var prod = AppDao.getProductByName(item.getString("name_produit"));
	  	            // Assuming you have a method to store the item in the database
	  	            var achat = new Achat(item.getInt("quantite"),prod,commande,client);
	  	            AppDao.addNewEntity(achat);
	            }catch (Exception e) {
					// TODO: handle exception
	            	out.println("<h1>ERRor</h1>"+e);
				}
	          
	            
	        }
		out.println("<h1>All Added</h1>");
		
		
	}

	private void addAchat(JSONObject item) {
		// TODO Auto-generated method stub
		
	}

}
