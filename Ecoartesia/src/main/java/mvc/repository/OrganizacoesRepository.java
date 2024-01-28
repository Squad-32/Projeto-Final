package mvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import mvc.model.Organizacoes;

@Repository
public interface OrganizacoesRepository extends JpaRepository<Organizacoes, Long> {
}