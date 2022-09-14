package com.mock.productionserver.mapper;

import com.google.common.base.CaseFormat;
import com.google.common.base.Splitter;
import com.mock.model.Parameters;
import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import java.beans.IntrospectionException;
import java.beans.PropertyDescriptor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

@Slf4j
@Component
@RequiredArgsConstructor
public class ParametersMapperImpl implements ParametersMapper {

    @Override
    @SneakyThrows
    public Parameters stringToParameters(String parametersString) {

        Parameters params = new Parameters();

        if (parametersString == null) {
            return params;
        }

        Map<String, String> inputParamsMap = Splitter.on(";").trimResults().withKeyValueSeparator("=").split(parametersString);
        Map<String, String> camelCaseParamsMap = new HashMap<>();

        var f = Arrays.stream(Parameters.class.getDeclaredFields()).toList();
        var fieldNamesList = Arrays.stream(Parameters.class.getDeclaredFields()).toList().stream().map(Field::getName).toList();
        inputParamsMap.keySet().forEach(key -> {
            camelCaseParamsMap.put(CaseFormat.LOWER_UNDERSCORE.to(CaseFormat.LOWER_CAMEL, key), inputParamsMap.get(key));
        });

        for (String key : camelCaseParamsMap.keySet()) {
            if (fieldNamesList.contains(key)) {
                invokeSetter(params, key, camelCaseParamsMap.get(key));
            }
        }

        log.info("Mapped parameters: \n{}", params);
        return params;
    }

    private void invokeSetter(Object obj, String fieldName, Object variableValue) {
        PropertyDescriptor pd;
        try {
            pd = new PropertyDescriptor(fieldName, obj.getClass());
            Method setter = pd.getWriteMethod();
            try {
                setter.invoke(obj, variableValue);
            } catch (IllegalAccessException | IllegalArgumentException | InvocationTargetException e) {
                e.printStackTrace();
            }
        } catch (IntrospectionException e) {
            e.printStackTrace();
        }
    }
}
