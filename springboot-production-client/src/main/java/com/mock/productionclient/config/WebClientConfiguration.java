package com.mock.productionclient.config;

import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.dataformat.xml.XmlMapper;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.web.reactive.function.client.WebClient;

@Configuration
public class WebClientConfiguration {

    @Value("${baseUrl}")
    private String baseUrl;

    @Bean
    public WebClient getWebClient(WebClient.Builder builder) {
        return builder.baseUrl(baseUrl)
                .build();
    }

    @Bean
    @Qualifier("jsonMapper")
    public ObjectMapper jsonMapper() {
        return new ObjectMapper().disable(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES);
    }

    @Bean
    @Primary
    @Qualifier("xmlMapper")
    public ObjectMapper xmlMapper() {
        return new XmlMapper().disable(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES);
    }

}
