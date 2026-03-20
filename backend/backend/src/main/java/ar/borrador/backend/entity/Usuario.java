package ar.borrador.backend.entity;

import ar.borrador.backend.enums.Rol;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Entity
@Table(name = "Usuarios")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Usuario {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    private UUID id;
    @Column(nullable = false)
    private String nombre;
    @Column(nullable = false, unique = true)
    private String email;
    @Column(nullable = false)
    private String password;
    private LocalDateTime fechaCreacion;
    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private Rol rol = Rol.ROLE_USER;
    @OneToMany(mappedBy = "usuario")
    private List<Carpeta> carpetas = new ArrayList<>();
    @OneToMany(mappedBy = "usuario")
    private List<Nota> notas = new ArrayList<>();
}
