package com.github.elizabetht.actions;


import com.github.elizabetht.model.User;
import com.github.elizabetht.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.Map;

@Controller
public class LoginAction {

	@Autowired
	private StudentService studentService;

	@RequestMapping("/")
	public String index() {
		return "index";
	}

	@RequestMapping("/login-input")
	public String input(Model model) throws Exception {
		model.addAttribute("userForm", new User());
		return "login";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String execute(@Valid @ModelAttribute("userForm") User userForm,
						  BindingResult result, Map<String, Object> model) throws Exception {
		String loginResult = "";
		if (result.hasErrors()) {
			return "login-failure";
		}
		if (userForm.getPageName() != null && studentService != null) {
			if (userForm.getPageName().equals("login")) {
				loginResult = studentService.findByLogin(userForm);
				if (loginResult.equals("LoginFailure")) {
					return "login-failure";
				} else {
					return "login-success";
				}
			}
		}
		return "success";
	}
}