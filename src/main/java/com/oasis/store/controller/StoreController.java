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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.oasis.common.CommandMap;
import com.oasis.common.util.Paging;
import com.oasis.common.util.ProductPaging;
import com.oasis.store.service.StoreService;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/store/")
@AllArgsConstructor
public class StoreController {
	
	private StoreService storeService;
	
	@RequestMapping(value = "/getAlarm/{store}", method = RequestMethod.GET, consumes = "application/json", produces = {
			MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<List<Map<String, Object>>> getAlarm(@PathVariable("store") int store) throws Exception {

		return new ResponseEntity<List<Map<String, Object>>>(storeService.getAlarm(store), HttpStatus.OK);
	}
	
	@RequestMapping(value = "/orderUpdate.oa")
	public ModelAndView updateOrder(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/store/main.oa");
		
		int openStore = storeService.updateOrder(commandMap.getMap());
		int updateOrderAlarm = storeService.updateOrderAlarm(commandMap.getMap());
		return mv;
	}
	
	@RequestMapping(value = "/processingOrderUpdate.oa")
	public ModelAndView updateProcessingOrder(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/store/main.oa");

		int openStore = storeService.updateProcessingOrder(commandMap.getMap());
		int updateOrderAlarm = storeService.updateOrderAlarm(commandMap.getMap());
		return mv;
	}
	
	@RequestMapping(value = "/order/{oidx}", method = RequestMethod.GET, consumes = "application/json", produces = {
			MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<List<Map<String, Object>>> get(@PathVariable("oidx") String oidx) throws Exception {
		return new ResponseEntity<List<Map<String, Object>>>(storeService.getOrderDetail(oidx), HttpStatus.OK);
	}
	
	@RequestMapping(value = "/orderUpdate", method = { RequestMethod.PATCH,
			RequestMethod.PUT }, consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> updateOrderJson(@RequestBody Map<String, Object> map) throws Exception {
		int count = storeService.updateOrder(map);
		int updateOrderAlarm = storeService.updateOrderAlarm(map);
		return count == 1 ? new ResponseEntity<String>("success", HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@RequestMapping(value = "/processingOrderUpdate", method = { RequestMethod.PATCH,
			RequestMethod.PUT }, consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> updateProcessingOrderJson(@RequestBody Map<String, Object> map) throws Exception {
		int count = storeService.updateProcessingOrder(map);
		int updateOrderAlarm = storeService.updateOrderAlarm(map);		
		return count == 1 ? new ResponseEntity<String>("success", HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@RequestMapping(value = "/todaysOrders.oa") // ????????????
	public ModelAndView todaysOrders(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("store/todaysOrders");
		
		HttpSession session = request.getSession();
		commandMap.put("O_STORE", session.getAttribute("STORE"));

		int storeStatus = storeService.getStoreStatus(commandMap.getMap());
		mv.addObject("status", storeStatus);
		
		if (commandMap.get("O_STATUS") == null) {
			commandMap.put("O_STATUS", "1");
		}
		
		int page = commandMap.get("page") == null ? 1 : Integer.parseInt((String) commandMap.get("page"));// ?????? ?????????
		int pageSize = 10;// ??? ???????????? ????????? ?????? ???
		int start = (page * pageSize) - pageSize + 1;
		int end = page * pageSize;
		int orderListCount = 0; // ?????? ????????? ???
		int pageBlock = 5; // ????????? ???????????? ???
		String url = "todaysOrders.oa";
		String subUrl = "&O_STATUS="+String.valueOf(commandMap.get("O_STATUS"));
		String searchUrl = "";
		

		commandMap.put("START", start);
		commandMap.put("END", end);

		List<Map<String, Object>> orderList = storeService.getOrdersListByStatus(commandMap.getMap());

		if (orderList.size() > 0) {
			orderListCount = Integer.parseInt(String.valueOf(orderList.get(0).get("TOTAL_COUNT")));
		}

		// ???????????? ???????????? ??? ???, ???????????? ??? ex> 1~5 6~10, ??? ???????????? ????????? ???????????? ???, ?????? ?????????, ????????????, ????????? ?????????
		// ?????? ??????
		ProductPaging paging = new ProductPaging(orderListCount, pageBlock, pageSize, page, url, searchUrl, subUrl);

		mv.addObject("list", orderList);
		mv.addObject("paging", paging);
	
		return mv;
	}
	
	@RequestMapping(value = "/stock.oa") // ??????
	public ModelAndView stockList(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("store/stockList");
		
		HttpSession session = request.getSession();
		commandMap.put("O_STORE", session.getAttribute("STORE"));

		int storeStatus = storeService.getStoreStatus(commandMap.getMap());
		mv.addObject("status", storeStatus);
		
		int page = commandMap.get("page") == null ? 1 : Integer.parseInt((String) commandMap.get("page"));// ?????? ?????????
		int pageSize = 5;// ??? ???????????? ????????? ?????? ???
		int start = (page * pageSize) - pageSize + 1;
		int end = page * pageSize;
		int stockListCount = 0; // ?????? ????????? ???
		int pageBlock = 5; // ????????? ???????????? ???
		String url = "stock.oa";
		String searchUrl = "";

		commandMap.put("START", start);
		commandMap.put("END", end);

		List<Map<String, Object>> stockList = storeService.getStockList(commandMap.getMap());

		if (stockList.size() > 0) {
			stockListCount = Integer.parseInt(String.valueOf(stockList.get(0).get("TOTAL_COUNT")));
		}

		// ???????????? ???????????? ??? ???, ???????????? ??? ex> 1~5 6~10, ??? ???????????? ????????? ???????????? ???, ?????? ?????????, ????????????, ????????? ?????????
		// ?????? ??????
		Paging paging = new Paging(stockListCount, pageBlock, pageSize, page, url, searchUrl);

		mv.addObject("list", stockList);
		mv.addObject("paging", paging);
	
		return mv;
	}
	
	@RequestMapping(value = "/stockUpdate.oa", method = { RequestMethod.PATCH,
			RequestMethod.PUT }, consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> stockUpdate(@RequestBody Map<String, Object> map) throws Exception {
		int count = storeService.updateStock(map);
		return count == 1 ? new ResponseEntity<String>("success", HttpStatus.OK)
				: new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@RequestMapping(value = "/noticeList.oa") // ????????????
	public ModelAndView noticeList(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("store/noticeList");
		
		HttpSession session = request.getSession();
		commandMap.put("O_STORE", session.getAttribute("STORE"));

		int storeStatus = storeService.getStoreStatus(commandMap.getMap());
		mv.addObject("status", storeStatus);
		
		int page = commandMap.get("page") == null ? 1 : Integer.parseInt((String) commandMap.get("page"));// ?????? ?????????
		int pageSize = 10;// ??? ???????????? ????????? ?????? ???
		int start = (page * pageSize) - pageSize + 1;
		int end = page * pageSize;
		int noticeListCount = 0; // ?????? ????????? ???
		int pageBlock = 5; // ????????? ???????????? ???
		String url = "noticeList.oa";
		String searchUrl = "";

		commandMap.put("START", start);
		commandMap.put("END", end);

		List<Map<String, Object>> noticeList = storeService.getNoticeList(commandMap.getMap());

		if (noticeList.size() > 0) {
			noticeListCount = Integer.parseInt(String.valueOf(noticeList.get(0).get("TOTAL_COUNT")));
		}

		// ???????????? ???????????? ??? ???, ???????????? ??? ex> 1~5 6~10, ??? ???????????? ????????? ???????????? ???, ?????? ?????????, ????????????, ????????? ?????????
		// ?????? ??????
		Paging paging = new Paging(noticeListCount, pageBlock, pageSize, page, url, searchUrl);

		mv.addObject("list", noticeList);
		mv.addObject("paging", paging);
		mv.addObject("page", page);
	
		return mv;
	}
	
	@RequestMapping(value = "/noticeDetail.oa") // ????????????
	public ModelAndView noticeDetail(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("store/noticeDetail");
		
		HttpSession session = request.getSession();
		commandMap.put("O_STORE", session.getAttribute("STORE"));

		int storeStatus = storeService.getStoreStatus(commandMap.getMap());
		mv.addObject("status", storeStatus);

		Map<String, Object> noticeDetail = storeService.getNoticeDetail(commandMap.getMap());
		mv.addObject("detail", noticeDetail);
	
		return mv;
	}
	
	@RequestMapping(value = "/ordersAllList.oa") // ????????????
	public ModelAndView ordersAllList(CommandMap commandMap, HttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("store/ordersAllList");
		
		HttpSession session = request.getSession();
		commandMap.put("O_STORE", session.getAttribute("STORE"));

		int storeStatus = storeService.getStoreStatus(commandMap.getMap());
		mv.addObject("status", storeStatus);
		
		int page = commandMap.get("page") == null ? 1 : Integer.parseInt((String) commandMap.get("page"));// ?????? ?????????
		int pageSize = 10;// ??? ???????????? ????????? ?????? ???
		int start = (page * pageSize) - pageSize + 1;
		int end = page * pageSize;
		int orderListCount = 0; // ?????? ????????? ???
		int pageBlock = 5; // ????????? ???????????? ???
		String url = "ordersAllList.oa";
		String searchUrl = "&DATE="+String.valueOf(commandMap.get("DATE"));

		commandMap.put("START", start);
		commandMap.put("END", end);

		List<Map<String, Object>> orderList = storeService.getOrdersAllList(commandMap.getMap());

		if (orderList.size() > 0) {
			orderListCount = Integer.parseInt(String.valueOf(orderList.get(0).get("TOTAL_COUNT")));
		}

		// ???????????? ???????????? ??? ???, ???????????? ??? ex> 1~5 6~10, ??? ???????????? ????????? ???????????? ???, ?????? ?????????, ????????????, ????????? ?????????
		// ?????? ??????
		Paging paging = new Paging(orderListCount, pageBlock, pageSize, page, url, searchUrl);

		mv.addObject("list", orderList);
		mv.addObject("paging", paging);
	
		return mv;
	}
	
	
	@RequestMapping(value = "/todayCount/{today}", method = RequestMethod.GET, consumes = "application/json", produces = {
			MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<Integer> getTodayCount(@PathVariable("today") String today) throws Exception {

		return new ResponseEntity<Integer>(storeService.getTodayCount(today), HttpStatus.OK);
	}
	
	@RequestMapping(value = "/todaySum/{today}", method = RequestMethod.GET, consumes = "application/json", produces = {
			MediaType.APPLICATION_XML_VALUE, MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<Integer> getTodaySum(@PathVariable("today") String today) throws Exception {

		return new ResponseEntity<Integer>(storeService.getTodaySum(today), HttpStatus.OK);
	}

}
