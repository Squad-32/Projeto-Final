package mvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import mvc.model.Doacoes;

@Repository
public interface DoacoesRepository extends JpaRepository<Doacoes, Long> {
}