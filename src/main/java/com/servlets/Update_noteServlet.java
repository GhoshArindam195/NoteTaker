package com.servlets;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Note;
import com.helper.FactoryProvider;


public class Update_noteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Update_noteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try 
		{
			//Fetching data
			String title = request.getParameter("title");
			String secret = request.getParameter("secret");
			String check = request.getParameter("private");
			String property="";
			int noteId = Integer.parseInt(request.getParameter("noteId").trim());
			if(check != null)
			{
				property = "hide";
			}
			else
			{
				property = "show";
			}
			
			//hibernate:save()
			Session session = FactoryProvider.getFactory().openSession();
			
			Transaction transaction = session.beginTransaction();
			
			Note note = (Note)session.get(Note.class, noteId);
			
			note.setTitle(title);
			note.setContent(secret);
			note.setProperty(property);
			note.setAddedDate(new Date());
			
			transaction.commit();
			
			session.close();
			
			response.sendRedirect("show_notes.jsp");
			
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
		
	}

}
