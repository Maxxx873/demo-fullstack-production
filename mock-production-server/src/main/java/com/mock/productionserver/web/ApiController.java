package com.mock.productionserver.web;

import com.mock.api.ProductionServerApi;
import com.mock.model.RESULT;
import com.mock.productionserver.service.ResultService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;

@Controller
@CrossOrigin
@RequiredArgsConstructor
public class ApiController implements ProductionServerApi {

    private final ResultService resultService;

    @Override
    public ResponseEntity<RESULT> getResponse(String CMD, String PARAM) {

        if (CMD != null) {
            switch (CMD) {
                case "ECHO" -> {
                    return ResponseEntity.ok(resultService.echo());
                }
                case "GET_PDO_USER" -> {
                    return ResponseEntity.ok(resultService.getOsoUser(PARAM));
                }
                case "GET_OSO_VYPUSK" -> {
                    return ResponseEntity.ok(resultService.getPdoVypusk(PARAM));
                }
            }
        }
        return ResponseEntity.badRequest().body(RESULT.builder().EXITCODE(100).EXITTEXT("Bad request").build());
    }
}
