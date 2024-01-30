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
<<<<<<< Updated upstream
    private long id_video;
=======
    private Long id_video;
>>>>>>> Stashed changes
    private String titulo;
    private String duracao;
    private String caminho_arquivo;

    @OneToOne
    @JoinColumn(name = "fk_Visualizacoes_id_visualizacao", referencedColumnName = "id_visualizacao")
    private Visualizacoes visualizacao;

    @ManyToMany
    @JoinTable(
        name = "Assiste_Videos",
        joinColumns = @JoinColumn(name = "fk_Videos_id_video", columnDefinition = "BIGINT"),
        inverseJoinColumns = @JoinColumn(name = "fk_Usuarios_id_usuario", columnDefinition = "BIGINT")
    )
    private Set<Usuarios> usuarios;

    @Override
    public String toString() {
        return "Videos [id_video=" + id_video + ", titulo=" + titulo + ", duracao=" + duracao + 
               ", caminho_arquivo=" + caminho_arquivo + ", visualizacao=" + visualizacao + "]";
    }
}