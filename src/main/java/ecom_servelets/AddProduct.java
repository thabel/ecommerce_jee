package ecom_servelets;

import javax.servlet.annotation.WebServlet;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import dao.AppDao;
import entities.Categorie;
import entities.Produits;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Servlet implementation class AddProduct
 */
@WebServlet("/AddProduct")
public class AddProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public static String UPLOAD_DIRECTORY = Constants.UPLOAD_DIRECTORY;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddProduct() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @throws IOException
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// the argument to which servlet we need to call - AvgNum.java
		RequestDispatcher reqd = request.getRequestDispatcher("/addProduct.jsp");

		// Forward the Request Dispatcher object.
		reqd.forward(request, response);
	}

	protected void addProduct(Map<String, String> dictionary) {
		Categorie relate_categorie = AppDao.getCategorie(dictionary.get("cat_name"));

		Produits new_product = new Produits(dictionary.get("name"), Double.parseDouble(dictionary.get("price")),
				relate_categorie, dictionary.get("filename"));
		AppDao.addNewEntity(new_product);
	}

	/**
	 * @throws IOException
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String contentType = request.getContentType();
		request.setCharacterEncoding("UTF-8");

		var out = response.getWriter();

		// var Produits("name",12.0,cat,"boeuf.jsp");
		Map<String, String> dictionary = new HashMap<>();

		// Add key-value pairs
		dictionary.put("name", "");
		dictionary.put("price", "");
		dictionary.put("cat_name", "");

		if (false) {
			String name = request.getParameter("name");
			var price = Double.parseDouble(request.getParameter("price"));
			String cat = request.getParameter("cat_name");
			out.print("price " + request.getParameter("name") + " " + java.time.LocalDateTime.now());
			return;
		}
		try {
			if (ServletFileUpload.isMultipartContent(request)) {

				DiskFileItemFactory factory = new DiskFileItemFactory();
				factory.setSizeThreshold(Constants.MEMORY_THRESHOLD);
				factory.setRepository(new File(System.getProperty("java.io.tmpdir")));

				ServletFileUpload upload = new ServletFileUpload(factory);
				upload.setFileSizeMax(Constants.MAX_FILE_SIZE);
				upload.setSizeMax(Constants.MAX_REQUEST_SIZE);
				String uploadPath = "C:\\Users\\hp\\eclipse-workspace\\jee\\EcomerceJee\\src\\main\\webapp"
						+ File.separator + UPLOAD_DIRECTORY;
				File uploadDir = new File(uploadPath);
				if (!uploadDir.exists()) {
					uploadDir.mkdir();
				}

				List<FileItem> formItems = upload.parseRequest(request);
				if (formItems != null && formItems.size() > 0) {
					for (FileItem item : formItems) {
						if (!item.isFormField()) {
							String fileName = new File(item.getName()).getName();
							String filePath = uploadPath + File.separator + fileName;
							File storeFile = new File(filePath);
							try {
								item.write(storeFile);

								dictionary.put("filename", fileName);
							} catch (Exception e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
								out.print("Erreor 1 ");
							}

							request.setAttribute("message", "File " + fileName + " has uploaded successfully!");
						} else {
							dictionary.put(item.getFieldName(), item.getString());
							out.print("name" + item.getFieldName());
						}
					}
				}
				addProduct(dictionary);
				out.print("Yes it was saved " + uploadPath + " " + dictionary);
			} else {
				out.print("else reached");
			}
		} catch (Exception e) {
			// TODO: handle exception
			out.print("Erreor 2 " + e);
		}
	}
}