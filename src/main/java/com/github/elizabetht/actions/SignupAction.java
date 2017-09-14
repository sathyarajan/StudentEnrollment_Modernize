package com.github.elizabetht.actions;

import com.github.elizabetht.model.Student;

import com.github.elizabetht.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.Map;

@Controller
public class SignupAction {

	@Autowired
	private StudentService studentService;

	@RequestMapping("/signup-input")
	public String input(Model model) throws Exception {
		model.addAttribute("studentForm", new Student());
		return "signup";
	}

	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public String execute(@Valid @ModelAttribute("studentForm") Student studentForm,
						  BindingResult result, Map<String, Object> model) throws Exception {
		String signupResult = "";
		System.out.println("page "+studentForm.getPageName());
		if (result.hasErrors()) {
			return "signup-input";
		}
		if (studentForm.getPageName() != null && studentService != null) {
			if (studentForm.getPageName().equals("signup")) {
				signupResult = studentService.save(studentForm);
				if (signupResult.equals("SignupSuccess")) {
					return "redirect:login-input";
				} else {
					return "signup-failure";
				}
			}
		}
		return "success";
	}
}
