package kr.co.jj.common.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.jj.common.vo.AddrApiVO;
import kr.co.jj.common.vo.AddrVO;
import kr.co.jj.company.service.CompanyService;
import kr.co.jj.company.vo.AddrDTO;


@Controller
public class CommonController {
	
	private static final Logger logger = LoggerFactory.getLogger(CommonController.class);
	
	@Autowired
	CompanyService companyService;
	
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
		
		AddrApiVO vo = new AddrApiVO();
		vo.setInputYn(inputYn);
		vo.setRoadFullAddr(roadFullAddr);
		vo.setEmdNm(emdNm); 

		mv.addObject("res", vo);
		mv.setViewName("company/addrPop");
		 
		return mv; 
	} 
}
