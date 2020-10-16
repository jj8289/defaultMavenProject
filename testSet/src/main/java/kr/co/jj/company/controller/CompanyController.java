package kr.co.jj.company.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.jj.user.controller.UserController;

@Controller
public class CompanyController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	//@Autowired
	//private UserService userService;
	
	@GetMapping("/company/join")
	public String join(Model model) {
		
		return "company/join";
	}
}
