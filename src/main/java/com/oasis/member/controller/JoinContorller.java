package com.oasis.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.oasis.member.service.JoinService;
import com.oasis.common.CommandMap;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class JoinContorller {
	
	private JoinService joinService;
	
	 @RequestMapping(value="/member/joinForm.oa")
	   public ModelAndView joinForm(CommandMap commandMap) throws Exception{
	      ModelAndView mv=new ModelAndView("join/joinForm");
	      return mv;      

	 }
	  @RequestMapping(value="/member/joinSuccess.oa", method=RequestMethod.POST)
	   public ModelAndView memberVerify(CommandMap commandMap) throws Exception{
	     ModelAndView mv=new ModelAndView("join/joinForm2");
	     joinService.insertMember(commandMap.getMap()); 
	     
	     return mv;
	  }
}
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 