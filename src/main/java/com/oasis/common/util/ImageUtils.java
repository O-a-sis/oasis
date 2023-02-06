package com.oasis.common.util;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;



import lombok.AllArgsConstructor;

@Repository("imageUtils")
@AllArgsConstructor
public class ImageUtils {


	public List<Map<String, Object>> parseInsertImageInfo(Map<String, Object> map, HttpServletRequest request)
			throws Exception {
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
		Iterator<String> iterator = multipartHttpServletRequest.getFileNames();


		MultipartFile multipartFile = null;
		String originalFileName = null;
		String originalFileExtension = null;
		String storedFileName = null;

		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		Map<String, Object> listMap = null;
		String filePath = request.getSession().getServletContext().getRealPath("/") + File.separator + "img/";
		int boardIdx = 0;

		File file = new File(filePath);
		if (file.exists() == false) {
			file.mkdirs();
		}

		while (iterator.hasNext()) {
			multipartFile = multipartHttpServletRequest.getFile(iterator.next());
			if (multipartFile.isEmpty() == false) {
				originalFileName = multipartFile.getOriginalFilename();
				originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
				storedFileName = getRandomString() + originalFileExtension;

				file = new File(filePath + storedFileName);
				multipartFile.transferTo(file);

				listMap = new HashMap<String, Object>();
				listMap.put("P_ID", boardIdx);
				listMap.put("O_FILE_NAME", originalFileName);
				listMap.put("S_FILE_NAME", storedFileName);
				list.add(listMap);
			}else {
				listMap = new HashMap<String, Object>();
				listMap.put("P_ID", boardIdx);
				list.add(listMap);
			}
		}
		return list;
	}

	public List<Map<String, Object>> parseUpdateImageInfo(Map<String, Object> map, HttpServletRequest request)
	         throws Exception {
	      MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
	      Iterator<String> iterator = multipartHttpServletRequest.getFileNames();

	      MultipartFile multipartFile = null;
	      String originalFileName = null;
	      String originalFileExtension = null;
	      String storedFileName = null;

	      List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
	      Map<String, Object> listMap = null;

	      String filePath = request.getSession().getServletContext().getRealPath("/") + File.separator + "img/";
	      String boardIdx = (String) map.get("P_ID");
	      String requestName = null;
	      String idx = null;
	      
	      File file = new File(filePath);
			if (file.exists() == false) {
				file.mkdirs();
			}

	      while (iterator.hasNext()) {
	         multipartFile = multipartHttpServletRequest.getFile(iterator.next());
	         requestName = multipartFile.getName();
	         if (multipartFile.isEmpty() == false) {
	            originalFileName = multipartFile.getOriginalFilename();
	            originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
	            storedFileName = getRandomString() + originalFileExtension;

	            multipartFile.transferTo(new File(filePath + storedFileName));
	            listMap = new HashMap<String, Object>();
	            if (requestName.equals("P_IMAGE")) {
	               listMap.put("MAIN", "Y");
	            } else {
	               listMap.put("MAIN", "N");
	            }
	            listMap.put("IS_NEW", "Y");
	            listMap.put("P_ID", boardIdx);
	            listMap.put("O_FILE_NAME", originalFileName);
	            listMap.put("S_FILE_NAME", storedFileName);
	            list.add(listMap);
	         } else {

	            idx = "I_IDX_" + requestName.substring(requestName.indexOf("_") + 1);
	            if (map.containsKey(idx) == true && map.get(idx) != null) {
	               listMap = new HashMap<String, Object>();
	               listMap.put("P_ID", boardIdx);
	               listMap.put("IS_NEW", "N");
	               listMap.put("IMAGE_IDX", map.get(idx));
	               list.add(listMap);
	            }
	         }
	      }
	      return list;
	   }

	public static String getRandomString() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
}