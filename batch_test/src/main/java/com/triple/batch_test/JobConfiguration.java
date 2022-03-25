package com.triple.batch_test;

import com.triple.batch_test.entity.InsertTest;
import lombok.RequiredArgsConstructor;
import org.springframework.batch.core.Job;
import org.springframework.batch.core.Step;
import org.springframework.batch.core.configuration.annotation.JobBuilderFactory;
import org.springframework.batch.core.configuration.annotation.StepBuilderFactory;
import org.springframework.batch.core.launch.support.RunIdIncrementer;
import org.springframework.batch.item.ItemReader;
import org.springframework.batch.item.ItemWriter;
import org.springframework.batch.item.database.builder.JpaCursorItemReaderBuilder;
import org.springframework.batch.repeat.RepeatStatus;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import javax.persistence.EntityManager;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;

@Configuration
@RequiredArgsConstructor
public class JobConfiguration {

    private final JobBuilderFactory jobBuilderFactory;
    private final StepBuilderFactory stepBuilderFactory;

    private final EntityManager entityManager;

    private final String JOB_NAME = "JOB-";
    private final String STEP_NAME = "STEP-";
    private final String NUMBERING = "1";

    @Bean(name = JOB_NAME + NUMBERING)
    public Job job() {
        return jobBuilderFactory.get(JOB_NAME + NUMBERING)
                .incrementer(new RunIdIncrementer())
                .start(step1())
                .build();
    }

    @Bean(name = STEP_NAME + NUMBERING + "-1")
    public Step step1() {
        return stepBuilderFactory.get(STEP_NAME + NUMBERING + "-1")
                .tasklet((contribution, chunkContext) -> {
                    entityManager.persist(InsertTest.builder().createdDate(LocalDateTime.now()).build());
                    return RepeatStatus.FINISHED;
                })
                .build();
    }
}