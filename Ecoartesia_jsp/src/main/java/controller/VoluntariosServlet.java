package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.VoluntariosDAO;
import modelos.Voluntarios;




@WebServlet(urlPatterns = {"/Voluntarios", "/Voluntarios-create", "/Voluntarios-edit", "/Voluntarios-update", "/Voluntarios-delete" })
public class VoluntariosServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	VoluntariosDAO udao = new VoluntariosDAO();
	Voluntarios Voluntarios = new Voluntarios();
	
	
    public VoluntariosServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action = request.getServletPath();
		
		switch (action) {
		case "/Voluntarios":
			read(request, response);
			break;
			
		case "/Voluntarios-create":
		create(request,response);
		break;
		
		case "/Voluntarios-edit":
			edit(request,response);
			break;
			
		case "/Voluntarios-update":
			update(request,response);
			break;
		
		case "/Voluntarios-delete":
			delete(request, response);
			break;
			default:
				response.sendRedirect("index.jsp");
				break;}
	}
			

	protected void read(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		List<Voluntarios> lista = udao.read();
		System.out.println(lista);
		
		request.setAttribute("listaVoluntarios", lista);
		
		RequestDispatcher rd = request.getRequestDispatcher("./views/Voluntarios/index.jsp");
		rd.forward(request, response);
	}
	
	protected void create(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		Voluntarios.setNome(request.getParameter("disponibilidade"));
		Voluntarios.setInteresses(request.getParameter("interesses"));
		Voluntarios.setId_voluntario(request.getParameter("id_voluntario"));
		Voluntarios.setNome(request.getParameter("nome"));
		Voluntarios.setEmail(request.getParameter("email"));
		
		udao.create(Voluntarios);
		response.sendRedirect("Voluntarios");
		
		
	}
	
	protected void edit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		int id = Integer.parseInt(request.getParameter("id"));
		
		Voluntarios = udao.readByID(id);
		request.setAttribute("Voluntarios", Voluntarios);
		
		RequestDispatcher rd = request.getRequestDispatcher("./views/Voluntarios/update.jsp");
		rd.forward(request, response);
		
	}
	
	protected void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		
		Voluntarios.setNome(request.getParameter("disponibilidade"));
		Voluntarios.setInteresses(request.getParameter("interesses"));
		Voluntarios.setId_voluntario(request.getParameter("id_voluntario"));
		Voluntarios.setNome(request.getParameter("nome"));
		Voluntarios.setEmail(request.getParameter("email"));
		
		
		udao.update(Voluntarios);
		response.sendRedirect("Voluntarios");
	}
	
	protected void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		int id = Integer.parseInt(request.getParameter("id"));
		udao.delete(id);
		response.sendRedirect("Voluntarios");
		
	}
	
}