package kr.happyjob.study.practice.dao;

import java.util.List;
import java.util.Map;

import kr.happyjob.study.practice.vo.OrderVO;

public interface OrderDAO {
	
	public List<OrderVO> orderList(Map<String, Object> paramMap)throws Exception;
	public List<OrderVO> oDetail(Map<String, Object> paramMap)throws Exception;

}
