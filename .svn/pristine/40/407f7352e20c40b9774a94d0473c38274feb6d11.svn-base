package kr.happyjob.study.cust.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.happyjob.study.cust.dao.CustDAO;
import kr.happyjob.study.cust.vo.CustVO;

@Service
public class CustServiceImpl implements CustService {
	
	@Autowired
	CustDAO cdao;
	

	@Override
	public List<CustVO> custList(Map<String, Object> paramMap) throws Exception {
		return cdao.custList(paramMap);
	}


	@Override
	public int custSave(Map<String, Object> paramMap)throws Exception {
		// TODO Auto-generated method stub
		return cdao.custSave(paramMap);
	}
}
