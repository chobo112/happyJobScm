package kr.happyjob.study.direction.service;

import java.util.List;
import java.util.Map;

import kr.happyjob.study.direction.model.TB_order;

public interface DirectionService {
	
	public List<TB_order> searchOrderList(TB_order tborder) throws Exception; //발주지시서 화면조회

	public int orderListCnt(Map<String, Object> paramMap) throws Exception;
	
	public List<Map<String, Object>> directionReturnList(Map<String, Object> paramMap);

	public List<Map<String, Object>> directionDeliveryList(Map<String, Object> paramMap);

	public int deliveryListCnt(Map<String, Object> paramMap);

	public int returnListCnt(Map<String, Object> paramMap);

	public List<Map<String, Object>> searchOrderListJson(Map<String, Object> paramMap);

}
