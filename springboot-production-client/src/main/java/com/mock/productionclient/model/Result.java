package com.mock.productionclient.model;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlProperty;
import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlRootElement;
import lombok.*;

@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
@JacksonXmlRootElement(localName = "RESULT")
public class Result {

    @JsonProperty("EXITCODE")
    @JacksonXmlProperty(localName = "EXITCODE")
    private Integer exitCode;
    @JsonProperty("EXITTEXT")
    @JacksonXmlProperty(localName = "EXITTEXT")
    private String exitText;
    @JsonProperty("DATA")
    @JacksonXmlProperty(localName = "DATA")
    private Data data;

}
