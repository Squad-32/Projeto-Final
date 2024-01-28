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
@Table(name = "Videos")
public class Videos {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String titulo;
    private String duracao;
    private String caminho_arquivo;

    @OneToOne
    @JoinColumn(name = "fk_Visualizacoes_id_visualizacao", referencedColumnName = "id_visualizacoes")
    private Visualizacoes visualizacao;

    @ManyToMany
    @JoinTable(
        name = "Assiste_Videos",
        joinColumns = @JoinColumn(name = "fk_Videos_id_video"),
        inverseJoinColumns = @JoinColumn(name = "fk_Usuarios_id_usuario")
    )
    private Set<Usuarios> usuarios;

    @Override
    public String toString() {
        return "Videos [id=" + id + ", titulo=" + titulo + ", duracao=" + duracao + 
               ", caminho_arquivo=" + caminho_arquivo + ", visualizacao=" + visualizacao + "]";
    }
}