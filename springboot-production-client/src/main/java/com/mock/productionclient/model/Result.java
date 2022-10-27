package com.mock.productionclient.model;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Result {

    @JsonProperty("EXITCODE")
    private Integer exitCode;
    @JsonProperty("EXITTEXT")
    private String exitText;
}
