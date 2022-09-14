package com.mock.productionserver.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

    private static final String[] WHITELIST = {
            "/v3/api-docs/**",
            "/v3/api-docs.yml",
            "/api-docs.yml",
            "/swagger-ui/**",
            "/actuator/**",
            "/h2-console/**"
    };
    ApiKeyAuthFilter filter = new ApiKeyAuthFilter();
    @Value("${apiKey}")
    private String API_KEY;

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {

        filter.setAuthenticationManager(new AuthenticationManager() {
            @Override
            public Authentication authenticate(Authentication authentication) throws AuthenticationException {
                String principal = (String) authentication.getPrincipal();
                if (!API_KEY.equals(principal)) {
                    throw new BadCredentialsException("The API key was not found or not the expected value.");
                }
                authentication.setAuthenticated(true);
                return authentication;
            }
        });

        http    .cors().and()
                .csrf().disable().sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS)
                .and()
                .addFilter(filter)
                .authorizeRequests()
                .antMatchers(WHITELIST).permitAll()
                .anyRequest()
                .authenticated();

        return http.build();
    }

}
