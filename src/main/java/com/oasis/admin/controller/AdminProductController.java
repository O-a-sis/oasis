package com.oasis.admin.controller;

import java.io.File;

import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.oasis.admin.service.AdminStoreService;
import com.oasis.common.CommandMap;
import com.oasis.member.service.MenuService;

import lombok.AllArgsConstructor;
import net.coobird.thumbnailator.Thumbnailator;
import com.oasis.common.util.FileUpload;
import com.oasis.common.util.Paging;

@Controller
@RequestMapping("/admin/")
@AllArgsConstructor
public class AdminProductController {

	private MenuService menuService;
	
	@RequestMapping(value = "/productList.oa") // 메인
	public ModelAndView productList(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("admin/productList");
		
		int page = commandMap.get("page") == null ? 1 : Integer.parseInt((String) commandMap.get("page"));// 현재 페이지
		int pageSize = 5;// 한 페이지에 보여줄 행의 수
		int start = (page * pageSize) - pageSize + 1;
		int end = page * pageSize;
		int menuListCount = 0; // 전체 게시글 수
		int pageBlock = 5; // 표시할 페이지의 수
		String url = "productList.oa";
		String searchUrl = "";

		commandMap.put("START", start);
		commandMap.put("END", end);
		
		List<Map<String, Object>> menuList = menuService.menuList(commandMap.getMap());

		if (menuList.size() > 0) {
			menuListCount = Integer.parseInt(String.valueOf(menuList.get(0).get("TOTAL_COUNT")));
		}

		// 페이징할 아이템의 총 수, 페이지의 수 ex> 1~5 6~10, 한 페이지에 표시할 게시글의 수, 현재 페이지, 이동주소, 검색시 사용할
		// 주소 입력
		Paging paging = new Paging(menuListCount, pageBlock, pageSize, page, url, searchUrl);

		mv.addObject("list", menuList);
		mv.addObject("paging", paging);
		mv.addObject("page", page);
		
		return mv;
	}
	
	@RequestMapping(value = "/productDetail.oa") // 메인
	public ModelAndView productDetail(CommandMap commandMap) throws Exception {
		ModelAndView mv = new ModelAndView("admin/productDetail");
		
		Map<String, Object> map = menuService.menuDetail(commandMap.getMap());
		mv.addObject("map", map);

		return mv;
	}
	
	@RequestMapping(value = "/productUpdateForm.oa") // 메인
	public ModelAndView productUpdateForm(CommandMap commandMap, RedirectAttributes rttr) throws Exception {
		ModelAndView mv = new ModelAndView("admin/productUpdateForm");	

		Map<String, Object> map = menuService.menuDetail(commandMap.getMap());
		mv.addObject("map", map);
		
		String P_IDX = String.valueOf(commandMap.get("P_IDX"));
		rttr.addAttribute("P_IDX", P_IDX);

		return mv;
	}
	
	@RequestMapping(value = "/productUpdate.oa") // 메인
	public ModelAndView productUpdate(CommandMap commandMap, @RequestParam("P_IDX") String P_IDX) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/admin/productDetail.oa?P_IDX="+P_IDX);

		int update = menuService.menuUpdate(commandMap.getMap());
		return mv;
	}
	
	@RequestMapping(value = "/productDelete.oa")
	public ModelAndView deleteProduct(CommandMap commandMap) throws Exception {
	    ModelAndView mv = new ModelAndView("redirect:/admin/productList.oa");

	    menuService.productDelete(commandMap.getMap());
	    return mv;
	}
	
	@RequestMapping(value = "/productRegisterForm.oa") // 메인
	public ModelAndView productRegisterForm(CommandMap commandMap, RedirectAttributes rttr) throws Exception {
		ModelAndView mv = new ModelAndView("admin/productRegisterForm");	

		return mv;
	}

	@RequestMapping(value = "/productRegister.oa")
	public ModelAndView myProfileUpdate(CommandMap commandMap, MultipartHttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("redirect:/admin/productList.oa");

		MultipartFile P_IMG_FILE = request.getFile("P_IMG");

		long image = System.currentTimeMillis();

		String uploadImageName = "image-" + image + ".jpg";

		// 상품 이미지를 입력할 폴더 설정
		String path = request.getSession().getServletContext().getRealPath("/") + File.separator + "img";
		// 내 프로젝트의
		// 위치/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/Flee/
		System.out.println(path);

			FileUpload.fileUpload(P_IMG_FILE, path, uploadImageName);
			commandMap.put("P_IMG", image);
		
		menuService.insertMenu(commandMap.getMap());
		return mv;
	}

}
