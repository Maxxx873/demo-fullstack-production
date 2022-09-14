package com.mock.productionserver.mapper;

import com.mock.model.Parameters;

public interface ParametersMapper {

    /**
     * maps a String to Parameters object
     *
     * @return the resulting Parameters object
     */
    Parameters stringToParameters(String parametersString);
}
