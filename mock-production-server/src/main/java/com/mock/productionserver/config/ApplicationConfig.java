package com.mock.productionserver.config;

import com.github.javafaker.Faker;
import org.springdoc.core.SpringDocConfigProperties;
import org.springdoc.core.SpringDocConfiguration;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import java.util.Locale;

@Configuration
public class ApplicationConfig {

    @Bean
    public SpringDocConfiguration springDocConfiguration() {
        return new SpringDocConfiguration();
    }

    @Bean
    public SpringDocConfigProperties springDocConfigProperties() {
        return new SpringDocConfigProperties();
    }

    @Bean
    public Faker faker() {
        return new Faker(new Locale("ru"));
    }

}
