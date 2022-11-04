package com.mock.productionclient.model;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlProperty;
import com.fasterxml.jackson.dataformat.xml.annotation.JacksonXmlRootElement;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
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
