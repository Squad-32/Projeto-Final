package modelos;

public class Voluntarios {

	//ATRIBUTOS
	
	
	private String disponibilidade;
	private String interesses;
	private String id_voluntario;
	private String nome;
	private String email;
	
	//CONSTRUTORES
	
	public Voluntarios() {
	}

	public Voluntarios(int id, String disponibilidade, String interesses, String id_voluntario,String nome,String email) {
		
		this.disponibilidade = disponibilidade;
		this.interesses = interesses;
		this.id_voluntario = id_voluntario;
		this.nome = nome;
		this.email = email;
	}

	public Voluntarios(String disponibilidade, String interesses, String id_voluntario,String nome,String email) {
		this.disponibilidade = disponibilidade;
		this.interesses = interesses;
		this.id_voluntario = id_voluntario;
		this.nome = nome;
		this.email = email;
	}
	
	//GETTERS & SETTERS
	
	

	public String getDisponibilidade() {
		return disponibilidade;
	}

	public void setDisponibilidade(String disponibilidade) {
		this.disponibilidade = disponibilidade;
	}

	public String getInteresses() {
		return interesses;
	}

	public void setInteresses(String interesses) {
		this.interesses = interesses;
	}

	public String getId_voluntario() {
		return id_voluntario;
	}

	public void setId_voluntario(String id_voluntario) {
		this.id_voluntario = id_voluntario;
	}
	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	// TOOSTRING
	
	@Override
	public String toString() {
		return "Usuarios [disponibilidade=" + disponibilidade + ",interesses=" + interesses +",id_voluntario=" + id_voluntario + " , nome=" + nome + ", email=" + email + "]";
	}
	
	
	
	
}