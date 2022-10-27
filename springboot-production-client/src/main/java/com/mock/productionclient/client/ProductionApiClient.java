package com.mock.productionclient.client;

import com.mock.productionclient.model.Result;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;
import org.springframework.web.reactive.function.client.WebClient;

@Component
@RequiredArgsConstructor
public class ProductionApiClient {

    private final WebClient webClient;

    public Result getResponse(String apikey, String cmd, String param) {
        return webClient.get()
                .uri(uriBuilder -> uriBuilder
                        .path("/")
                        .queryParam("API_KEY", apikey)
                        .queryParam("CMD", cmd)
                        .queryParam("PARAM", param)
                        .build())
                .retrieve()
                .bodyToMono(Result.class)
                .block();
    }
}
