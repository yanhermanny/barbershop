package br.com.facesg.barbershop.config.converters;

import java.util.stream.Stream;

import br.com.facesg.barbershop.model.enums.StatusEnum;
import jakarta.persistence.AttributeConverter;
import jakarta.persistence.Converter;

@Converter(autoApply = true)
public class StatusConverter implements AttributeConverter<StatusEnum, String> {

    @Override
    public String convertToDatabaseColumn(StatusEnum status) {
        if (status == null) {
            return null;
        }
        return status.getCode();
    }

    @Override
    public StatusEnum convertToEntityAttribute(String status) {
        if (status == null) {
            return null;
        }

        return Stream.of(StatusEnum.values())
                .filter(s -> s.getCode().equals(status))
                .findFirst()
                .orElseThrow(IllegalArgumentException::new);
    }
}
