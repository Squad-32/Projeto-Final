package mvc.model;

import java.time.LocalDateTime;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "Visualizacoes")
public class Visualizacoes {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
<<<<<<< Updated upstream
    private long id_visualizacao;
=======
    private Long id_visualizacao;
>>>>>>> Stashed changes
    private String tempo_visto;
    private LocalDateTime data_vista;

    @OneToOne(mappedBy = "visualizacao")
    private Videos video;

    @Override
    public String toString() {
        return "Visualizacoes [id_visualizacao=" + id_visualizacao + ", tempo_visto=" + tempo_visto + ", data_vista=" + data_vista + "]";
    }
}