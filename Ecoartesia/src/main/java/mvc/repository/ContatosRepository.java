package mvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import mvc.model.Contatos;

@Repository
public interface ContatosRepository extends JpaRepository<Contatos, Long> {
}