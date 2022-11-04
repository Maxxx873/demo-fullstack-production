package com.mock.productionclient.util;

import com.fasterxml.jackson.core.JacksonException;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.mock.productionclient.model.Result;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import java.io.UncheckedIOException;

@Component
public class ResponseParser {

    private final ObjectMapper xmlMapper;
    private final ObjectMapper jsonMapper;

    public ResponseParser(@Qualifier("xmlMapper") ObjectMapper xmlMapper,
                          @Qualifier("jsonMapper") ObjectMapper jsonMapper) {
        this.xmlMapper = xmlMapper;
        this.jsonMapper = jsonMapper;
    }

    public Result parseResponse(String response) {
        try {
            if (isValidXml(response)) {
                return xmlMapper.readValue(response, Result.class);
            } else {
                return jsonMapper.readValue(response, Result.class);
            }
        } catch (JsonProcessingException e) {
            throw new UncheckedIOException("Invalid production server response!", e);
        }
    }

    public boolean isValidXml(String xml) {
        try {
            xmlMapper.readTree(xml);
        } catch (JacksonException e) {
            return false;
        }
        return true;
    }
}
