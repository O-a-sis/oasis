package com.oasis.store.controller;

import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.oasis.common.CommandMap;
import com.oasis.store.service.StoreService;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/store/")
@AllArgsConstructor
public class StoreController {
	
	private StoreService storeService;
	
	@RequestMapping(value = "/orderUpdate.oa")
	public ModelAndView updateOrder(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/store/main.oa");
		
		int openStore = storeService.updateOrder(commandMap.getMap());
		return mv;
	}
	
	@RequestMapping(value = "/orderProcessingUpdate.oa")
	public ModelAndView updateProcessingOrder(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/store/main.oa");
		
		int openStore = storeService.updateProcessingOrder(commandMap.getMap());
		return mv;
	}
	
	@RequestMapping(value = "/order/{oidx}", method = RequestMethod.GET, consumes = "application/json", produces = {
			MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<Map<String, Object>> get(@PathVariable("oidx") int oidx) throws Exception {
		return new ResponseEntity<Map<String, Object>>(storeService.getOrderDetail(oidx), HttpStatus.OK);
	}

}
