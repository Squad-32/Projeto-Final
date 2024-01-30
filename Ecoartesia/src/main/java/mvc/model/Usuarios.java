package mvc.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "usuario")

public class Usuarios {
		
	//ATRIBUTOS
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)

<<<<<<< Updated upstream
	private Long id_usuario;
	private String nome;
	private String email;
	private Number telefone;
	private String senha;
	
	//GettersAndSetters
	
	public Long getId_usuario() {
		return id_usuario;
	}
	
	public void setId_usuario(Long id_usuario) {
		this.id_usuario = id_usuario;
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
	
	public Number getTelefone() {
		return telefone;
	}
	
	public void setTelefone(Number telefone) {
		this.telefone = telefone;
	}
	
	public String getSenha() {
		return senha;
	}
	
	public void setSenha(String senha) {
		this.senha = senha;
	}
=======
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id_usuario;
    private String nome;
    private String email;
    private String telefone;
    private String senha;
>>>>>>> Stashed changes

	
	// TOOSTRING

<<<<<<< Updated upstream
	@Override
	public String toString() {
		return "Usuarios [id_usuario=" + id_usuario + ", nome=" + nome + ", email=" + email + ", telefone=" + telefone
				+ ", senha=" + senha + "]";
	}
	
}
	
	
=======
    @OneToMany(mappedBy = "usuario")
    private Set<Voluntarios> voluntarios;

    @OneToMany(mappedBy = "usuario")
    private Set<Doacoes> doacoes;

    @ManyToMany
    @JoinTable(
        name = "Assiste_Videos",
        joinColumns = @JoinColumn(name = "fk_Usuarios_id_usuario"),
        inverseJoinColumns = @JoinColumn(name = "fk_Videos_id_video")
    )
    private Set<Videos> videosAssistidos;

    @ManyToMany
    @JoinTable(
        name = "Usuarios_Participa",
        joinColumns = @JoinColumn(name = "fk_Usuarios_id_usuario"),
        inverseJoinColumns = @JoinColumn(name = "fk_Campanhas_id_campanha")
    )
    private Set<Campanhas> campanhasParticipadas;

    @Override
    public String toString() {
        return "Usuarios [id_usuario=" + id_usuario + ", nome=" + nome + ", email=" + email + 
               ", telefone=" + telefone + ", senha=" + senha + "]";
    }
}
>>>>>>> Stashed changes
