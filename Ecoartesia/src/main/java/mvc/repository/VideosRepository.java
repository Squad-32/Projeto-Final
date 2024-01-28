package mvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import mvc.model.Videos;

@Repository
public interface VideosRepository extends JpaRepository<Videos, Long> {
}