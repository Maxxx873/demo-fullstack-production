package com.mock.productionserver.service;

import com.mock.model.RESULT;

public interface ResultService {

    /**
     * Server Availability Check
     */
    RESULT echo();

    /**
     * Get user information
     *
     * @param param function parameters
     * @return RESULT
     */
    RESULT getOsoUser(String param);

    /**
     * Get user information
     *
     * @param param function parameters
     * @return RESULT
     */
    RESULT getPdoVypusk(String param);
}
