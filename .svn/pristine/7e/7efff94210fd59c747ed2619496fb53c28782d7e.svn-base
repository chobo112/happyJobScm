package kr.happyjob.study.practice.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.happyjob.study.practice.service.OrderService;
import kr.happyjob.study.practice.vo.OrderVO;

@Controller
@RequestMapping("/order/")

public class OrderController {

	@Autowired
	OrderService oService;
	
	@RequestMapping("orderList.do")
	@ResponseBody
	public Map<String , Object> orderList(@ModelAttribute OrderVO ovo,
			@RequestParam Map<String , Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session )throws Exception{
		Map<String, Object> resultMap = new HashMap<>();
		
		List<OrderVO> oList = oService.orderList(paramMap);
		resultMap.put("oList",oList);
		
		return resultMap;
	}
	
	@RequestMapping("orderDetail.do")
	@ResponseBody
	public Map<String , Object> orderDetail(@ModelAttribute OrderVO ovo, 
			@RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session)throws Exception{
		Map<String ,Object> resultMap = new HashMap<>();
		List<OrderVO>oDetail = oService.oDetail(paramMap);
		resultMap.put("oDetail", oDetail);
		
		return resultMap;
		
	}
	
}
