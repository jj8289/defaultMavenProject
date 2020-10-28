package kr.co.jj.aspect;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

@Aspect
@Component
public class LoginAspect {
	public static final Logger log = LoggerFactory.getLogger(LoginAspect.class);
	
	@Pointcut("execution(* kr.co.jj.*.*.*Controller.*(..))")
	public void loginAuth() {}
	 
	@Around("loginAuth()")
	public Object loginChk(ProceedingJoinPoint jointPoint) throws Throwable {
		log.debug("--Before login--");
		
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		String req = request.getRequestURI();
		
		ModelAndView mv = new ModelAndView();
		
		if(req != null) {
			System.out.println(req);  
			if(req.contains("/sigungu") || req.contains("/dong") || req.contains("/addrPop") || req.contains("/logout")) { 
				return jointPoint.proceed();   
			} 
			else if(!req.contains("/join")) { // 회원가입 페이지는 세션 체크 제외 
				if(!req.contains("/login")) { // 로그인 페이지는 세션 체크 제외 
					//로그인 세션 체크       
					HttpSession session = request.getSession(); 
					String usrlogin = (String)session.getAttribute("usrloginId");
					String mglogin = (String)session.getAttribute("mgloginId");
					
					if(usrlogin == null && mglogin == null) {
						log.debug("no session");   
						return "redirect:/";  
					} else { 
						log.debug("exist session " + usrlogin);
						log.debug("exist session " + mglogin);
						return jointPoint.proceed();
					}  
				}   
			}		
		}
		return jointPoint.proceed();
	}
}
