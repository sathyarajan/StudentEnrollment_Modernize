package com.github.elizabetht.client;

import com.github.elizabetht.model.Student;
import com.github.elizabetht.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestOperations;
import org.springframework.web.client.RestTemplate;

@Component
public class StudentClient {

    private RestOperations restOperations;

    @Value("${studentUrl}")
    private String studentUrl;

    public  StudentClient() {
        this.restOperations = new RestTemplate();
    }

    public void save(Student student) {
        restOperations.postForEntity(studentUrl, student, String.class);
    }

    public boolean findByLogin(User user) {
        return restOperations.postForEntity(studentUrl+"/login", user, Boolean.class).getBody();
    }

    public boolean findByUserName(String userName) {
        return restOperations.getForEntity(studentUrl+"/"+userName, Boolean.class).getBody();
    }
}
