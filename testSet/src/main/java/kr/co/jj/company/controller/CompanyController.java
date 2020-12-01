package kr.co.jj.company.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.JSONException;
import org.json.JSONObject;
import org.json.XML;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.jj.common.service.CommonService;
import kr.co.jj.common.vo.AddrDTO;
import kr.co.jj.common.vo.AddrVO;
import kr.co.jj.common.vo.PageVO;
import kr.co.jj.company.service.CompanyService;
import kr.co.jj.company.vo.CompanyVO;
import kr.co.jj.company.vo.RegisterDTO;
import kr.co.jj.company.vo.RegisterVO;
import kr.co.jj.user.controller.UserController;

@Controller
@RequestMapping("/company")
public class CompanyController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	private CommonService commonService;
	
	@Autowired
	private CompanyService companyService;
	
	
	@GetMapping("/login")
	public String login(Model model) throws Exception {
		return "company/login"; 
	}
	
	@ResponseBody
	@PostMapping(value = "/login/loginChk")
	public String loginChk(CompanyVO vo, Model model, HttpSession session) throws Exception{
		logger.debug(vo.toString());
		
		// 로그인 체크 
		CompanyVO manager = companyService.selectManager(vo);
		
		System.out.println(manager.toString());
		
		session.setAttribute("mgloginId", manager.getManagerId());
		return "success";  
	} 
	
	
	@GetMapping("/join")
	public String join(Model model) throws Exception {
		//parsingXML();
		
		AddrDTO dto = new AddrDTO();
		dto.setSdNm("경기도");
		dto.setSgNm("김포시");
		
		try {
			List<AddrVO> sdList = companyService.selectSdList();
			
			System.out.println(sdList.toString());
			
			model.addAttribute("sdList", sdList);	
			model.addAttribute("sdListSize", sdList.size());	
		} catch (Exception e) {
			model.addAttribute("sdList", "");	
			model.addAttribute("sdListSize", "");	
			e.printStackTrace();
		} 
		
		model.addAttribute("dto", dto);
		
		return "company/join";
	}
	
	@ResponseBody
	@PostMapping(value = "/join/joinChk")  
	public String joinChk(CompanyVO company, Model model) throws Exception{
		
		// 아이디 중복 체크
		boolean chk = idDupleChk(company);
		
		// 병원 중복체크
		boolean chk2 = companyChk(company);
		
		if(!chk && !chk2) { 
			 
			System.out.println(company.toString()); 
			companyService.insertCompany(company); 
			 
			return "success"; 
		}
		
		if(chk) {
			return "idDup";
		} else {
			return "busNumDup";
		}
	}
	
	@GetMapping("/register")
	public String register(Model model, HttpSession session) throws Exception {
		String mgId = (String) session.getAttribute("mgloginId");
			
		CompanyVO vo = new CompanyVO();
		vo.setManagerId(mgId);
		
		System.out.println("mgId : " + mgId);
		
		vo = companyService.selectCompanyByManagerId(vo);
		
		Map<String, Object> list = commonService.getJobList();
		
		model.addAttribute("jobList", list);
		
		System.out.println(list.toString()); 
//		Map<String, Object> jobMap = new HashMap<String, Object>();
//		
//		for(Job job : Job.values()) {
//			jobMap.put(job.name(), job.getName());
//		} 
//		
//		model.addAttribute("jobList", jobMap);
		
		model.addAttribute("companyNo", vo.getCompanyNo());
		
		return "company/register";
	} 
	
	@PostMapping("/register/registerChk")
	@ResponseBody
	public String registerChk(RegisterDTO param, Model model) throws Exception {
		logger.debug(param.toString());

		int dup = 0;
		
		String patternNum = "[^0-9]";
		String patternNY = "[^a-zA-Z]";
		
		String workDow = "";
		String workPt = "";
		String detailWorkPt = "";
		
		for(String str1 : param.getDowList()) {
			if(workDow != "") {
				workDow += "/";
			}
			str1 = str1.replaceAll(patternNum, "");
			workDow += str1;
		}   
		
		for(String str2 : param.getWorkPtList()) {
			if(workPt != "") {
				workPt += "/";
			}
			str2 = str2.replaceAll(patternNum, "");
			workPt += str2;
		} 
		
		for(String str3 : param.getDetailWorkPtList()) {
			if(detailWorkPt != "") {
				detailWorkPt += "/";
			}
			str3 = str3.replaceAll(patternNY, "");
			detailWorkPt += str3;
		} 
		
		RegisterVO vo = new RegisterVO();
		vo.setCompanyNo(param.getCompanyNo());
		vo.setSalaryHour(param.getSalaryHour());
		vo.setSalaryDay(param.getSalaryDay());
		vo.setWorkType(param.getWorkType());
		vo.setWorkDate(param.getWorkDate());
		vo.setWorkStart(param.getWorkStart());
		vo.setWorkDow(workDow);
		vo.setTimeFlag(param.getTimeFlag());
		vo.setWorkStTime(param.getWorkStTime());
		vo.setWorkEnTime(param.getWorkEnTime());
		vo.setJob(param.getJob()); 
		vo.setSex(param.getSex());
		vo.setAge(param.getAge());
		vo.setCareer(param.getCareer());
		vo.setLunchStTime(param.getLunchStTime());
		vo.setLunchEnTime(param.getLunchEnTime());
		vo.setWorkFlag(param.getWorkFlag());
		vo.setWork(param.getWork());
		vo.setDetailWork(param.getDetailWork());
		vo.setWorkPt(workPt);
		vo.setDetailWorkPt(detailWorkPt);
		vo.setInsenFlag(param.getInsenFlag());
		vo.setPeerCnt(param.getPeerCnt());
		vo.setAvgCnt(param.getAvgCnt());
		vo.setEtc(param.getEtc());
		vo.setCalWorkTime(param.getCalWorkTime());
		vo.setCalSalaryHour(param.getCalSalaryHour());
		vo.setCalSalaryDay(param.getCalSalaryDay());
		vo.setMatchPhone(param.getMatchPhone());
		vo.setHireFlag(param.getHireFlag());
		vo.setMatchWorkDate(param.getMatchWorkDate());
		vo.setMatchInterviewDate(param.getMatchInterviewDate());
		vo.setMatchMsg(param.getMatchMsg());
		
		//중복 체크
		dup = companyService.selectRegCnt(vo);
		
		if(dup == 0) {
			//병원 조건 DB insert
			companyService.insertRegister(vo);
			
			return "success"; 
		} else {
			return "duplicate";
		}
	} 
	
	
	
	/**
	 * 마이페이지
	 */
	@GetMapping("/mypage")
	public String mypage(Model model, HttpSession session, @ModelAttribute("pageVO") PageVO param, @RequestParam(required = false, defaultValue = "1") String pageNo) throws Exception {
		
		String id = (String)session.getAttribute("mgloginId");
		
		CompanyVO company = getCompany(id); 
		int rowCnt = companyService.selectRegTotCnt(company);
		
		param.setPageNo(Integer.parseInt(pageNo));   
		System.out.println("pageNo : " + pageNo);
		
		 
		System.out.println(param.toString());
		
		
		Map<String, Object> workList = commonService.getWorkFlagList();
		model.addAttribute("workList", workList);
		
		Map<String, Object> jobList = commonService.getJobList();
		model.addAttribute("jobList", jobList);
		
		
		
		
		company.setRowCount(rowCnt);
		company.setPageSize(5);
		company.setPageNo(Integer.parseInt(pageNo));
		param.setRowCount(rowCnt);
		param.setPageSize(5);  
		
		List<RegisterVO> regList = companyService.selectRegister(company); 
		model.addAttribute("regList", regList);
		
		return "company/mypage";
	}
	
	@GetMapping("/mypage/regDetail")
	public String regDetail(@RequestParam String regNo, Model model) throws Exception{
		
		RegisterVO vo = new RegisterVO();
		vo.setRegNo(regNo);
		
		System.out.println(vo.toString());
		
		vo = companyService.selectRegByRegNo(vo);
		
		model.addAttribute("reg", vo);
		
		String workStHour = vo.getWorkStTime().substring(0,2);
		String workStMin = vo.getWorkStTime().substring(3);
		String workEnHour = vo.getWorkEnTime().substring(0,2);
		String workEnMin = vo.getWorkStTime().substring(3);
		
		model.addAttribute("workStHour", workStHour);
		model.addAttribute("workEnHour", workEnHour);
		model.addAttribute("workStMin", workStMin);
		model.addAttribute("workEnMin", workEnMin);
		
		if(vo.getLunchStTime().equals("")) {
			
		} else {
			String lunchStHour = vo.getLunchStTime().substring(0,2);
			String lunchStMin = vo.getLunchStTime().substring(3);
			String lunchEnHour = vo.getLunchEnTime().substring(0,2);
			String lunchEnMin = vo.getLunchEnTime().substring(3);
			model.addAttribute("lunchStHour", lunchStHour);
			model.addAttribute("lunchStMin", lunchStMin);
			model.addAttribute("lunchEnHour", lunchEnHour);
			model.addAttribute("lunchEnMin", lunchEnMin);
		}
		 
		Map<String, Object> list = commonService.getJobList();
		
		model.addAttribute("jobList", list);
//		if(workStHour.charAt(0) == '0') {
//			model.addAttribute("workStHour", workStHour.charAt(1));
//		} else {
//			model.addAttribute("workStHour", workStHour);
//		}
//		if(workEnHour.charAt(0) == '0') {
//			model.addAttribute("workEnHour", workEnHour.charAt(1));
//		} else {
//			model.addAttribute("workEnHour", workEnHour);
//		}
		
		
		
		return "company/registerDetail";
	}
	
	@PostMapping("/mypage/regDetail/updateReg")
	@ResponseBody
	public String updateReg(RegisterDTO param, Model model) throws Exception {
		logger.debug(param.toString());

		int dup = 0;
		
		String patternNum = "[^0-9]";
		String patternNY = "[^a-zA-Z]";
		
		String workDow = "";
		String workPt = "";
		String detailWorkPt = "";
		
		for(String str1 : param.getDowList()) {
			if(workDow != "") {
				workDow += "/";
			}
			str1 = str1.replaceAll(patternNum, "");
			workDow += str1;
		}   
		
		for(String str2 : param.getWorkPtList()) {
			if(workPt != "") {
				workPt += "/";
			}
			str2 = str2.replaceAll(patternNum, "");
			workPt += str2;
		} 
		
		for(String str3 : param.getDetailWorkPtList()) {
			if(detailWorkPt != "") {
				detailWorkPt += "/";
			}
			str3 = str3.replaceAll(patternNY, "");
			detailWorkPt += str3;
		} 
		
		RegisterVO vo = new RegisterVO();
		vo.setCompanyNo(param.getCompanyNo());
		vo.setRegNo(param.getRegNo()); 
		vo.setSalaryHour(param.getSalaryHour());
		vo.setSalaryDay(param.getSalaryDay());
		vo.setWorkType(param.getWorkType());
		vo.setWorkDate(param.getWorkDate());
		vo.setWorkStart(param.getWorkStart());
		vo.setWorkDow(workDow);
		vo.setTimeFlag(param.getTimeFlag());
		vo.setWorkStTime(param.getWorkStTime());
		vo.setWorkEnTime(param.getWorkEnTime());
		vo.setJob(param.getJob()); 
		vo.setSex(param.getSex());
		vo.setAge(param.getAge());
		vo.setCareer(param.getCareer());
		vo.setLunchStTime(param.getLunchStTime());
		vo.setLunchEnTime(param.getLunchEnTime());
		vo.setWorkFlag(param.getWorkFlag());
		vo.setWork(param.getWork());
		vo.setDetailWork(param.getDetailWork());
		vo.setWorkPt(workPt);
		vo.setDetailWorkPt(detailWorkPt);
		vo.setInsenFlag(param.getInsenFlag());
		vo.setPeerCnt(param.getPeerCnt());
		vo.setAvgCnt(param.getAvgCnt());
		vo.setEtc(param.getEtc());
		vo.setCalWorkTime(param.getCalWorkTime());
		vo.setCalSalaryHour(param.getCalSalaryHour());
		vo.setCalSalaryDay(param.getCalSalaryDay());
		vo.setMatchPhone(param.getMatchPhone());
		vo.setHireFlag(param.getHireFlag());
		vo.setMatchWorkDate(param.getMatchWorkDate());
		vo.setMatchInterviewDate(param.getMatchInterviewDate());
		vo.setMatchMsg(param.getMatchMsg());
		//병원 조건 DB insert
		companyService.updateRegister(vo);
		 
		return "success"; 
	} 
	
	/**
	 * 내정보
	 */
	@GetMapping("/myinfo")
	public String myinfo(Model model, HttpSession session) throws Exception {
		
		String mgId = (String)session.getAttribute("mgloginId");
		
		CompanyVO company = getCompany(mgId);
		
		logger.debug(company.toString());
		
		model.addAttribute("company", company);
		
		return "company/myinfo";
	}
	
	
	// 아이디 중복 체크
	public boolean idDupleChk(CompanyVO company) throws Exception {
		
		int chk = companyService.selectCompanyCountByManagerId(company);
		
		if(chk == 0) {
			return false;
		}
		return true;
	}
	
	// 병원 중복 체크
	public boolean companyChk(CompanyVO company) throws Exception {
		
		int chk = companyService.selectCompany(company);
		
		if(chk == 1) {
			return true;
		}
		return false;
	}
	
	public CompanyVO getCompany(String mgId) throws Exception {
		
		CompanyVO company = new CompanyVO();
		company.setManagerId(mgId);
		
		return companyService.selectCompanyByManagerId(company);
	}
	
	
	
	
	
	
	public void parsingXML() {
		int PRETTY_PRINT_INDENT_FACTOR = 4;
	    String TEST_XML_STRING =
	        "<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n" + 
	        "<Hospital>\r\n" + 
	        "  <head>\r\n" + 
	        "    <list_total_count>443</list_total_count>\r\n" + 
	        "    <RESULT>\r\n" + 
	        "      <CODE>INFO-000</CODE>\r\n" + 
	        "      <MESSAGE>정상 처리되었습니다.</MESSAGE>\r\n" + 
	        "    </RESULT>\r\n" + 
	        "    <api_version>1.0v</api_version>\r\n" + 
	        "  </head>\r\n" + 
	        "  <row>\r\n" + 
	        "    <SIGUN_CD>41110</SIGUN_CD>\r\n" + 
	        "    <SIGUN_NM>수원시</SIGUN_NM>\r\n" + 
	        "    <BIZPLC_NM>대한민국주석병원</BIZPLC_NM>\r\n" + 
	        "    <LICENSG_DE>20091102</LICENSG_DE>\r\n" + 
	        "    <BSN_STATE_NM>폐업 등</BSN_STATE_NM>\r\n" + 
	        "    <CLSBIZ_DE>20151012</CLSBIZ_DE>\r\n" + 
	        "    <LOCPLC_AR/>\r\n" + 
	        "    <GENRL_AMBLNC_CNT>0</GENRL_AMBLNC_CNT>\r\n" + 
	        "    <SPECL_AMBLNC_CNT>0</SPECL_AMBLNC_CNT>\r\n" + 
	        "    <SICKBD_CNT>117</SICKBD_CNT>\r\n" + 
	        "    <EASING_MEDCARE_CHARGE_DEPT_NM/>\r\n" + 
	        "    <EASING_MEDCARE_APPONT_FORM><![CDATA[]]></EASING_MEDCARE_APPONT_FORM>\r\n" + 
	        "    <MEDCARE_INST_ASORTMT_NM/>\r\n" + 
	        "    <MEDSTAF_CNT>10</MEDSTAF_CNT>\r\n" + 
	        "    <HOSPTLRM_CNT>33</HOSPTLRM_CNT>\r\n" + 
	        "    <TREAT_SBJECT_CD_INFO>105 106 101 111 122</TREAT_SBJECT_CD_INFO>\r\n" + 
	        "    <TREAT_SBJECT_CONT>가정의학과, 소아청소년과, 내과, 신경외과, 정형외과</TREAT_SBJECT_CONT>\r\n" + 
	        "    <TOT_AR>6386.78</TOT_AR>\r\n" + 
	        "    <TOT_PSN_CNT/>\r\n" + 
	        "    <FIRST_APPONT_DE/>\r\n" + 
	        "    <PERMISN_SICKBD_CNT>0</PERMISN_SICKBD_CNT>\r\n" + 
	        "    <REFINE_LOTNO_ADDR>경기도 수원시 장안구 연무동 260번지 20호</REFINE_LOTNO_ADDR>\r\n" + 
	        "    <REFINE_ROADNM_ADDR>경기도 수원시 장안구 창룡대로 159 (연무동)</REFINE_ROADNM_ADDR>\r\n" + 
	        "    <REFINE_ZIP_CD>440240</REFINE_ZIP_CD>\r\n" + 
	        "    <REFINE_WGS84_LOGT>127.0275572811</REFINE_WGS84_LOGT>\r\n" + 
	        "    <REFINE_WGS84_LAT>37.2917938226</REFINE_WGS84_LAT>\r\n" + 
	        "  </row>\r\n" + 
	        "  <row>\r\n" + 
	        "    <SIGUN_CD>41110</SIGUN_CD>\r\n" + 
	        "    <SIGUN_NM>수원시</SIGUN_NM>\r\n" + 
	        "    <BIZPLC_NM>아주다남병원</BIZPLC_NM>\r\n" + 
	        "    <LICENSG_DE>20111021</LICENSG_DE>\r\n" + 
	        "    <BSN_STATE_NM>운영중</BSN_STATE_NM>\r\n" + 
	        "    <CLSBIZ_DE/>\r\n" + 
	        "    <LOCPLC_AR/>\r\n" + 
	        "    <GENRL_AMBLNC_CNT>0</GENRL_AMBLNC_CNT>\r\n" + 
	        "    <SPECL_AMBLNC_CNT>0</SPECL_AMBLNC_CNT>\r\n" + 
	        "    <SICKBD_CNT>159</SICKBD_CNT>\r\n" + 
	        "    <EASING_MEDCARE_CHARGE_DEPT_NM/>\r\n" + 
	        "    <EASING_MEDCARE_APPONT_FORM><![CDATA[]]></EASING_MEDCARE_APPONT_FORM>\r\n" + 
	        "    <MEDCARE_INST_ASORTMT_NM/>\r\n" + 
	        "    <MEDSTAF_CNT>10</MEDSTAF_CNT>\r\n" + 
	        "    <HOSPTLRM_CNT>18</HOSPTLRM_CNT>\r\n" + 
	        "    <TREAT_SBJECT_CD_INFO>103 120 122</TREAT_SBJECT_CD_INFO>\r\n" + 
	        "    <TREAT_SBJECT_CONT>가정의학과, 재활의학과, 정신건강의학과</TREAT_SBJECT_CONT>\r\n" + 
	        "    <TOT_AR>1884.32</TOT_AR>\r\n" + 
	        "    <TOT_PSN_CNT/>\r\n" + 
	        "    <FIRST_APPONT_DE/>\r\n" + 
	        "    <PERMISN_SICKBD_CNT>0</PERMISN_SICKBD_CNT>\r\n" + 
	        "    <REFINE_LOTNO_ADDR>경기도 수원시 장안구 정자3동 874번지 2호 롯데프라자 4층</REFINE_LOTNO_ADDR>\r\n" + 
	        "    <REFINE_ROADNM_ADDR>경기도 수원시 장안구 정자천로 187 (정자동, 롯데프라자 4층)</REFINE_ROADNM_ADDR>\r\n" + 
	        "    <REFINE_ZIP_CD>440841</REFINE_ZIP_CD>\r\n" + 
	        "    <REFINE_WGS84_LOGT>126.9953932038</REFINE_WGS84_LOGT>\r\n" + 
	        "    <REFINE_WGS84_LAT>37.2964814842</REFINE_WGS84_LAT>\r\n" + 
	        "  </row>\r\n" + 
	        "  <row>\r\n" + 
	        "    <SIGUN_CD>41110</SIGUN_CD>\r\n" + 
	        "    <SIGUN_NM>수원시</SIGUN_NM>\r\n" + 
	        "    <BIZPLC_NM>수원우노병원</BIZPLC_NM>\r\n" + 
	        "    <LICENSG_DE>20111114</LICENSG_DE>\r\n" + 
	        "    <BSN_STATE_NM>운영중</BSN_STATE_NM>\r\n" + 
	        "    <CLSBIZ_DE/>\r\n" + 
	        "    <LOCPLC_AR/>\r\n" + 
	        "    <GENRL_AMBLNC_CNT>0</GENRL_AMBLNC_CNT>\r\n" + 
	        "    <SPECL_AMBLNC_CNT>0</SPECL_AMBLNC_CNT>\r\n" + 
	        "    <SICKBD_CNT>115</SICKBD_CNT>\r\n" + 
	        "    <EASING_MEDCARE_CHARGE_DEPT_NM/>\r\n" + 
	        "    <EASING_MEDCARE_APPONT_FORM><![CDATA[]]></EASING_MEDCARE_APPONT_FORM>\r\n" + 
	        "    <MEDCARE_INST_ASORTMT_NM/>\r\n" + 
	        "    <MEDSTAF_CNT>5</MEDSTAF_CNT>\r\n" + 
	        "    <HOSPTLRM_CNT>23</HOSPTLRM_CNT>\r\n" + 
	        "    <TREAT_SBJECT_CD_INFO>113 111 103 101</TREAT_SBJECT_CD_INFO>\r\n" + 
	        "    <TREAT_SBJECT_CONT>내과, 정신건강의학과, 소아청소년과, 이비인후과</TREAT_SBJECT_CONT>\r\n" + 
	        "    <TOT_AR>1574.66</TOT_AR>\r\n" + 
	        "    <TOT_PSN_CNT/>\r\n" + 
	        "    <FIRST_APPONT_DE/>\r\n" + 
	        "    <PERMISN_SICKBD_CNT>0</PERMISN_SICKBD_CNT>\r\n" + 
	        "    <REFINE_LOTNO_ADDR>경기도 수원시 권선구 권선동 987번지 3호</REFINE_LOTNO_ADDR>\r\n" + 
	        "    <REFINE_ROADNM_ADDR>경기도 수원시 권선구 장다리로 94 (권선동)</REFINE_ROADNM_ADDR>\r\n" + 
	        "    <REFINE_ZIP_CD>441821</REFINE_ZIP_CD>\r\n" + 
	        "    <REFINE_WGS84_LOGT>127.0215606605</REFINE_WGS84_LOGT>\r\n" + 
	        "    <REFINE_WGS84_LAT>37.2584568956</REFINE_WGS84_LAT>\r\n" + 
	        "  </row>\r\n" + 
	        "  <row>\r\n" + 
	        "    <SIGUN_CD>41110</SIGUN_CD>\r\n" + 
	        "    <SIGUN_NM>수원시</SIGUN_NM>\r\n" + 
	        "    <BIZPLC_NM>윈산부인과병원</BIZPLC_NM>\r\n" + 
	        "    <LICENSG_DE>20111226</LICENSG_DE>\r\n" + 
	        "    <BSN_STATE_NM>운영중</BSN_STATE_NM>\r\n" + 
	        "    <CLSBIZ_DE/>\r\n" + 
	        "    <LOCPLC_AR/>\r\n" + 
	        "    <GENRL_AMBLNC_CNT>0</GENRL_AMBLNC_CNT>\r\n" + 
	        "    <SPECL_AMBLNC_CNT>0</SPECL_AMBLNC_CNT>\r\n" + 
	        "    <SICKBD_CNT>31</SICKBD_CNT>\r\n" + 
	        "    <EASING_MEDCARE_CHARGE_DEPT_NM/>\r\n" + 
	        "    <EASING_MEDCARE_APPONT_FORM><![CDATA[]]></EASING_MEDCARE_APPONT_FORM>\r\n" + 
	        "    <MEDCARE_INST_ASORTMT_NM/>\r\n" + 
	        "    <MEDSTAF_CNT>32</MEDSTAF_CNT>\r\n" + 
	        "    <HOSPTLRM_CNT>19</HOSPTLRM_CNT>\r\n" + 
	        "    <TREAT_SBJECT_CD_INFO>109 110 111 116</TREAT_SBJECT_CD_INFO>\r\n" + 
	        "    <TREAT_SBJECT_CONT>영상의학과, 소아청소년과, 산부인과, 마취통증의학과</TREAT_SBJECT_CONT>\r\n" + 
	        "    <TOT_AR>2855.78</TOT_AR>\r\n" + 
	        "    <TOT_PSN_CNT/>\r\n" + 
	        "    <FIRST_APPONT_DE/>\r\n" + 
	        "    <PERMISN_SICKBD_CNT>0</PERMISN_SICKBD_CNT>\r\n" + 
	        "    <REFINE_LOTNO_ADDR>경기도 수원시 영통구 영통동 946-2번지 윈 산부인과</REFINE_LOTNO_ADDR>\r\n" + 
	        "    <REFINE_ROADNM_ADDR>경기도 수원시 영통구 봉영로1759번길 32 (영통동, 윈 산부인과)</REFINE_ROADNM_ADDR>\r\n" + 
	        "    <REFINE_ZIP_CD>16712</REFINE_ZIP_CD>\r\n" + 
	        "    <REFINE_WGS84_LOGT>127.0809643438</REFINE_WGS84_LOGT>\r\n" + 
	        "    <REFINE_WGS84_LAT>37.2665959546</REFINE_WGS84_LAT>\r\n" + 
	        "  </row>\r\n" + 
	        "  <row>\r\n" + 
	        "    <SIGUN_CD>41110</SIGUN_CD>\r\n" + 
	        "    <SIGUN_NM>수원시</SIGUN_NM>\r\n" + 
	        "    <BIZPLC_NM>서울성모안과병원</BIZPLC_NM>\r\n" + 
	        "    <LICENSG_DE>20120102</LICENSG_DE>\r\n" + 
	        "    <BSN_STATE_NM>운영중</BSN_STATE_NM>\r\n" + 
	        "    <CLSBIZ_DE/>\r\n" + 
	        "    <LOCPLC_AR/>\r\n" + 
	        "    <GENRL_AMBLNC_CNT>0</GENRL_AMBLNC_CNT>\r\n" + 
	        "    <SPECL_AMBLNC_CNT>0</SPECL_AMBLNC_CNT>\r\n" + 
	        "    <SICKBD_CNT>30</SICKBD_CNT>\r\n" + 
	        "    <EASING_MEDCARE_CHARGE_DEPT_NM/>\r\n" + 
	        "    <EASING_MEDCARE_APPONT_FORM><![CDATA[]]></EASING_MEDCARE_APPONT_FORM>\r\n" + 
	        "    <MEDCARE_INST_ASORTMT_NM/>\r\n" + 
	        "    <MEDSTAF_CNT>18</MEDSTAF_CNT>\r\n" + 
	        "    <HOSPTLRM_CNT>8</HOSPTLRM_CNT>\r\n" + 
	        "    <TREAT_SBJECT_CD_INFO>112</TREAT_SBJECT_CD_INFO>\r\n" + 
	        "    <TREAT_SBJECT_CONT>안과</TREAT_SBJECT_CONT>\r\n" + 
	        "    <TOT_AR>1697.61</TOT_AR>\r\n" + 
	        "    <TOT_PSN_CNT/>\r\n" + 
	        "    <FIRST_APPONT_DE/>\r\n" + 
	        "    <PERMISN_SICKBD_CNT>0</PERMISN_SICKBD_CNT>\r\n" + 
	        "    <REFINE_LOTNO_ADDR>경기도 수원시 영통구 원천동 79번지 5호</REFINE_LOTNO_ADDR>\r\n" + 
	        "    <REFINE_ROADNM_ADDR>경기도 수원시 영통구 중부대로271번길 4 (원천동)</REFINE_ROADNM_ADDR>\r\n" + 
	        "    <REFINE_ZIP_CD>443821</REFINE_ZIP_CD>\r\n" + 
	        "    <REFINE_WGS84_LOGT>127.0458396391</REFINE_WGS84_LOGT>\r\n" + 
	        "    <REFINE_WGS84_LAT>37.2744618630</REFINE_WGS84_LAT>\r\n" + 
	        "  </row>\r\n" + 
	        "</Hospital>";
		
		try {
            JSONObject xmlJSONObj = XML.toJSONObject(TEST_XML_STRING);
            String jsonPrettyPrintString = xmlJSONObj.toString(PRETTY_PRINT_INDENT_FACTOR);
            System.out.println(jsonPrettyPrintString);
        } catch (JSONException je) {
            System.out.println(je.toString());
        }
	}
	
	public List<AddrVO> getAddr() throws Exception {
		List<AddrVO> list = companyService.selectSdList();
		
		return list; 
	}
	
}
