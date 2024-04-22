package br.com.facesg.barbershop.model;

import java.io.Serializable;
import java.time.LocalDateTime;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity(name = "produto_barbeiro")
public class ProductBarberEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_produto_barbeiro", nullable = false, unique = true, insertable = false, updatable = false)
    private Long id;

    @ManyToOne(optional = false, cascade = CascadeType.ALL)
    @JoinColumn(name = "id_produto", nullable = false)
    private ProductEntity product;

    @ManyToOne(optional = false, cascade = CascadeType.ALL)
    @JoinColumn(name = "id_barbeiro", nullable = false)
    private BarberEntity barber;

    @Column(name = "quantidade", nullable = false)
    private Integer quantity;

    @Column(name = "datahora_retirada")
    private LocalDateTime withdrawalDateTime;
}
