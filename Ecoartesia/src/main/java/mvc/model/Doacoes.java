package mvc.model;

import java.math.BigDecimal;
import java.time.LocalDateTime;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "Doacoes")
public class Doacoes {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
<<<<<<< Updated upstream
    private long id;
    private double quantidade_doada;
    private String data_doacao;
=======
    private Long id_doacao;

    @Column(precision = 10, scale = 2)
    private BigDecimal quantidade_doada;

    private LocalDateTime data_doacao;
>>>>>>> Stashed changes

    @ManyToOne
    @JoinColumn(name = "fk_Usuarios_id_usuario")
    private Usuarios usuario;

    @Override
    public String toString() {
        return "Doacoes [id_doacao=" + id_doacao + ", usuario=" + usuario + ", quantidade_doada=" + quantidade_doada + 
               ", data_doacao=" + data_doacao + "]";
    }
}