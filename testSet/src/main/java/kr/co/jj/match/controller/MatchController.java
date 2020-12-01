package kr.co.jj.match.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.mysql.jdbc.log.Log;

import kr.co.jj.company.controller.CompanyController;
import kr.co.jj.company.vo.CompanyVO;
import kr.co.jj.match.service.MatchService;
import kr.co.jj.match.vo.UserMatchVO;
import kr.co.jj.user.controller.UserController;
import kr.co.jj.user.service.UserService;
import kr.co.jj.user.service.impl.UserServiceImpl;
import kr.co.jj.user.vo.RequireVO;
import kr.co.jj.user.vo.UserVO;

@Controller
public class MatchController {
	
	private static final Logger logger = LoggerFactory.getLogger(MatchController.class);
	
	@Autowired
	UserController userController;

	@Autowired
	CompanyController companyController;
	
	@Autowired
	UserService userService;
	
	@Autowired
	MatchService matchService;
	
	/**
	 * 유저 매칭
	 */
	@GetMapping("/user/match")
	public String matchUser(Model model, HttpSession session) throws Exception {
		String id = (String)session.getAttribute("usrloginId");
		
		UserVO user = userController.getUser(id);
		
		model.addAttribute("user", user);
		
		RequireVO reqVo = userService.selectRequire(user);
		logger.debug(reqVo.toString());
		model.addAttribute("reqVo", reqVo);
		
		List<UserMatchVO> list = new ArrayList<UserMatchVO>();
		list = matchService.selectMatchListForUser(reqVo);
		
		logger.debug(list.toString());
		
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
