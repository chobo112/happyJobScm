package kr.happyjob.study.responsibilities.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.happyjob.study.responsibilities.dao.ReturnDAO;
import kr.happyjob.study.responsibilities.vo.ReturnVO;

@Service
public class ReturnServiceImpl implements ReturnService{
	
	@Autowired
	ReturnDAO rdao;
	
	@Override
	public List<ReturnVO> returnList(Map<String, Object> paramMap) throws Exception{
		// TODO Auto-generated method stub
		return rdao.returnList(paramMap);
	}

	@Override
	public List<ReturnVO> returnDetail(Map<String, Object> paramMap)throws Exception {
		// TODO Auto-generated method stub
		return rdao.returnDetail(paramMap);
	}

	@Override
	public int confirm(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return rdao.confirm(paramMap);
	}

	@Override
	public int modeItemCount(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return rdao.modeItemCount(paramMap);
	}

	@Override
	public int returnCnt(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return rdao.returnCnt(paramMap);
	}

}
