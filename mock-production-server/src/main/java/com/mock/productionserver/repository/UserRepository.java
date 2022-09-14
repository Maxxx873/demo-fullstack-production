package com.mock.productionserver.repository;

import com.mock.productionserver.entity.UserEntity;
import org.springframework.data.repository.CrudRepository;

import java.util.Optional;

public interface UserRepository extends CrudRepository<UserEntity, Integer> {
    Optional<UserEntity> findByUserAndPswd(String user, String pswd);

}
