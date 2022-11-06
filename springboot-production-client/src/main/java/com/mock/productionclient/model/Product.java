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
@JacksonXmlRootElement(localName = "ITEM")
public class Product {

    @JsonProperty("SN")
    @JacksonXmlProperty(localName = "SN")
    private String sn;
    @JsonProperty("SIGN")
    @JacksonXmlProperty(localName = "SIGN")
    private String sign;
    @JsonProperty("NAME")
    @JacksonXmlProperty(localName = "NAME")
    private String name;
}
