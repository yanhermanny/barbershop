package br.com.facesg.barbershop.model.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum StatusEnum {
    PENDING("PENDENTE"),
    CONFIRMED("CONFIRMADO"),
    CANCELED("CANCELADO");

    private String code;
}
