package modelos;

public class Usuarios {

	//ATRIBUTOS
	
	private int id;
	private String nome;
	private String email;
	private String senha;
	private String cep;
	private String endereco;
	private String numero;
	private String complemento;
	private String bairro;
	private String estado;
	private String cidade;
	
	//CONSTRUTORES
	
	public Usuarios() {
	}

	public Usuarios(int id, String nome, String email, String senha, String cep, String endereco, String numero, String complemento, String bairro, String estado, String cidade) {
		this.id = id;
		this.nome = nome;
		this.email = email;
		this.senha = senha;
		this.cep = cep;
		this.endereco = endereco;
		this.numero = numero;
		this.complemento = complemento;
		this.bairro = bairro;
		this.estado = estado;
		this.cidade = cidade;
		
	}

	public Usuarios(String nome, String email, String senha, String cep, String endereco, String numero, String complemento, String bairro, String estado, String cidade ) {
		this.nome = nome;
		this.email = email;
		this.senha = senha;
		this.cep = cep;
		this.endereco = endereco;
		this.numero = numero;
		this.complemento = complemento;
		this.bairro = bairro;
		this.estado = estado;
		this.cidade = cidade;
	}
	
	//GETTERS & SETTERS
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
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

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}

	public String getCep() {
		return cep;
	}

	public void setCep(String cep) {
		this.cep = cep;
	}

	public String getEndereco() {
		return endereco;
	}

	public void setEndereco(String endereco) {
		this.endereco = endereco;
	}

	public String getNumero() {
		return numero;
	}

	public void setNumero(String numero) {
		this.numero = numero;
	}

	public String getComplemento() {
		return complemento;
	}

	public void setComplemento(String complemento) {
		this.complemento = complemento;
	}

	public String getBairro() {
		return bairro;
	}

	public void setBairro(String bairro) {
		this.bairro = bairro;
	}

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public String getCidade() {
		return cidade;
	}

	public void setCidade(String cidade) {
		this.cidade = cidade;
	}

	
	// TOOSTRING
	
	@Override
	public String toString() {
		return "Usuarios [id=" + id + ", nome=" + nome + ", email=" + email + ", senha=" + senha + ", cep=" + cep
				+ ", endereco=" + endereco + ", numero=" + numero + ", complemento=" + complemento + ", bairro="
				+ bairro + ", estado=" + estado + ", cidade=" + cidade + "]";
	}
		
}