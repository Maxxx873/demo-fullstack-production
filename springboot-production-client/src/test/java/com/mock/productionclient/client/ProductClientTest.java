package com.mock.productionclient.client;

import com.github.tomakehurst.wiremock.matching.StringValuePattern;
import com.mock.productionclient.model.Result;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.cloud.contract.wiremock.AutoConfigureWireMock;

import java.util.HashMap;
import java.util.Map;

import static com.github.tomakehurst.wiremock.client.WireMock.*;
import static org.assertj.core.api.BDDAssertions.then;

@SpringBootTest
@AutoConfigureWireMock
public class ProductClientTest {

    @Autowired
    private ProductionApiClient productionApiClient;

    @Test
    void getResponse_ECHO_isReturned() {
        //given
        String apiKey = "KEY-12";
        String cmd = "ECHO";
        String param = "";
        Map<String, StringValuePattern> stringStringValuePatternMap = new HashMap<>();
        stringStringValuePatternMap.put("API_KEY", matching(apiKey));
        stringStringValuePatternMap.put("CMD", matching(cmd));
        stringStringValuePatternMap.put("PARAM", matching(param));

        stubFor(get(urlEqualTo("/")).withQueryParams(stringStringValuePatternMap).willReturn(okJson("""
                {
                  "EXITCODE": 0,
                  "EXITTEXT": "Ok"
                }
                """)));

        //when
        Result result = productionApiClient.getResponse(apiKey, cmd, param);

        //then
        then(result.getExitCode()).isEqualTo(0);
        then(result.getExitText()).isEqualTo("Ok");

    }
}
