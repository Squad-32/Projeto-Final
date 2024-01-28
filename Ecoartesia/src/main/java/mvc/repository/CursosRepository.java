package mvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import mvc.model.Cursos;

@Repository
public interface CursosRepository extends JpaRepository<Cursos, Long> {
}