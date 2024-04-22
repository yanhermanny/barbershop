package br.com.facesg.barbershop.model.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum WeekDayEnum {
    SUNDAY("DOM"),
    MONDAY("SEG"),
    TUESDAY("TER"),
    WEDNESDAY("QUA"),
    THURSDAY("QUI"),
    FRIDAY("SEX"),
    SATURDAY("SAB");

    private String code;
}
