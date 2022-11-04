package com.mock.productionclient.client;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.mock.productionclient.model.Result;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.cloud.contract.wiremock.AutoConfigureWireMock;
import org.springframework.test.context.ActiveProfiles;

import static com.github.tomakehurst.wiremock.client.WireMock.*;
import static org.assertj.core.api.BDDAssertions.then;


@AutoConfigureWireMock
@ActiveProfiles("test")
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
public class ProductClientTest {

    @Autowired
    private ProductionApiClient productionApiClient;

    @Test
    void getResponse_ECHO_from_JSON_isReturned() throws JsonProcessingException {
        //given
        String apiKey = "KEY-123";
        String cmd = "ECHO";
        String param = "";
        stubFor(get(urlEqualTo(String.format("/?API_KEY=%s&CMD=%s&PARAM=%s", apiKey, cmd, param)))
                .willReturn(okJson("""
                                {
                                  "EXITCODE": 0,
                                  "EXITTEXT": "Ok"
                                }
                        """)));

        //when
        Result result = productionApiClient.getResult(cmd, param);

        //then
        then(result.getExitCode()).isEqualTo(0);
        then(result.getExitText()).isEqualTo("Ok");

    }

    @Test
    void getResponse_ECHO_from_XML_isReturned() throws JsonProcessingException {
        //given
        String apiKey = "KEY-123";
        String cmd = "ECHO";
        String param = "";
        stubFor(get(urlEqualTo(String.format("/?API_KEY=%s&CMD=%s&PARAM=%s", apiKey, cmd, param)))
                .willReturn(okJson("""
                                    <RESULT>
                                      <EXITCODE>0</EXITCODE>
                                      <EXITTEXT>Ok</EXITTEXT>
                                    </RESULT>
                        """)));

        //when
        Result result = productionApiClient.getResult(cmd, param);

        //then
        then(result.getExitCode()).isEqualTo(0);
        then(result.getExitText()).isEqualTo("Ok");

    }
}
