package com.github.elizabetht.service;

import com.github.elizabetht.client.StudentClient;
import com.github.elizabetht.model.Student;
import com.github.elizabetht.model.StudentResponse;
import com.github.elizabetht.model.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

@Service
public class StudentService {

    private static final Logger LOG = LoggerFactory.getLogger(StudentService.class);

	private StudentClient studentClient;

	public StudentService(StudentClient studentClient) {
		this.studentClient = studentClient;
	}

	public String save(Student student) {
		if (studentClient != null) {
			StudentResponse response = studentClient.findByUserName(student.getUserName());
			if ("Failure".equals(response.getStatus()) || response.getStudentResult()) {
                LOG.warn("User Name Already Exists");
				return "SignupFailure-UserNameExists";
			}
			response = studentClient.save(student);
            if ("Success".equals(response.getStatus())) {
                return "SignupSuccess";
            } else {
                LOG.warn("Sign Up Failure "+response.getStatus());
                return "SignupFailure";
            }
		} else {
			return "SignupFailure";
		}
	}

	public String findByLogin(User user) {
		String result = "LoginFailure";
		if (studentClient != null) {
            StudentResponse response = studentClient.findByLogin(user);
            if ("Success".equals(response.getStatus()) && response.getStudentResult()) {
				result = "LoginSuccess";
			} else {
                LOG.warn("Login Failure "+response.getStatus());
            }
		}
		return result;
	}
}
