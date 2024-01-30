package mvc.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class videoDTO {

    private Long id;
    private String titulo;
    private String caminhoArquivo;
    private String duracao;
}