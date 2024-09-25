package kr.happyjob.study.executive.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.happyjob.study.executive.dao.ExecutiveDao;

@Service
public class ExecutiveServiceImpl implements ExecutiveService{
	
	@Autowired
	ExecutiveDao executiveDao;
	
	@Override
	public List<Map<String, Object>> storageAll(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return executiveDao.storageAll(paramMap);
	}

	@Override
	public List<Map<String, Object>> storageDetail(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return executiveDao.storageDetail(paramMap);
	}

	@Override
	public List<Map<String, Object>> salesList(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return executiveDao.salesList(paramMap);
	}

	@Override
	public List<Map<String, Object>> salesTop(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub

		if (paramMap.get("orderBy") == null) {
			paramMap.put("orderBy", "sales");
		}
		
		return executiveDao.salesTop(paramMap);
	}

	@Override
	public List<Map<String, Object>> orderApprovalY(Map<String, Object> paramMap) {
		String type = (String) paramMap.get("type");
		if(type == null || type.length() == 0  || paramMap.get("type").equals("Y")){			
			return executiveDao.orderApprovalY(paramMap);
		}else{
			return null;
		}
	}

	@Override
	public List<Map<String, Object>> orderApprovalN(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		String type = (String) paramMap.get("type");
		if(type == null || type.length() == 0 || paramMap.get("type").equals("N")){			
			return executiveDao.orderApprovalN(paramMap);
		}else{
			return null;
		}
	}

	@Override
	public List<Map<String, Object>> returnApprovalY(Map<String, Object> paramMap) {
		String type = (String) paramMap.get("type");
		if(type == null || type.length() == 0  || paramMap.get("type").equals("Y")){		
			return executiveDao.returnApprovalY(paramMap);
		}else{
			return null;
		}
	}

	@Override
	public List<Map<String, Object>> returnApprovalN(Map<String, Object> paramMap) {
		String type = (String) paramMap.get("type");
		if(type == null || type.length() == 0  || paramMap.get("type").equals("N")){		
			return executiveDao.returnApprovalN(paramMap);
		}else{
			return null;
		}
	}


	@Override
	public List<Map<String, Object>> chart(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return executiveDao.chart(paramMap);
	}
	
	@Override
	public int salesPage(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return executiveDao.salesPage(paramMap);
	}

	@Override
	public void approvalY(Map<String, Object> paramMap) {
		
		executiveDao.approvalY(paramMap);
	}

	@Override
	public int orderAppPage(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return executiveDao.orderAppPage(paramMap);
	}

	@Override
	public int returnAppPage(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return executiveDao.returnAppPage(paramMap);
	}


	


}
