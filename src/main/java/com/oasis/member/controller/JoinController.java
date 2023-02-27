package com.oasis.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.oasis.member.service.JoinService;
import com.oasis.common.CommandMap;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/member/")
@AllArgsConstructor
public class JoinController {

	private JoinService joinService;

	 @RequestMapping(value="/joinForm.oa")
	   public ModelAndView joinForm(CommandMap commandMap) throws Exception{
	      ModelAndView mv=new ModelAndView("join/joinForm");
	      return mv;      

	 }
	  @RequestMapping(value="/joinSuccess.oa", method=RequestMethod.POST)
	   public ModelAndView memberVerify(CommandMap commandMap) throws Exception{
	     ModelAndView mv=new ModelAndView("redirect:/member/loginForm.oa");
	     joinService.insertMember(commandMap.getMap()); 

	     return mv;
	  }
}