package controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UsuariosDAO;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

        // Adicione um construtor sem argumentos
        public LoginServlet() {
            super();
        }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");
        
        // Suponhamos que você tenha uma classe UsuariosDAO que interaja com o banco de dados
        UsuariosDAO userDao = new UsuariosDAO();

        // Chama o método checkLogin da classe UsuariosDAO
        UsuariosDAO.LoginResult loginResult = userDao.checkLogin(email, senha);

        System.out.println("Antes da validação das credenciais...");

        // Obtém o resultado da validação
        boolean isValid = loginResult.isValid();
        
        // Exemplo de como acessar o ResultSet, se necessário
        ResultSet resultSet = null;

        try {
        	// Exemplo de como acessar o ResultSet, se necessário
            resultSet = loginResult.getResultSet();
            // Faça o processamento necessário com o ResultSet, se for utilizado

            // Lógica para validar as credenciais no banco de dados
            if (isValid) {
                // Se as credenciais são válidas, redirecione para a página principal ou para a área do usuário
                HttpSession session = request.getSession();
                String userEmail = resultSet.getString("email");
                session.setAttribute("email", userEmail); // Armazena o nome de usuário na sessão
                response.sendRedirect(request.getRequestURI()); // ou para outra página após o login bem-sucedido
            } else {
                // Se as credenciais são inválidas, redirecione de volta para a página de login
                response.sendRedirect("./index.jsp"); // ou para a página de login com uma mensagem de erro
            }
        } catch(SQLException e) {
        	e.printStackTrace(); // ou trate a exceção de acordo com a lógica do seu aplicativo
        } finally {
        	// Recupera a sessão
            HttpSession session = request.getSession();
            System.out.println("Finalizando o servlet...");


            // Obtém o valor do atributo "email" da sessão
            System.out.println("Email message: " + (String) session.getAttribute("email"));
        	// Certifique-se de fechar o ResultSet se não for mais necessário
            if (resultSet != null) {
                try {
                    resultSet.close();
                } catch (SQLException e) {
                    e.printStackTrace(); // ou trate a exceção de acordo com a lógica do seu aplicativo
                }
            }
        }
    }

    // Método para validar as credenciais no banco de dados
    private boolean isValidLogin(String email, String senha) {
        // Aqui está um exemplo simplificado de como verificar no banco de dados
        // Esta é apenas uma lógica de exemplo, você deve adaptar isso ao seu banco de dados e estrutura

        // Suponhamos que você tenha uma classe UsuariosDAO que interaja com o banco de dados
        UsuariosDAO userDao = new UsuariosDAO();

        // Chama o método checkLogin da classe UsuariosDAO
        UsuariosDAO.LoginResult loginResult = userDao.checkLogin(email, senha);

        // Obtém o resultado da validação
        boolean isValid = loginResult.isValid();

        // Exemplo de como acessar o ResultSet, se necessário
        ResultSet resultSet = loginResult.getResultSet();
        // Faça o processamento necessário com o ResultSet, se for utilizado

        return isValid; // Retorna true se as credenciais estiverem corretas
    }
}