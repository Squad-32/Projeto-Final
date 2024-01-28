package mvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import mvc.model.Voluntarios;

@Repository
public interface VoluntariosRepository extends JpaRepository<Voluntarios, Long> {
}