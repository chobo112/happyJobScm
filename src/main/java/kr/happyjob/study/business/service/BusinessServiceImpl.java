package kr.happyjob.study.business.service;

import java.util.List;
import java.util.Map;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.happyjob.study.business.dao.BusinessDao;

@Service
public class BusinessServiceImpl implements BusinessService {

	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());

	// Get class name for loggerx
	private final String className = this.getClass().toString();
	
	@Autowired
	private BusinessDao businessDao;
	
	//거래내역 => 수주내역 => 수주리스트 불러오기
	@Override
	public List<Map<String, Object>> businessObtainList(Map<String, Object> paramMap) {
		logger.info("serviceImpl ReturnList 및 검색조회 : businessObtainList ServiceImpl"+className);
		
		
		return businessDao.businessObtainList(paramMap);
	}

	@Override
	public List<Map<String, Object>> businessdeliveryManList(Map<String, Object> paramMap) {
		return businessDao.deliveryManList();
	}

	@Override
	public List<Map<String, Object>> getStorageListList(Map<String, Object> paramMap) {
		logger.info("service : " + paramMap.get("Storage_item_code"));
		
		return businessDao.getStorageListList(paramMap);
	}

	@Override
	public Integer findInsertOrUpdateCnt(Map<String, Object> paramMap) {
		logger.info("serviceImpl findInsertOrUpdateCnt 배송상태조회0,1 : businessObtainList ServiceImpl"+className);
		return businessDao.findDeliveryStatus(paramMap);
	}

	@Override
	public Integer deliveryInsert(Map<String, Object> paramMap) {
		logger.info("service(deliveryInsert) : " + paramMap);
		return businessDao.deliveryInsert(paramMap);
	}

	@Override
	public List<Map<String, Object>> getDeliveryModalSelect(Map<String, Object> paramMap) {
		logger.info("service(getDeliveryModalSelect) : " + paramMap);
		return businessDao.getDeliveryModalSelect(paramMap);
	}

	@Override
	public Integer updateDeliveryModal(Map<String, Object> paramMap) {
		logger.info("service(getDeliveryModalSelect) : " + paramMap);
		return businessDao.updateDeliveryModal(paramMap);
	}

	@Override
	public List<Map<String, Object>> businessreturnList(Map<String, Object> paramMap) {
		logger.info("service(businessreturnList) : " + paramMap);
		return businessDao.businessreturnList(paramMap);
	}

	@Override
	public Integer findInsertOrUpdateCntRe(Map<String, Object> paramMap) {
		logger.info("findInsertOrUpdateCntRe() : " + paramMap);
		return businessDao.findInsertOrUpdateCntRe(paramMap);
	}
	
	@Override
	public Integer RE_deliveryInsert(Map<String, Object> paramMap) {
		logger.info("RE_deliveryInsert() : " + paramMap);
		return businessDao.RE_deliveryInsert(paramMap);
	}

	@Override
	public List<Map<String, Object>> getDeliveryReModalSelect(Map<String, Object> paramMap) {
		logger.info("getDeliveryReModalSelect() : " + paramMap);
		return businessDao.getDeliveryReModalSelect(paramMap);
	}
	
	@Override
	public Integer Order_findstatus(Map<String, Object> paramMap) {
		logger.info("findInsertOrUpdateCntRe() : " + paramMap);
		return businessDao.Order_findstatus(paramMap);
	}
	
	@Override
	public Integer toOrderInsert(Map<String, Object> paramMap) {
		logger.info("toOrderInsert() : " + paramMap);
		return businessDao.toOrderInsert(paramMap);
	}

	@Override
	public Map<String, Object> selectDelivery(Map<String, Object> paramMap) {
		logger.info("selectDelivery() : " + paramMap);
		return businessDao.selectDelivery(paramMap);
	}

	@Override
	public List<Map<String, Object>> businessorderList(Map<String, Object> paramMap) {
		logger.info("businessorderList() : " + paramMap);
		return businessDao.businessorderList(paramMap);
	}

	@Override
	public List<Map<String, Object>> getOrderCompnay(Map<String, Object> paramMap) {
		logger.info("getOrderCompnay() : " + paramMap);
		return businessDao.getOrderCompnay(paramMap);
	}
	@Override
	public Integer insertOrder(Map<String, Object> paramMap) {
		logger.info("insertOrder() : " + paramMap);
		return businessDao.insertOrder(paramMap);
	}
	
	@Override
	public Integer getOrderStatus(Map<String, Object> paramMap) {
		logger.info("insertOrder() : " + paramMap);
		return businessDao.getOrderStatus(paramMap);
	}

	@Override
	public List<Map<String, Object>> return_deliverySelect(Map<String, Object> paramMap) {
		logger.info("return_deliverySelectUpdate() : " + paramMap);
		return businessDao.return_deliverySelect(paramMap);
	}
	
	//페이징관련 모두 여기
	@Override
	public int returnListCnt(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return businessDao.returnListCnt(paramMap);
	}

	@Override
	public int obtainListCnt(Map<String, Object> paramMap) {
		logger.info("serviceImpl obtainListCnt"+className);
		return businessDao.obtainListCnt(paramMap);
	}

	@Override
	public int orderListCnt(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return businessDao.orderListCnt(paramMap);
	}
	

}
