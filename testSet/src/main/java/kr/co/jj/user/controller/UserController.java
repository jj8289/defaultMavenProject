package kr.co.jj.user.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.jj.user.service.UserService;
import kr.co.jj.user.vo.RegisterOneVO;
import kr.co.jj.user.vo.RegisterVO;
import kr.co.jj.user.vo.UserVO;

@Controller
public class UserController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	private UserService userService;
	
	@GetMapping("/join")
	public String join(Model model) {
		
		return "user/join"; 
	}
	
	@GetMapping("/login")
	public String login(Model model) {
		
		return "user/login"; 
	}
	
	@GetMapping("/register")
	public String register( Model model) {
		
		return "user/register";
	}
	
	@ResponseBody
	@PostMapping(value = "/join/joinChk")
	public String joinChk(UserVO user, Model model) throws Exception{
		
		// 아이디 중복 체크
		boolean chk = idDupleChk(user);
		if(!chk) { 
			userService.insertUser(user);
			
			return "success";
		}
		
		return "fail";
	}
	
	@ResponseBody
	@PostMapping(value = "/login/loginChk")
	public String loginChk(UserVO user, Model model, HttpSession session) throws Exception{
		logger.debug(user.toString());
		
		// 아이디 중복 체크
		boolean chk = userChk(user);
		if(chk) { 
			session.setAttribute("loginId", user.getUserId());
			return "success"; 
		}
		
		return "fail";
	}
	
	
	@PostMapping(value = "register/registerChk")
	@ResponseBody 
	public Map<String, Object> registerChk(@RequestBody RegisterVO json, Model model, HttpSession session){
		System.out.println(json.toString());
		 
		Map<String, Object> res = new HashMap<String, Object>(); 
		
		try {
			List<String> locList = json.getLocList();
			
			String userId = (String) session.getAttribute("loginId");
			UserVO vo = new UserVO();
			vo.setUserId(userId);
			
			UserVO user = userService.selectUserByUserId(vo);
			
			json.setUserNo(user.getUserNo());
			
			String loc = "";
			String dow = "";
			
			for(int i = 0; i<locList.size(); i++) {
				loc += locList.get(i);
				if(i != locList.size() - 1) {
					loc += "/";
				}
			}
			
			json.setLocation(loc);
			
			if(json.getSearchDow() != null) {
				List<String> dowList = json.getDowList();
				
				
				for(int i = 0; i<dowList.size(); i++) {
					dow += dowList.get(i);
					if(i != dowList.size() - 1) {
						dow += "/";
					}
				}
				
				json.setSearchDow(dow);
			}else {
				json.setSearchDow("");
			}
			
			if(json.getSearchStart().equals("") && json.getSearchEnd().equals("")) {
				json.setSearchStart(null);
				json.setSearchEnd(null);
			}
			
			logger.debug(json.toString());
			
			//조건 등록이 이미 있다면 변경되게끔.
			userService.updateRegister(json);
			
			res.put("list", json);  
			  

		} catch (Exception e) {
			logger.error("err {}", e.getMessage());
			res.put("errmsg", e.getMessage());
			res.put("param", json.toString());
		}
		
		return res;
	}
	
	// 아이디 중복 체크
	public boolean idDupleChk(UserVO user) throws Exception {
		
		int chk = userService.selectUserCountByUserId(user);
		
		if(chk == 0) {
			return false;
		}
		return true;
	}
	
	// 유저 중복 체크
	public boolean userChk(UserVO user) throws Exception {
		
		int chk = userService.selectUser(user);
		
		if(chk == 1) {
			return true;
		}
		return false;
	}
}
