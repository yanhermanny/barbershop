package br.com.facesg.barbershop.model;

import java.util.Set;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.OneToMany;
import jakarta.persistence.PrimaryKeyJoinColumn;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode(callSuper = true)
@PrimaryKeyJoinColumn(name = "id_barbeiro")
@Entity(name = "barbeiro")
public class BarberEntity extends UserEntity {

    @Column(name = "especialidade")
    private String expertise;

    @OneToMany(mappedBy = "barber")
    private Set<ProductBarberEntity> productBarberSet;

    @ManyToMany(mappedBy = "barberSet")
    private Set<WorkHourEntity> workHourSet;
}
