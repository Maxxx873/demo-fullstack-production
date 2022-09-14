package com.mock.productionserver.entity;

import lombok.*;

import javax.persistence.*;

@Entity
@Getter
@Setter
@Builder
@ToString
@NoArgsConstructor
@AllArgsConstructor
@Table(name="users")
public class UserEntity {

    @Id
    @GeneratedValue
    private Integer id;

    @Column(name="login")
    private String user;

    private String pswd;
}
