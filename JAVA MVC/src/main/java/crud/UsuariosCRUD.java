package crud;

import java.util.Scanner;

import dao.UsuariosDAO;
import modelos.Usuarios;

public class UsuariosCRUD {

	public static void main(String[] args) {
		
		Scanner s = new Scanner (System.in);
		UsuariosDAO usuariosDAO = new UsuariosDAO();
		
		
		int opcao = 0;
		
		String nome = "", email = "", senha ="";
		
		do {
			
			System.out.println("\n================== Usuarios ==============\n");
			System.out.println("1- CRIAR  2-CONSULTAR  3-ATUALIZAR  4-DELETAR  5-CONSULTAR POR ID  0-SAIR");
			opcao = s.nextInt();
			s.nextLine();

			switch (opcao) {
			case 1:
				System.out.println("Digite o seu nome:");
				nome = s.nextLine();
		
				System.out.println("Digite seu email:");
				email = s.nextLine();
				
				System.out.println("Digite sua senha:");
				senha = s.nextLine();
				
				Usuarios usuario1 = new Usuarios( nome, email, senha);
				usuariosDAO.create(usuario1);
				
				break;
				
				
			case 2:
				usuariosDAO.read();
				
				for (Usuarios u :  usuariosDAO.read()) {
				System.out.println(u.toString());
				
				}
				break;
				
			case 3:
				
				
				System.out.println("Digite o seu nome:");
				nome = s.nextLine();
				
				System.out.println("Digite seu email:");
				email = s.nextLine();
				
				System.out.println("Digite sua senha:");
				senha = s.nextLine();
								
				System.out.println("Digite seu id:");
				int id = s.nextInt();
				s.nextLine();
				
				Usuarios usuario2 = new Usuarios(id, nome, email, senha);
				
				usuariosDAO.update(usuario2);
				break;
	
			case 4:
				
				System.out.println("Digite um id:");
				id = s.nextInt();
				s.nextLine();
				
				usuariosDAO.delete(id);
				break;
	
			case 5:
				
				System.out.println("Digite um id:");
				id = s.nextInt();
				s.nextLine();
				
				Usuarios usuario3 = usuariosDAO.readByID(id);
				
				System.out.println(usuario3.toString());
				break;
			default:
				
				
			}
			
		}while (opcao !=0);
		
		System.out.print("Até logo!");
		
	}

}