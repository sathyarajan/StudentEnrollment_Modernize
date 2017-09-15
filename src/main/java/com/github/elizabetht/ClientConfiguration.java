package com.github.elizabetht;

import com.github.elizabetht.client.StudentClient;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.client.RestOperations;
import org.springframework.web.client.RestTemplate;

@Configuration
public class ClientConfiguration {

    @Value("${studentUrl}")
    private String studentUrl;

    @Bean
    public RestOperations restOperations() {
        return new RestTemplate();
    }

    @Bean
    public StudentClient studentClient(RestOperations restOperations) {
        return new StudentClient(studentUrl, restOperations);
    }
}
