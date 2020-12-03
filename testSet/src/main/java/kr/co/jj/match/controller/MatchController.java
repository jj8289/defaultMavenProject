package kr.co.jj.match.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mysql.jdbc.log.Log;

import kr.co.jj.common.service.CommonService;
import kr.co.jj.common.vo.Job;
import kr.co.jj.common.vo.PageVO;
import kr.co.jj.company.controller.CompanyController;
import kr.co.jj.company.service.CompanyService;
import kr.co.jj.company.vo.CompanyVO;
import kr.co.jj.company.vo.RegisterDTO;
import kr.co.jj.company.vo.RegisterVO;
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
	CompanyService companyService;
	
	@Autowired
	CommonService commonService;
	
	@Autowired
	UserService userService;
	
	@Autowired
	MatchService matchService;
	
	/**
	 * 유저 매칭
	 */
	@GetMapping("/user/match")
	public String matchUser(Model model, HttpSession session,@ModelAttribute("pageVO") PageVO param, @RequestParam(required = false, defaultValue = "1") String pageNo, @RequestParam(required = false, defaultValue = "0") String rowCount) throws Exception {
		 
		System.out.println("rowCount : " + rowCount);
		 
		String id = (String)session.getAttribute("usrloginId");
		
		UserVO user = userController.getUser(id);
		
		model.addAttribute("user", user);
		
		param.setPageNo(Integer.parseInt(pageNo));
		System.out.println("pageNo : " + pageNo);
		System.out.println(param.toString());
		
		
		RequireVO reqVo = userService.selectRequire(user);
		logger.debug(reqVo.toString());
		
		if(!rowCount.equals("0")) {
			reqVo.setRowCount(Integer.parseInt(rowCount));
			reqVo.setPageNo(Integer.parseInt(pageNo));
		} 
		
		model.addAttribute("reqVo", reqVo);
		
		List<UserMatchVO> matchList = new ArrayList<UserMatchVO>();
		
		if(user.getJobNo().equals("1")) {
			//PT
			matchList = matchService.selectMatchListForUserPT(reqVo);
		} else {
			//Others
			matchList = matchService.selectMatchListForUserOthers(reqVo);
		}
		logger.debug(matchList.toString());
		
		model.addAttribute("matchList", matchList);
		
		int rowCnt = matchService.selectMatchTotCnt(reqVo);
		model.addAttribute("rowCnt", rowCnt);
		
		param.setRowCount(rowCnt);
		reqVo.setRowCount(rowCnt);
		reqVo.setPageNo(Integer.parseInt(pageNo));
		  
		if(rowCnt != 0) {
			for(Job job : Job.values()) {
				String jobNm = job.name();
				if(jobNm.equals(matchList.get(0).getJobNm())) {
					model.addAttribute("jobNm", job.getName());
				}
			}
		}
		
		return "user/match";  
	} 
	
	/**
	 * 병원 매칭
	 */
	@GetMapping("/company/match")
	public String matchComp(Model model, HttpSession session, @ModelAttribute("pageVO") PageVO param, @RequestParam(required = false, defaultValue = "1") String pageNo) throws Exception {
		String id = (String)session.getAttribute("mgloginId");
		
		CompanyVO comp = companyController.getCompany(id); 
		int rowCnt = companyService.selectRegTotCnt(comp);
		
		param.setPageNo(Integer.parseInt(pageNo));   
		System.out.println("pageNo : " + pageNo);
		System.out.println(param.toString());
		
		Map<String, Object> workList = commonService.getWorkFlagList();
		model.addAttribute("workList", workList);
		
		Map<String, Object> jobList = commonService.getJobList();
		model.addAttribute("jobList", jobList);
		
		comp.setRowCount(rowCnt);
		comp.setPageSize(5);
		comp.setPageNo(Integer.parseInt(pageNo));
		param.setRowCount(rowCnt);
		param.setPageSize(5);  
		
		List<RegisterVO> regList = companyService.selectRegister(comp); 
		model.addAttribute("regList", regList);
		
		model.addAttribute("comp", comp); 
		
		return "company/match"; 
	}
	
	@PostMapping("/company/match/updateMatchStat")
	@ResponseBody
	public String updateMatchStat(RegisterVO param, Model model) throws Exception {
		System.out.println("get regNo : " + param.getRegNo());
		System.out.println("get MatchFlag : " + param.getMatchFlag());
		
		try {
			matchService.updateMatchFlag(param);
			
			return "success";
			
		} catch (Exception e) {
			
			return "error";	
		}
	}
	
	@GetMapping("/company/match/callList")
	public String getCallList(Model model) throws Exception{
		return "company/callList";
	}
	
	
}
