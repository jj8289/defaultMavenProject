package kr.co.jj;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.jj.user.service.UserService;
import kr.co.jj.user.vo.RegisterVO;
import kr.co.jj.user.vo.UserVO;

@Controller
public class MainController {
	
	private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Autowired
	UserService userService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String main(Model model, HttpSession session) throws Exception {
		
		List<String> cityList = new ArrayList<String>();
		cityList.add("Seoul");
		cityList.add("Busan");
		cityList.add("Gimpo-si");  
		
		logger.info(cityList.toString()); 
		
		model.addAttribute("cityList", cityList);
		 
		String userId = (String) session.getAttribute("loginId");
		System.out.println(userId);
		
		if(userId == null) {
			model.addAttribute("user", null);
		} else {
			UserVO u = new UserVO();
			u.setUserId(userId);
			
			UserVO user = userService.selectUserByUserId(u);
			model.addAttribute("user", user); 
			
			RegisterVO reg = userService.selectRegister(user);
			
			if(reg == null) {
				model.addAttribute("reg", null);  
			} else { 
				model.addAttribute("reg", reg);  
			}
		}  
		
		return "main";
		
	}
	
	@GetMapping("/join")
	public String join(Model model) {
		
		return "common/join"; 
	}
}
