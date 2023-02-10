package com.oasis.store.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	
	@RequestMapping(value = "/processingOrderUpdate.oa")
	public ModelAndView updateProcessingOrder(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/store/main.oa");
		
		int openStore = storeService.updateProcessingOrder(commandMap.getMap());
		return mv;
	}
	
	@RequestMapping(value = "/order/{oidx}", method = RequestMethod.GET, consumes = "application/json", produces = {
			MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<Map<String, Object>> get(@PathVariable("oidx") String oidx) throws Exception {
		return new ResponseEntity<Map<String, Object>>(storeService.getOrderDetail(oidx), HttpStatus.OK);
	}
	
	@RequestMapping(value = "/orderUpdate", method = { RequestMethod.PATCH,
			RequestMethod.PUT }, consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> updateOrderJson(@RequestBody Map<String, Object> map) throws Exception {
		int count = storeService.updateOrder(map);
		return count == 1 ? new ResponseEntity<String>("success", HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@RequestMapping(value = "/processingOrderUpdate", method = { RequestMethod.PATCH,
			RequestMethod.PUT }, consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> updateProcessingOrderJson(@RequestBody Map<String, Object> map) throws Exception {
		int count = storeService.updateProcessingOrder(map);
		return count == 1 ? new ResponseEntity<String>("success", HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@RequestMapping(value = "/stock.oa") // 메인
	public ModelAndView stockList(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("store/stockList");
		
		HttpSession session = request.getSession();
		commandMap.put("O_STORE", session.getAttribute("STORE"));

		int storeStatus = storeService.getStoreStatus(commandMap.getMap());
		mv.addObject("status", storeStatus);
		
		List<Map<String, Object>> stockList = storeService.getStockList(commandMap.getMap());
		mv.addObject("list", stockList);
	
		return mv;
	}

}
