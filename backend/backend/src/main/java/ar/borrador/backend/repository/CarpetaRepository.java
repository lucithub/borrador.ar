package ar.borrador.backend.repository;

import ar.borrador.backend.entity.Carpeta;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.UUID;

@Repository
public interface CarpetaRepository extends JpaRepository<Carpeta, UUID> {
}
