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
@Table(name = "Campanhas")
public class Campanhas {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private String titulo;
    private String descricao;
    private String status;
    private String data_inicio;
    private String data_fim;

    @ManyToOne
    @JoinColumn(name = "fk_Organizacoes_id_organizacao")
    private Organizacoes organizacao;

    @ManyToMany(mappedBy = "campanhasParticipadas")
    private Set<Usuarios> participantes;

    @Override
    public String toString() {
        return "Campanhas [id=" + id + ", titulo=" + titulo + ", descricao=" + descricao + 
               ", status=" + status + ", data_inicio=" + data_inicio + ", data_fim=" + data_fim + 
               ", organizacao=" + organizacao + "]";
    }
}