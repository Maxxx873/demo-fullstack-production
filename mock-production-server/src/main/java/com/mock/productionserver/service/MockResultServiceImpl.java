package com.mock.productionserver.service;

import com.github.javafaker.Faker;
import com.mock.model.Product;
import com.mock.model.RESULT;
import com.mock.model.RESULTDATA;
import com.mock.productionserver.mapper.ParametersMapper;
import com.mock.productionserver.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

@Slf4j
@Service
@RequiredArgsConstructor
public class MockResultServiceImpl implements ResultService {

    final Integer ID_DIGIT_COUNT = 6;
    private final ParametersMapper parametersMapper;
    private final Faker faker;
    private final UserRepository userRepository;

    @Override
    public RESULT echo() {
        log.info("Running ECHO function");

        return RESULT.builder().EXITCODE(0).EXITTEXT("Ok").build();
    }

    @Override
    public RESULT getPdoUser(String param) {
        log.info("Running GET_PDO_USER function with following parameters: {}", param);

        if (userRepository.findByUserAndPswd(parametersMapper.stringToParameters(param).getUser(), parametersMapper.stringToParameters(param).getPswd()).isPresent()) {
            return RESULT.builder()
                    .EXITCODE(0)
                    .EXITTEXT("Ok")
                    .DATA(RESULTDATA.builder()
                            .ID(faker.number().digits(ID_DIGIT_COUNT))
                            .ID_GUIDE_CEH(faker.number().digits(ID_DIGIT_COUNT))
                            .FIRSTNAME(faker.name().firstName())
                            .LASTNAME(faker.name().lastName())
                            .SURNAME("")
                            .ID_GUIDE_CONCERN(faker.number().digits(ID_DIGIT_COUNT))
                            .build())
                    .build();
        }

        return RESULT.builder().EXITCODE(100).EXITTEXT("User not exist").build();
    }

    @Override
    public RESULT getPdoVypusk(String param) {
        log.info("Running GET_OSO_VYPUSK function with following parameters: {}", param);

        var random = new Random();
        List<Product> productList = new ArrayList<>();

        for (int i = 1; i <= random.ints(1, 100).findFirst().getAsInt(); i++) {
            productList.add(generateProduct());
        }

        return RESULT.builder()
                .EXITCODE(0)
                .EXITTEXT("Ok")
                .PAGE_SIZE(intFromString(parametersMapper.stringToParameters(param).getPageSize()))
                .PAGE(intFromString(parametersMapper.stringToParameters(param).getPage()))
                .RECORD_COUNT(productList.size())
                .DATA(RESULTDATA.builder()
                        .ITEM(productList)
                        .build())
                .build();
    }

    private Product generateProduct() {
        return Product.builder()
                .SN(faker.number().digits(10))
                .NAME(faker.company().name())
                .SIGN(faker.app().name())
                .build();
    }

    private Integer intFromString(String inputString) {
        return (inputString == null) ? null : Integer.parseInt(inputString);
    }
}
