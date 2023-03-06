package com.oasis.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.oasis.common.CommandMap;
import com.oasis.common.util.Paging;
import com.oasis.member.service.MyTabService;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/member/")
@AllArgsConstructor
public class MyTabController {

	private MyTabService myTabService;

	@RequestMapping(value = "/myMenuBar.oa") // http://localhost:8000/Oasis/member/myMenuBar.oa?B_PHONE=01011111234
	public ModelAndView myMenuBar(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("member/myMenuBar");

		Map<String, Object> map = myTabService.myMenuBar(commandMap.getMap());

		mv.addObject("map", map);

		return mv;
	}

	@RequestMapping(value = "/myCouponList.oa")
	public ModelAndView myCoupon(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("member/myCoupon");

		List<Map<String, Object>> list = myTabService.myCouponList(commandMap.getMap());

		mv.addObject("list", list);
		System.out.println(list);
		return mv;

	}

	@RequestMapping(value = "/myOrderList.oa")
	public ModelAndView myOrderList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("member/myOrderList");

		int page = commandMap.get("page") == null ? 1 : Integer.parseInt((String) commandMap.get("page"));// 현재 페이지
		
		System.out.println("page : " + page);
		int start = 1; // 가져올 데이터의 시작 인
		int pageSize = 5;// 한 페이지에 보여줄 행의 수
		int end = 5;
		int orderListCount = 0; // 전체 게시글 수
		int pageBlock = 5; // 표시할 페이지의 수
		String url = "myOrderList.oa";
		String searchUrl = "&type=" + commandMap.get("type") + "&keyword=" + commandMap.get("keyword");

		commandMap.put("START", start);
		commandMap.put("END", end);

		List<Map<String, Object>> list = myTabService.myOrderList(commandMap.getMap());


		if (list.size() > 0) {
			orderListCount = Integer.parseInt(String.valueOf(list.get(0).get("TOTAL_COUNT")));

		}
		// 페이징할 아이템의 총 수, 페이지의 수 ex> 1~5 6~10, 한 페이지에 표시할 게시글의 수, 현재 페이지, 이동주소, 검색시 사용할
		// 주소 입력
		Paging paging = new Paging(orderListCount, pageBlock, pageSize, page, url, searchUrl);

		mv.addObject("list", list);
		mv.addObject("paging", paging);
		return mv;

	}

//	더보기 버튼 Ajax
	@RequestMapping(value = "/loadMoreOrderList.oa")
	public @ResponseBody Map<String, Object> loadMoreNotice(@RequestParam int page, @RequestParam String type,
			@RequestParam String keyword, CommandMap commandMap) throws Exception {
		
		int perPage = 5; // 한 페이지에 표시할 게시물 수
		int offset = (page * perPage) - perPage + 1; // 가져올 데이터의 시작 인덱스
		System.out.println("시작 페이지:"+offset);

		commandMap.put("START", offset);
		commandMap.put("END", page * perPage);
		commandMap.put("B_BHONE", commandMap.get("B_PHONE"));
		commandMap.put("type", type);
		commandMap.put("keyword", keyword);

		List<Map<String, Object>> list = myTabService.myOrderList(commandMap.getMap());
		int totalCount = Integer.parseInt(String.valueOf(list.get(0).get("TOTAL_COUNT")));

		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("list", list);
		resultMap.put("paging",
				new Paging(totalCount, 5, perPage, page, "myOrderList.oa", "&type=" + type + "&keyword=" + keyword));
		return resultMap;
	}

	@RequestMapping(value = "/myOrderDetail.oa") // http://localhost:8000/oasis/member/myOrderDetail.oa?O_IDX= &B_PHONE=
													// &OCU_IDX=
	public ModelAndView myOrderDetail(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("member/myOrderDetail");

		Map<String, Object> map = myTabService.myOrderDetail(commandMap.getMap()); // ORDERS
//	    Map<String, Object> map2 = myTabService.useCoupon(commandMap.getMap());	//COUPON
		List<Map<String, Object>> list = myTabService.OrderDetail(commandMap.getMap()); // ORDERS_MENU

		mv.addObject("map", map);
//	    mv.addObject("map2", map2);
		mv.addObject("list", list);

		return mv;
	}

	@RequestMapping(value = "/myStamp.oa")
	public ModelAndView myStamp(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("member/myStamp");

		Map<String, Object> map = myTabService.myStamp(commandMap.getMap());

		mv.addObject("map", map);

		return mv;
	}

}