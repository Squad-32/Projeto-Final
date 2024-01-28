package mvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import mvc.model.Visualizacoes;

@Repository
public interface VisualizacoesRepository extends JpaRepository<Visualizacoes, Long> {
}