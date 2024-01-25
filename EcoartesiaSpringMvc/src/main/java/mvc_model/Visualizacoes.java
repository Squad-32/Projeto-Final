package mvc_model;

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
    private long id_visualizacao;
    private String tempo_visto;
    private String data_vista;

    @OneToOne(mappedBy = "visualizacao")
    private Videos video;

    @Override
    public String toString() {
        return "Visualizacoes [id_visualizacao=" + id_visualizacao + ", tempo_visto=" + tempo_visto + ", data_vista=" + data_vista + "]";
    }
}