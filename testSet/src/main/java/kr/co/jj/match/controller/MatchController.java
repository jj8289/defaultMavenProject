package kr.co.jj.match.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MatchController {
	
	@GetMapping("/match")
	public String match(HttpSession session, Model model) {
		
		String userId = (String) session.getAttribute("loginId");
		
		model.addAttribute("userId", userId);
		
		return "match/home";
	}
}
