package mvc.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.math.BigDecimal; // Import para BigDecimal
import java.time.LocalDateTime; // Import para LocalDateTime
import java.util.Set;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "Campanhas")
public class Campanhas {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id_campanha;
    private String nome;
    private String descricao;

    @Column(precision = 10, scale = 2)
    private BigDecimal meta_arrecadacao;

    private LocalDateTime data_inicio;
    private LocalDateTime data_termino;

    @ManyToOne
    @JoinColumn(name = "fk_Organizacoes_id_organizacao")
    private Organizacoes organizacao;

    @ManyToMany(mappedBy = "campanhasParticipadas")
    private Set<Usuarios> participantes;

    @Override
    public String toString() {
        return "Campanhas [id_campanha=" + id_campanha + ", nome=" + nome + ", descricao=" + descricao + 
               ", meta_arrecadacao=" + meta_arrecadacao + ", data_inicio=" + data_inicio + ", data_fim=" + data_termino + 
               ", organizacao=" + organizacao + "]";
    }
}