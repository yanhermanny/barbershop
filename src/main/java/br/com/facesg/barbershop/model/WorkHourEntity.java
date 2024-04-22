package br.com.facesg.barbershop.model;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.Set;

import br.com.facesg.barbershop.model.enums.WeekDayEnum;
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
@Entity(name = "horario_trabalho")
public class WorkHourEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_horario_trabalho", nullable = false, unique = true, insertable = false, updatable = false)
    private Long id;

    @Enumerated(EnumType.STRING)
    @Column(name = "dia_semana", nullable = false, length = 3)
    private WeekDayEnum weekDay;

    @Column(name = "horario_inicio", nullable = false)
    private LocalTime startingTime;

    @Column(name = "horario_fim", nullable = false)
    private LocalTime endingTime;

    @ManyToMany
    @JoinTable(
        name = "HORARIO_TRABALHO_BARBEIRO",
        joinColumns = @JoinColumn(name = "id_horario_trabalho"),
        inverseJoinColumns = @JoinColumn(name = "id_barbeiro")
    )
    private Set<BarberEntity> barberSet;

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
