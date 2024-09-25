package kr.happyjob.study.responsibilities.service;

import java.util.List;
import java.util.Map;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.happyjob.study.responsibilities.dao.ResponsibilitiesDao;

@Service
public class ResponsibilitiesServiceImpl implements ResponsibilitiesService{

	@Autowired ResponsibilitiesDao responsibilitiesDao;
	private final Logger logger = LogManager.getLogger(this.getClass());
	
	@Override
	public List<Map<String, Object>> orderList(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return responsibilitiesDao.orderList(paramMap);
	}

	@Override
	public void deposit(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		responsibilitiesDao.deposit(paramMap);
	}

	@Override
	public List<Map<String, Object>> deliveryList(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return responsibilitiesDao.deliveryList(paramMap);
	}

	@Override
	public List<Map<String, Object>> deliveryDetail(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return responsibilitiesDao.deliveryDetail(paramMap);
	}
	
	@Override
	public void deleveryDone(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		int i = responsibilitiesDao.deleveryDone(paramMap);
		logger.info("   - deleveryDone  i : " + i);
		
		if(i>0){
			Map<String, Object> map = responsibilitiesDao.doneObj(paramMap);
			logger.info("   - doneObj   : " + map);
			
			responsibilitiesDao.storInven(map);
			
		}
		
	}
}
