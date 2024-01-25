package mvc_model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "Contatos")
public class Contatos {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    private String nome;
    private String email;
    private String telefone;
    private String mensagem;

    @ManyToOne
    @JoinColumn(name = "fk_Usuarios_id_usuario", nullable = true)
    private Usuarios usuario;

    @Override
    public String toString() {
        return "Contatos [id=" + id + ", nome=" + nome + ", email=" + email + 
               ", telefone=" + telefone + ", mensagem=" + mensagem + "]";
    }
}