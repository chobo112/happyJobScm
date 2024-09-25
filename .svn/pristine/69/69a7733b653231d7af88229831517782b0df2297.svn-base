package kr.happyjob.study.practice.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.happyjob.study.practice.dao.OrderDAO;
import kr.happyjob.study.practice.vo.OrderVO;

@Service
public class OrderServiceImpl implements OrderService {
    
    @Autowired
    OrderDAO odao;
    
    @Override
    public List<OrderVO> orderList(Map<String, Object> paramMap) throws Exception {
        return odao.orderList(paramMap);
    }

	@Override
	public List<OrderVO> oDetail(Map<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return odao.oDetail(paramMap);
	}

}
