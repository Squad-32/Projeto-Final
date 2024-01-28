package mvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import mvc.model.Campanhas;

@Repository
public interface CampanhasRepository extends JpaRepository<Campanhas, Long> {
}