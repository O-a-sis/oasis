package com.oasis.member.controller;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.oasis.common.CommandMap;
import com.oasis.member.service.MyTabService;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
public class MyTabController {

	private MyTabService myTabService;

	@RequestMapping(value="/member/myMenuBar.oa")
	public ModelAndView myMenuBar(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("member/myMenuBar");

		Map<String, Object> map = myTabService.myMenuBar(commandMap.getMap());

		mv.addObject("map", map);

		return mv;
	}

	@RequestMapping(value="/member/myCouponList.oa")
	public ModelAndView myCoupon(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("member/myCoupon");

		List<Map<String, Object>> list = myTabService.myCoupon(commandMap.getMap());

		mv.addObject("list", list);

		return mv;

	}

	@RequestMapping(value="/member/myOrderList.oa")
	public ModelAndView myOrderList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("member/myOrderList");

		List<Map<String, Object>> list = myTabService.myOrderList(commandMap.getMap());

		mv.addObject("list", list);

		return mv;

	}

	@RequestMapping(value="/member/myOrderDetail.oa") // http://localhost:8000/oasis/member/myOrderDetail.oa?O_IDX=1
	public ModelAndView myOrderDetail(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("member/myOrderDetail");

		Map<String, Object> map = myTabService.myOrderDetail(commandMap.getMap());

		mv.addObject("map", map);

		return mv;

	}

	@RequestMapping(value="/member/myStamp.oa")
	public ModelAndView myStamp(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("member/myStamp");

		Map<String, Object> map = myTabService.myStamp(commandMap.getMap());

		mv.addObject("map", map);

		return mv;
	}

}