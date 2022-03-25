package com.triple.batch_test.entity;

import lombok.AccessLevel;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.time.LocalDateTime;

@Getter
@Entity
@Table(name = "tb_insert")
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class InsertTest {
    @Id
    @GeneratedValue
    @Column(name = "insert_id")
    private Long id;

    private LocalDateTime createdDate;

    @Builder
    public InsertTest(LocalDateTime createdDate) {
        this.createdDate = createdDate;
    }
}
