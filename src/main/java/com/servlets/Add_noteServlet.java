package com.servlets;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.entities.Note;
import com.helper.FactoryProvider;

public class Add_noteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
    public Add_noteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try 
		{
			//Fetching data
			String title = request.getParameter("title");
			String secret = request.getParameter("secret");
			String check = request.getParameter("private");
			String property="";
			//response.getWriter().println(title+" "+secret+" "+check);
			
			if(check != null)
			{
				property = "hide";
			}
			else
			{
				property = "show";
			}
			
			Note note = new Note(title, secret, new Date(), property);
			
			//hibernate:save()
			Session session = FactoryProvider.getFactory().openSession();
			
			Transaction transaction = session.beginTransaction();
			
			session.save(note);
			
			transaction.commit();
			
			session.close();
			
			//Thread.sleep(5000);
			response.sendRedirect("show_notes.jsp");
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		
	}

}
