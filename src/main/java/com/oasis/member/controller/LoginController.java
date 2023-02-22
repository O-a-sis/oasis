package com.oasis.member.controller;
  
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.MenuSelectionManager;

import org.springframework.stereotype.Controller; 
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.oasis.admin.service.AdminNoticeService;
import com.oasis.common.CommandMap;
import com.oasis.member.service.LoginService;
import com.oasis.member.service.MenuService;
import com.oasis.member.service.MyTabService;
import lombok.AllArgsConstructor;
  
@Controller
@RequestMapping("/member/")
@AllArgsConstructor
public class LoginController {
  
  private LoginService loginService;
  private MenuService menuService;
  private MyTabService myTabService;
  private AdminNoticeService adminNoticeService;
  
  @RequestMapping(value = "/loginForm.oa")
  public String loginForm() throws Exception {
	  return "login/loginForm";
  }
  
  @RequestMapping(value = "/login.oa", method = RequestMethod.POST)
  public ModelAndView login(CommandMap commandMap, HttpServletRequest request) throws Exception {
  	HttpSession session = request.getSession(true);
  	String message = "";
  	System.out.println(commandMap.get("B_PASSWORD"));
  	Map<String, Object> result = loginService.getMember(commandMap.getMap());
  	if (result == null) { //회원 아이디가 있는지 확인
  		ModelAndView mv = new ModelAndView("redirect:/member/loginForm.oa");
  		message = "해당 전화번호가 존재하지 않습니다.";
  		mv.addObject("message", message);
  		return mv;
  		
  	} else {
  		if(result.get("B_PASSWORD").equals(commandMap.get("B_PASSWORD")) ) { //비밀번호가 같다면
  			ModelAndView mv = new ModelAndView("redirect:/member/main.oa");
  			session.setAttribute("B_PHONE", result.get("B_PHONE"));
  			session.setAttribute("B_NAME",	 result.get("B_NAME")); //session.setAttribute("B_NAME", result.get("B_무언가")) 후,
  			return mv;																  // session.getAttribute("B_NAME") 입력 시  "B_무언가" 가 출력된다.
  		} else { //비밀번호가 일치하지 않을 때
  			ModelAndView mv = new ModelAndView("redirect:/member/loginForm.oa");
  			message = "비밀번호가 일치하지 않습니다.";
  			mv.addObject("message", message);
  			return mv;
  		}
  	}
  }
  
  @RequestMapping(value = "/main.oa")  // 회원메인
  public ModelAndView main(CommandMap commandMap, HttpServletRequest request) throws Exception {  
	  ModelAndView mv = new ModelAndView("member/main");
	  
	  HttpSession session = request.getSession(); // request 의 getSession() 메서드는 서버에 생성된 세션이 있다면 세션을 반환하고, 없다면 새 세션을 받아 반환한다.
	  if(session.getAttribute("B_PHONE")==null) { //로그인 안한 경우
		  List<Map<String, Object>> mainimg = adminNoticeService.mainImg(commandMap.getMap());
		  List<Map<String, Object>> list = menuService.menuList(commandMap.getMap());
		  mv.addObject("plist", list); 
		  mv.addObject("mainimg", mainimg);
	  return mv;
	  } else {  
	  commandMap.put("B_PHONE", session.getAttribute("B_PHONE"));
	  Map<String, Object> map = myTabService.myStamp(commandMap.getMap());
	  List<Map<String, Object>> mainimg = adminNoticeService.mainImg(commandMap.getMap());
	  List<Map<String, Object>> list = menuService.menuList(commandMap.getMap());
		
		
		
	  mv.addObject("plist", list); 
	  mv.addObject("mainimg", mainimg);
	  mv.addObject("map", map);
	  return mv;
	  }
  }
  @RequestMapping(value = "/logout.oa") // 로그아웃
  	public ModelAndView logout(CommandMap commandMap, HttpServletRequest request, HttpServletResponse response) throws Exception{
	  
	  HttpSession session = request.getSession();
	  if(session != null)
		  session.invalidate();
	  ModelAndView mv = new ModelAndView("redirect:/member/loginForm.oa");
	  
	  return mv;
  }
  
  @RequestMapping(value = "/findPw.oa") //비밀번호 찾기 폼 보여주는 메소드
  	public ModelAndView findPw(CommandMap commandMap) throws Exception {
	  ModelAndView mv = new ModelAndView("login/findPw");
	  return mv;
  }
  
  @RequestMapping(value = "/findPwResult.oa", method = RequestMethod.POST)// 입력한 정보에 대해 비밀번호 찾기 기능
  public ModelAndView findPwResult(CommandMap commandMap) throws Exception{
	  ModelAndView mv = new ModelAndView("login/findPw");
	  
	  Map<String, Object> member = loginService.findPassword(commandMap.getMap());
	  if (member != null) {
		  mv.addObject("result", true);
	  } else {
		  mv.addObject("result", false);
	  }
	  mv.addObject("b_phone", member);
	  return mv;
  }
}
 





