package com.mock.productionclient.client;

import com.mock.productionclient.model.Result;
import com.mock.productionclient.util.ResponseParser;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.reactive.function.client.WebClient;

@Component
@RequiredArgsConstructor
public class ProductionApiClient {

    @Value("${API_KEY}")
    private String apiKey;

    private final ResponseParser responseParser;
    private final WebClient webClient;

    public Result getResult(String cmd, String param) {
        var response = webClient.get()
                .uri(uriBuilder -> uriBuilder
                        .path("/")
                        .queryParam("API_KEY", apiKey)
                        .queryParam("CMD", cmd)
                        .queryParam("PARAM", param)
                        .build())
                .retrieve()
                .bodyToMono(String.class)
                .block();

        return responseParser.parseResponse(response);
    }

    public Result getUser(String login, String password) {
        var response = webClient.get()
                .uri(uriBuilder -> uriBuilder
                        .path("/")
                        .queryParam("API_KEY", apiKey)
                        .queryParam("CMD", "GET_PDO_USER")
                        .queryParam("PARAM", String.format("user=%s;pswd=%s", login, password))
                        .build())
                .retrieve()
                .bodyToMono(String.class)
                .block();
        return responseParser.parseResponse(response);
    }

}
