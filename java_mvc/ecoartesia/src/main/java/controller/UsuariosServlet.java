package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UsuariosDAO;
import modelos.Usuarios;




@WebServlet(urlPatterns = {"/Usuario", "/Usuario-create", "/Usuario-edit", "/Usuario-update", "/Usuario-delete" })
public class UsuariosServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UsuariosDAO udao = new UsuariosDAO();
	Usuarios Usuario = new Usuarios();
	
	
    public UsuariosServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action = request.getServletPath();
		
		switch (action) {
		case "/Usuario":
			read(request, response);
			break;
			
		case "/Usuario-create":
		create(request,response);
		break;
		
		case "/Usuario-edit":
			edit(request,response);
			break;
			
		case "/Usuario-update":
			update(request,response);
			break;
		
		case "/Usuario-delete":
			delete(request, response);
			break;
			default:
				response.sendRedirect("index.jsp");
				break;}
	}
	
	protected void read(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		List<Usuarios> lista = udao.read();
		System.out.println(lista);
		
		request.setAttribute("listaUsuarios", lista);
		
		RequestDispatcher rd = request.getRequestDispatcher("./views/Usuarios/index.jsp");
		rd.forward(request, response);
	}

	protected void create(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    
	    Usuario.setNome(request.getParameter("nome"));
	    Usuario.setEmail(request.getParameter("email"));
	    Usuario.setSenha(request.getParameter("senha"));
	    Usuario.setCep(request.getParameter("cep"));
	    Usuario.setEndereco(request.getParameter("endereco"));
	    Usuario.setNumero(request.getParameter("numero"));
	    Usuario.setComplemento(request.getParameter("complemento"));
	    Usuario.setBairro(request.getParameter("bairro"));
	    Usuario.setEstado(request.getParameter("estado"));
	    Usuario.setCidade(request.getParameter("cidade"));


	    udao.create(Usuario);

	    HttpSession session = request.getSession();
	    session.setAttribute("email", Usuario.getEmail()); // Armazena o e-mail do usuário na sessão

	    String previousPage = request.getHeader("referer"); // Obtém o URL da página anterior
	    response.sendRedirect(previousPage); // Redireciona para a página anterior
	}

	
	protected void edit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		int id = Integer.parseInt(request.getParameter("id"));
		
		Usuario = udao.readByID(id);
		request.setAttribute("Usuario", Usuario);
		
		RequestDispatcher rd = request.getRequestDispatcher("./views/Usuarios/update.jsp");
		rd.forward(request, response);
		
	}
	
	protected void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		
		Usuario.setId(Integer.parseInt(request.getParameter("id")));
		Usuario.setNome(request.getParameter("nome"));
		Usuario.setEmail(request.getParameter("email"));
		Usuario.setSenha(request.getParameter("senha"));
		Usuario.setCep(request.getParameter("cep"));
		Usuario.setEndereco(request.getParameter("endereco"));
		Usuario.setNumero(request.getParameter("numero"));
		Usuario.setComplemento(request.getParameter("complemento"));
		Usuario.setBairro(request.getParameter("bairro"));
		Usuario.setEstado(request.getParameter("estado"));
		Usuario.setCidade(request.getParameter("cidade"));

		
		udao.update(Usuario);
		
	    String currentPage = request.getParameter("currentPage");

	    response.sendRedirect(currentPage);
	}
	
	
	protected void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		int id = Integer.parseInt(request.getParameter("id"));
		udao.delete(id);
		response.sendRedirect("Usuario");
		
	}
	
}