package mvc.model;

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
    private long id;
    private double quantidade_doada;
    private String data_doacao;

    @ManyToOne
    @JoinColumn(name = "fk_Usuarios_id_usuario")
    private Usuarios usuario;

    @Override
    public String toString() {
        return "Doacoes [id=" + id + ", usuario=" + usuario + ", quantidade_doada=" + quantidade_doada + 
               ", data_doacao=" + data_doacao + "]";
    }
}