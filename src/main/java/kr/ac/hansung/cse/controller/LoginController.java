package kr.ac.hansung.cse.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * Handles requests for the application home page.
 */
@Controller /* 빈으로 등록한다. */
public class LoginController {

	@RequestMapping("/login")
	public String showLogin(Model model, @RequestParam(value="error", required=false) String error) {
		
		if(error != null) {
			model.addAttribute("errorMsg", "Invalid username or password");
		}
		
		return "login";
	}
}
