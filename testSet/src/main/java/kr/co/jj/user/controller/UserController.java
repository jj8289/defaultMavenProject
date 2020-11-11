package kr.co.jj.user.controller;


import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.jj.common.vo.Job;
import kr.co.jj.user.service.UserService;
import kr.co.jj.user.vo.RequireVO;
import kr.co.jj.user.vo.UserVO;

@Controller
@RequestMapping("/user") 
public class UserController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	private UserService userService;
	
	/**
	 * 회원 가입
	 */
	@GetMapping("/join")
	public String join(Model model) {
		
		Map<String, Object> jobMap = new HashMap<String, Object>();
		
		for(Job job : Job.values()) {
			jobMap.put(job.name(), job.getName());
		} 
		
		model.addAttribute("jobList", jobMap);
		
		return "user/join"; 
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
	
	/**
	 * 로그인
	 */
	@GetMapping("/login")
	public String login(Model model) {
		
		return "user/login"; 
	} 
	
	@ResponseBody
	@PostMapping(value = "/login/loginChk")
	public String loginChk(UserVO user, Model model, HttpSession session) throws Exception{
		logger.debug(user.toString());
		
		// 아이디 중복 체크
		boolean chk = userChk(user);
		if(chk) { 
			session.setAttribute("usrloginId", user.getUserId());
			return "success"; 
		}
		
		return "fail";
	}
	
	/**
	 * 조건 등록
	 */
	@GetMapping("/require")
	public String require(Model model) {
		
		return "user/require";
	}
	
	@PostMapping(value = "/require/requireChk")
	@ResponseBody 
	public Map<String, Object> requireChk(@RequestBody RequireVO json, Model model, HttpSession session){
		System.out.println(json.toString());
		 
		Map<String, Object> res = new HashMap<String, Object>(); 
		
		try {
			List<String> locList = json.getLocList();
			List<String> dowList = json.getDowList();
			
			String userId = (String) session.getAttribute("usrloginId");
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
			
			for(int i = 0; i<dowList.size(); i++) {
				dow += dowList.get(i);
				if(i != dowList.size() - 1) {
					dow += "/";
				}
			}
				
			json.setSearchDow(dow);	
				
			if(json.getSearchStart().equals("")) {
				json.setSearchStart(null);
			}
			
			logger.debug(json.toString());
			
			//조건 등록이 이미 있다면 변경되게끔.
			userService.updateRequire(json);
			
			res.put("list", json);  
			  

		} catch (Exception e) {
			logger.error("err {}", e.getMessage());
			res.put("errmsg", e.getMessage());
			res.put("param", json.toString());
		}
		
		return res;
	}
	
	/**
	 * 마이페이지
	 */
	@GetMapping("/mypage")
	public String mypage(Model model, HttpSession session) throws Exception {
		
		String id = (String)session.getAttribute("usrloginId");
		
		UserVO user = getUser(id);
		
		RequireVO requireVO = userService.selectRequire(user);
		
		model.addAttribute("user", user);
		
		List<String> locList = new ArrayList<String>(); 
		List<String> dowList = new ArrayList<String>();
		
		if(requireVO == null) {
			model.addAttribute("dowList", dowList);
			model.addAttribute("locList", locList);
		} else {
			
			System.out.println("requireVO : " + requireVO.toString());
		
			 
			String[] strLocList = {}; 
			String loc = requireVO.getLocation();
			System.out.println("loc : " + loc); 
			
			if(!loc.equals("0")) {
				strLocList = requireVO.getLocation().split("/");
				
				for(int i = 0; i < strLocList.length; i++) {
					locList.add(strLocList[i]);
				} 
			} else {
				locList.add("0"); 
			}
			
			System.out.println("locList : " + locList);
			requireVO.setLocList(locList);
			 
			model.addAttribute("locList", locList);
			
			
			///////////////////
			String[] strDowList = {};
			if(requireVO.getSearchDow() == null || requireVO.getSearchDow().equals("")) {
				dowList.add("");
			} else { 
				strDowList = requireVO.getSearchDow().split("/");
				
				for(int i = 0; i < strDowList.length; i++) {
					dowList.add(strDowList[i]);
				} 
			} 
			System.out.println("dowList : " + dowList);
			requireVO.setDowList(dowList);
			 
			model.addAttribute("dowList", dowList);
			
			model.addAttribute("vo", requireVO);
		}  
		
		
		return "user/mypage";
	}
	
	
	/**
	 * 내정보
	 */
	@GetMapping("/myinfo")
	public String myinfo(Model model, HttpSession session) throws Exception {
		
		String id = (String)session.getAttribute("usrloginId");
		
		UserVO user = getUser(id);
		
		logger.debug(user.toString());
		
		String jobNm = user.getJobNm();
		
		Map<String, Object> jobMap = new HashMap<String, Object>();
		
		for(Job job : Job.values()) {
			jobMap.put(job.name(), job.getName());
			if(jobNm.equals(job.name())) {
				System.out.println("job.name : " + job.name());
				System.out.println("job.getName : " + job.getName());
				System.out.println("user.getJobNm() : " + jobNm);
				 
			}
		} 
		
		model.addAttribute("user", user);
		model.addAttribute("jobNm", jobNm);
		model.addAttribute("jobList", jobMap);
		
		return "user/myinfo";
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
	
	public UserVO getUser(String id) throws Exception {
		
		UserVO user = new UserVO();
		user.setUserId(id);
		
		return userService.selectUserByUserId(user);
	}
}
