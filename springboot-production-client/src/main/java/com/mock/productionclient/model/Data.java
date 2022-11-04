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
@JacksonXmlRootElement(localName = "DATA")
public class Data {
    @JsonProperty("ID")
    @JacksonXmlProperty(localName = "ID")
    private String id;

    @JsonProperty("ID_GUIDE_CEH")
    @JacksonXmlProperty(localName = "ID_GUIDE_CEH")
    private String idGuideCeh;

    @JsonProperty("LASTNAME")
    @JacksonXmlProperty(localName = "LASTNAME")
    private String lastname;

    @JsonProperty("FIRSTNAME")
    @JacksonXmlProperty(localName = "FIRSTNAME")
    private String firstname;

    @JsonProperty("SURNAME")
    @JacksonXmlProperty(localName = "SURNAME")
    private String surname;

    @JsonProperty("ID_GUIDE_CONCERN")
    @JacksonXmlProperty(localName = "ID_GUIDE_CONCERN")
    private String idGuideConcern;
}
