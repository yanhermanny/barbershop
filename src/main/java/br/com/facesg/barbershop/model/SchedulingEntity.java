package br.com.facesg.barbershop.model;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Set;

import br.com.facesg.barbershop.model.enums.StatusEnum;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity(name = "agendamento")
public class SchedulingEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_agendamento", nullable = false, unique = true, insertable = false, updatable = false)
    private Long id;

    @Column(name = "datahora_agendamento", nullable = false)
    private LocalDateTime schedulingDateTime;

    @Column(name = "datahora_inicio")
    private LocalDateTime startingDateTime;

    @Column(name = "datahora_fim")
    private LocalDateTime endingDateTime;

    @Enumerated(EnumType.STRING)
    @Column(name = "status", nullable = false, length = 10)
    private StatusEnum status;

    @ManyToOne(optional = false)
    @JoinColumn(name = "id_cliente", nullable = false)
    private ClientEntity client;

    @ManyToOne(optional = false)
    @JoinColumn(name = "id_barbeiro", nullable = false)
    private BarberEntity barber;

    @ManyToMany
    @JoinTable(
        name = "AGENDAMENTO_SERVICO",
        joinColumns = @JoinColumn(name = "id_agendamento"),
        inverseJoinColumns = @JoinColumn(name = "id_servico")
    )
    private Set<ServiceEntity> serviceSet;

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
