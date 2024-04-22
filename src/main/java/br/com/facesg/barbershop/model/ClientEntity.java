package br.com.facesg.barbershop.model;

import jakarta.persistence.Entity;
import jakarta.persistence.PrimaryKeyJoinColumn;

@Entity(name = "cliente")
@PrimaryKeyJoinColumn(name = "id_cliente")
public class ClientEntity extends UserEntity {
}
