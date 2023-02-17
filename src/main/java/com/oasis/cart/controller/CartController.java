package com.oasis.cart.controller;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndView;
import com.oasis.common.CommandMap;
import com.oasis.member.service.JoinService;
import lombok.AllArgsConstructor;


@Controller
@RequestMapping("/member/")
@AllArgsConstructor
public class CartController {

	@RequestMapping(value = "/CartList.fe")
	public ModelAndView cartList(CommandMap commandMap) throws Exception {
	ModelAndView mv = new ModelAndView("member/cartList");

	return mv;
	
	}
}