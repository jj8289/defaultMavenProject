package kr.co.jj.common.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
}
