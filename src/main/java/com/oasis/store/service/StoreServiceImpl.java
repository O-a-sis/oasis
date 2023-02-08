package com.oasis.store.service;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.oasis.store.dao.*;

import lombok.AllArgsConstructor;

@Service("storeService")
@AllArgsConstructor
public class StoreServiceImpl implements StoreService {

	private StoreDAO storeDAO;

	@Override
	public List<Map<String, Object>> selectStoreList(Map<String, Object> map) throws Exception {
	
		return storeDAO.selectStoreList(map);
	}


	@Override
	public Map<String, Object> StoreDetail(Map<String, Object> map) throws Exception {
	

		return storeDAO.storeDetail(map);
	}






}
