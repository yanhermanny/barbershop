package br.com.facesg.barbershop.model;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Set;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity(name = "PRODUTO")
public class ProductEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_produto", nullable = false, unique = true, insertable = false, updatable = false)
    private Long id;

    @Column(name = "nome", nullable = false, unique = true)
    private String name;

    @Column(name = "descricao")
    private String description;

    @Column(name = "quantidade", nullable = false)
    private Integer quantity;

    @OneToMany(mappedBy = "product")
    private Set<ProductBarberEntity> productBarberSet;

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
