package com.github.elizabetht.client;

import com.github.elizabetht.model.Error;
import com.github.elizabetht.model.Student;
import com.github.elizabetht.model.StudentResponse;
import com.github.elizabetht.model.User;
import com.netflix.hystrix.contrib.javanica.annotation.HystrixCommand;
import org.springframework.web.client.RestOperations;

public class StudentClient {

    private RestOperations restOperations;

    private String studentUrl;

    public  StudentClient(String studentUrl, RestOperations restOperations) {
        this.studentUrl = studentUrl;
        this.restOperations = restOperations;
    }

    public StudentResponse save(Student student) {
        return restOperations.postForEntity(studentUrl, student, StudentResponse.class).getBody();
    }

    public StudentResponse findByLogin(User user) {
        return restOperations.postForEntity(studentUrl+"/login", user, StudentResponse.class).getBody();
    }

    @HystrixCommand(fallbackMethod = "fallBackByUserName")
    public StudentResponse findByUserName(String userName) {
        return restOperations.getForEntity(studentUrl+"/"+userName, StudentResponse.class).getBody();
    }

    public StudentResponse fallBackByUserName(String userName) {
        StudentResponse studentResponse = new StudentResponse();
        studentResponse.setStatus("Failure");
        Error error = new Error();
        error.setErrorCode("DEFAULT_FALLBACK");
        error.setErrorDesc("Student Client is not responding");
        return studentResponse;
    }
}
