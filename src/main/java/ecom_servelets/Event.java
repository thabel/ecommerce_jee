package ecom_servelets;

import static java.time.LocalDateTime.now;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.EventObj;
import util.JpaUtil;

/**
 * Servlet implementation class Event
 */
@WebServlet("/Event")
public class Event extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Event() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		/*
		 * JpaUtil.inTransaction(entityManager -> { entityManager.persist(new
		 * EventObj("Our very first event!", now())); entityManager.persist(new
		 * EventObj("A follow up event", now())); });
		 */
		 var out = response.getWriter();
		 if(true) {
			   out.print("price "+request.getParameter("e")+ " "+java.time.LocalDateTime.now());
			   return;
		   }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
