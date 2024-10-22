package kr.happyjob.study.direction.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.happyjob.study.direction.dao.DirectionDao;
import kr.happyjob.study.direction.model.TB_order;

@Service
public class DirectionServiceImpl implements DirectionService {
	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());

	// Get class name for loggerx
	private final String className = this.getClass().toString();
	
	
	@Autowired
	private DirectionDao directionDao;

	@Override//발주리스트 조회
	public List<TB_order> searchOrderList(TB_order tborder) throws Exception{
		List<TB_order> list = new ArrayList<>();
		
		try {
//			List<TB_order> list = directionDao.searchOrderList();
			list = directionDao.searchOrderList(tborder);
//			List<TB_order> OrderList = directionDao.searchOrderList();
//			logger.info("발주리스트 Service(dao에서 가져옴 : " + OrderList);
			logger.info("발주리스트 Service(dao에서 가져옴 : " + list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<Map<String, Object>> directionReturnList(Map<String, Object> paramMap) {
		
		logger.info("serviceImpl ReturnList 및 검색조회"+className);
		return directionDao.directionReturnList(paramMap);
	}

	@Override
	public List<Map<String, Object>> directionDeliveryList(Map<String, Object> paramMap) {
		logger.info("serviceImpl deliveryList 및 검색조회"+className);

		return directionDao.directionDeliveryList(paramMap);
	}

	//아래2개 페이징
	@Override
	public int deliveryListCnt(Map<String, Object> paramMap) {
		logger.info("serviceImpl deliveryListCn"+className);
		return directionDao.deliveryListCnt(paramMap);
	}
	
	@Override
	public int returnListCnt(Map<String, Object> paramMap) {
		logger.info("serviceImpl returnListCnt"+className);
		return directionDao.returnListCnt(paramMap);
	}

	@Override
	public int orderListCnt(Map<String, Object> paramMap) throws Exception {

		return directionDao.orderListCnt(paramMap);
	}

	@Override
	public List<Map<String, Object>> searchOrderListJson(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return directionDao.searchOrderListJson(paramMap);
	}
	

}
