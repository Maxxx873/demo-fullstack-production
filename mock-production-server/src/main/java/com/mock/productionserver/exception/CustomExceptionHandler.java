package com.mock.productionserver.exception;

import com.mock.model.RESULT;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@Slf4j
@RestControllerAdvice
public class CustomExceptionHandler {

    @ExceptionHandler(Exception.class)
    public final ResponseEntity<RESULT> handleException(Exception ex) {
        log.error("Exception: {}", ex.getMessage());
        return ResponseEntity.badRequest().body(RESULT.builder().EXITCODE(100).EXITTEXT("Bad request").build());
    }

}
