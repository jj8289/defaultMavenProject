package kr.co.jj.match.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.jj.company.controller.CompanyController;
import kr.co.jj.company.vo.CompanyVO;
import kr.co.jj.user.controller.UserController;
import kr.co.jj.user.vo.UserVO;

@Controller
public class MatchController {
	
	@Autowired
	UserController userController;

	@Autowired
	CompanyController companyController;
	
	
	/**
	 * 유저 매칭
	 */
	@GetMapping("/user/match")
	public String matchUser(Model model, HttpSession session) throws Exception {
		String id = (String)session.getAttribute("usrloginId");
		
		UserVO user = userController.getUser(id);
		
		model.addAttribute("user", user);
		
		return "user/match"; 
	}
	
	/**
	 * 병원 매칭
	 */
	@GetMapping("/company/match")
	public String matchComp(Model model, HttpSession session) throws Exception {
		String id = (String)session.getAttribute("mgloginId");
		
		CompanyVO comp = companyController.getCompany(id);
		
		model.addAttribute("comp", comp);
		
		return "company/match"; 
	}
}
