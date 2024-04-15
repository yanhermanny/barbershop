package br.com.facesg.barbershop.config.converters;

import java.util.stream.Stream;

import br.com.facesg.barbershop.model.enums.WeekDayEnum;
import jakarta.persistence.AttributeConverter;
import jakarta.persistence.Converter;

@Converter(autoApply = true)
public class WeekDayConverter implements AttributeConverter<WeekDayEnum, String> {

    @Override
    public String convertToDatabaseColumn(WeekDayEnum weekDay) {
        if (weekDay == null) {
            return null;
        }
        return weekDay.getCode();
    }

    @Override
    public WeekDayEnum convertToEntityAttribute(String weekDay) {
        if (weekDay == null) {
            return null;
        }

        return Stream.of(WeekDayEnum.values())
                .filter(w -> w.getCode().equals(weekDay))
                .findFirst()
                .orElseThrow(IllegalArgumentException::new);
    }

}
