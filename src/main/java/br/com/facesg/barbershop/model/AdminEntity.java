package br.com.facesg.barbershop.model;

import jakarta.persistence.Entity;
import jakarta.persistence.PrimaryKeyJoinColumn;

@Entity(name = "ADMINISTRADOR")
@PrimaryKeyJoinColumn(name = "id_administrador")
public class AdminEntity extends UserEntity {
}
