package br.com.facesg.barbershop.model;

import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.Set;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;
import jakarta.validation.constraints.DecimalMax;
import jakarta.validation.constraints.DecimalMin;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity(name = "servico")
public class ServiceEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_servico", nullable = false, unique = true, insertable = false, updatable = false)
    private Long id;

    @Column(name = "nome", nullable = false, unique = true)
    private String name;

    @Column(name = "descricao")
    private String description;

    @Column(name = "duracao_em_minutos")
    private Integer durationInMinutes;

    @DecimalMin(value = "0.00", message = "Price value must be higher or equal to 0.00")
    @DecimalMax(value = "9999.99", message = "Price value must be lower or equal to 9999.99")
    @Column(name = "preco", nullable = false, precision = 6, scale = 2)
    private BigDecimal price;

    @ManyToMany(mappedBy = "serviceSet")
    private Set<SchedulingEntity> schedulingSet;

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
