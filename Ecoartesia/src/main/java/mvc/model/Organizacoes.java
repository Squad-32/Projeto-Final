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
@Table(name = "Organizacoes")
public class Organizacoes {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id_organizacao;
    private String nome;
    private String endereco_sede;

    @OneToMany(mappedBy = "organizacao")
    private Set<Campanhas> campanhas;

    @Override
    public String toString() {
        return "Organizacoes [id_organizacao=" + id_organizacao + ", nome=" + nome + ", endereco_sede=" + endereco_sede + 
               ", campanhas=" + campanhas + "]";
    }
}