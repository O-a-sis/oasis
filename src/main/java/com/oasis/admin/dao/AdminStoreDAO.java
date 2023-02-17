package com.oasis.admin.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.oasis.common.dao.AbstractDAO;

@Repository("adminStoreDAO")
public class AdminStoreDAO extends AbstractDAO{
	

	/* 관리자 지점 리스트 (+매출) */ 
	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> storeList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("admin.storeList", map);
		}
	
	public List<Map<String, Object>> storeListRank(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("admin.storeListRank", map);
		}
	
	public List<Map<String, Object>> storeSumRank(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("admin.storeSumRank", map);
		}


	public void storeJoin(Map<String, Object> map) throws Exception{
		insert("admin.storeJoin", map);
		
	}

	public Map<String, Object> storeDetail(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("admin.storeDetail", map);
	}

	public List<Map<String, Object>> revenueList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("admin.revenueList", map);
		}
	

	public int update(Map<String, Object> map) throws Exception {
		return (int) update("admin.storeUpdate", map);
	}

	public void storeDown(Map<String, Object> map) throws Exception{
		update("admin.storeDown", map);
		
	}

	public int getNameCheck(String name) throws Exception{
		return (Integer)selectOne("admin.nameCheck", name);
	}
	
	public Map<String, Object> getYSum(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("admin.getYSum", map);
	}
	
	public Map<String, Object> getMAvg(Map<String, Object> map) throws Exception{
		return (Map<String, Object>) selectOne("admin.getMAvg", map);
	}
	
	public List<Map<String, Object>> memberList(Map<String, Object> map) throws Exception{
		return (List<Map<String, Object>>)selectList("admin.memberList", map);
		}

}




	

