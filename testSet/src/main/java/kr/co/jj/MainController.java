package kr.co.jj;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.jj.company.service.CompanyService;
import kr.co.jj.company.vo.CompanyVO;
import kr.co.jj.company.vo.RegisterVO;
import kr.co.jj.user.service.UserService;
import kr.co.jj.user.vo.RequireVO;
import kr.co.jj.user.vo.UserVO;

@Controller
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Autowired
	UserService userService;
	
	@Autowired
	CompanyService companyService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main(Model model, HttpSession session) throws Exception {
		
		List<String> cityList = new ArrayList<String>();
		cityList.add("Seoul");
		cityList.add("Busan");
		cityList.add("Gimpo-si");  
		
		logger.info(cityList.toString()); 
		
		model.addAttribute("cityList", cityList);
		 
		
		// 세션을 병원 /알바로 나눌 필요가 있음. ex) userLoginId, companyLoginId
		String usrloginId = (String) session.getAttribute("usrloginId");
		String mgloginId = (String) session.getAttribute("mgloginId");
		System.out.println("usr : " + usrloginId);
		System.out.println("mg : " + mgloginId);
		
		if(usrloginId == null && mgloginId == null) {
			model.addAttribute("usrlogin", null);
			model.addAttribute("mglogin", null);
		} else {
			model.addAttribute("usrlogin", usrloginId); 
			model.addAttribute("mglogin", mgloginId);  
			
			if(usrloginId != null) {
				UserVO u = new UserVO();
				u.setUserId(usrloginId);
				RequireVO ureq = userService.selectRequire(u);
				
				model.addAttribute("usrReq", ureq);   
				
			} else if(mgloginId != null) {
				CompanyVO c = new CompanyVO();
				c.setManagerId(mgloginId); 
				
				List<RegisterVO> creg = companyService.selectRegister(c);
				
				model.addAttribute("reqList", creg);
				
				System.out.println(creg.toString()); 
			} 
		}  
		
		return "main";
		
	}
	
	@GetMapping("/join")
	public String join(Model model) {
		
		return "common/join"; 
	}
	
	
}
