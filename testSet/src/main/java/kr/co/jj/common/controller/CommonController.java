package kr.co.jj.common.controller;

import java.util.ArrayList;
import java.util.HashMap;
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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.jj.common.vo.AddrApiVO;
import kr.co.jj.common.vo.AddrVO;
import kr.co.jj.common.vo.Job;
import kr.co.jj.company.service.CompanyService;
import kr.co.jj.company.vo.AddrDTO;


@Controller
@RequestMapping("/common")
public class CommonController {
	
	private static final Logger logger = LoggerFactory.getLogger(CommonController.class);
	
	@Autowired
	CompanyService companyService;
	
	
	@GetMapping("/login") 
	public String login() throws Exception {
		return "common/login";
	} 
	
	
	@GetMapping("/join") 
	public String join() throws Exception {
		return "common/join";
	}
	 
	/**
	 * 로그아웃
	 */
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		logger.debug("logout()");
		
		session.invalidate();
		
		return "redirect:/"; 
	}
	
	@PostMapping("/sigungu")
	@ResponseBody
	public List<AddrVO> getSigungu(AddrDTO dto) throws Exception{
		//sgNm
		System.out.println(dto.toString());
		
		List<AddrVO> sglist = new ArrayList<>();
		
		sglist = companyService.selectSgList(dto);
		
		return sglist;   
	}
	
	@PostMapping("/dong")
	@ResponseBody
	public List<AddrVO> getDong(AddrDTO dto) throws Exception{
		//sgNm
		System.out.println(dto.toString());
		
		List<AddrVO> dnlist = new ArrayList<>();
		 
		dnlist = companyService.selectDnList(dto); 
		 
		return dnlist;   
	}
	
	@GetMapping("/addrPop")
	public String addrPop(Model model) throws Exception {
		
		return "company/addrPop";
	} 
	
	@PostMapping("/addrPop")
	@ResponseBody
	public ModelAndView getAddr(HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		request.setCharacterEncoding("UTF-8");  //한글깨지면 주석제거
		
		String inputYn = request.getParameter("inputYn"); 
		String roadFullAddr = request.getParameter("roadFullAddr"); 
		String emdNm  = request.getParameter("emdNm");
		String siNm = request.getParameter("siNm");
		String sggNm = request.getParameter("sggNm");
		
		AddrApiVO vo = new AddrApiVO();
		vo.setInputYn(inputYn);
		vo.setRoadFullAddr(roadFullAddr);
		vo.setEmdNm(emdNm); 
		vo.setSiNm(siNm);
		vo.setSggNm(sggNm);

		mv.addObject("res", vo);
		mv.setViewName("company/addrPop");
		 
		return mv; 
	} 
	
}
