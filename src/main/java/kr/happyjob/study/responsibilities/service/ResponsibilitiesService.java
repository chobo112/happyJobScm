package kr.happyjob.study.responsibilities.service;

import java.util.List;
import java.util.Map;

public interface ResponsibilitiesService {

	public List<Map<String, Object>> orderList(Map<String, Object> paramMap);

	public void deposit(Map<String, Object> paramMap);

	public List<Map<String, Object>> deliveryList(Map<String, Object> paramMap);

	public List<Map<String, Object>> deliveryDetail(Map<String, Object> paramMap);

	public void deleveryDone(Map<String, Object> paramMap);

}
