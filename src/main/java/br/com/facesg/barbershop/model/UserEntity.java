package br.com.facesg.barbershop.model;

import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalDateTime;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Inheritance;
import jakarta.persistence.InheritanceType;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity(name = "USUARIO")
@Inheritance(strategy = InheritanceType.JOINED)
public abstract class UserEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id_usuario", nullable = false, unique = true, insertable = false, updatable = false)
	private Long id;

	@Column(name = "nome", nullable = false)
	private String name;

	@Column(name = "sobrenome")
	private String surname;

	@Column(name = "email", nullable = false, unique = true)
	private String email;

	@Column(name = "senha", nullable = false, length = 20)
	private String password;

	@Column(name = "telefone", nullable = false, length = 13)
	private String phone_number;

	@Column(name = "data_nascimento")
	private LocalDate birthDate;

    @ManyToOne(optional = false)
    @JoinColumn(name = "incluido_por", nullable = false, insertable = true, updatable = false)
    private UserEntity includedBy;

	@Column(name = "data_inclusao", nullable = false, insertable = true, updatable = false)
	private LocalDateTime inclusionDate;

    @ManyToOne(optional = true)
    @JoinColumn(name = "alterado_por", nullable = true, insertable = false, updatable = true)
    private UserEntity changedBy;

	@Column(name = "data_alteracao", nullable = true, insertable = false, updatable = true)
	private LocalDateTime changeDate;

    @ManyToOne(optional = true)
    @JoinColumn(name = "excluido_por", nullable = true, insertable = false, updatable = true)
    private UserEntity deletedBy;

	@Column(name = "data_exclusao", nullable = true, insertable = false, updatable = true)
	private LocalDateTime deletionDate;
}
