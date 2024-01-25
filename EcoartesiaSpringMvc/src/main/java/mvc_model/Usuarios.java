package mvc_model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Set;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "Usuarios")
public class Usuarios {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private String nome;
    private String email;
    private String telefone;
    private String senha;

    @OneToMany(mappedBy = "usuario")
    private Set<Contatos> contatos;

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
        return "Usuarios [id=" + id + ", nome=" + nome + ", email=" + email + 
               ", telefone=" + telefone + ", senha=" + senha + "]";
    }
}