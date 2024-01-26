package mvc_repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import mvc_model.Usuarios;

@Repository
public interface UsuariosRepository extends JpaRepository<Usuarios, Long> {

}