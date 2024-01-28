package mvc.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Set;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "Cursos")
public class Cursos {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private String nome;
    private String categoria;
    private String descricao;
    private String duracao;

    @ManyToMany
    @JoinTable(
        name = "Matricula_se",
        joinColumns = @JoinColumn(name = "fk_Cursos_id_curso"),
        inverseJoinColumns = @JoinColumn(name = "fk_Usuarios_id_usuario")
    )
    private Set<Usuarios> usuarios;

    @Override
    public String toString() {
        return "Cursos [id=" + id + ", nome=" + nome + ", categoria=" + categoria + 
               ", descricao=" + descricao + ", duracao=" + duracao + "]";
    }
}