package com.oasis.member.controller;
  
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller; 
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.oasis.common.CommandMap;
import com.oasis.member.service.LoginService;
import com.oasis.store.service.StoreService;

import lombok.AllArgsConstructor;
  
@Controller
@RequestMapping("/member/")
@AllArgsConstructor
public class LoginController {
  
  private LoginService loginService;
  
  @RequestMapping(value = "/loginForm.oa")
  public String loginForm() throws Exception {
	  return "member/loginForm";
  }
  
  @RequestMapping(value = "/login.oa", method = RequestMethod.POST)
  public ModelAndView login(CommandMap commandMap, HttpServletRequest request) throws Exception {
  	HttpSession session = request.getSession(true);
  	String message = "";
  	Map<String, Object> result = loginService.getMember(commandMap.getMap());
  	if (result == null) { //회원 아이디가 있는지 확인
  		ModelAndView mv = new ModelAndView("redirect:/member/loginForm.oa");
  		message = "해당 지점 아이디가 존재하지 않습니다.";
  		mv.addObject("message", message);
  		return mv;
  		
  	} else {
  		if(result.get("B_PASSWORD").equals(commandMap.get("B_PASSWORD")) ) { //비밀번호가 같다면
  			ModelAndView mv = new ModelAndView("redirect:/member/main.oa");
  			session.setAttribute("B_PHONE", result.get("B_PHONE"));
  			session.setAttribute("B_NAME",	 result.get("B_NAME"));
  			return mv;
  		} else { //비밀번호가 일치하지 않을 때
  			ModelAndView mv = new ModelAndView("redirect:/member/loginForm.oa");
  			message = "비밀번호가 일치하지 않습니다.";
  			mv.addObject("message", message);
  			return mv;
  		}
  	}
  }
}
 