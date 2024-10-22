package kr.happyjob.study.direction.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.happyjob.study.direction.model.TB_order;
import kr.happyjob.study.direction.service.DirectionService;

//작업지시서 사이드바
@Controller
@RequestMapping("/direction/")
public class DirectionController {
	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());

	// Get class name for logger
	private final String className = this.getClass().toString();

	@Autowired
	private DirectionService directionService;

	// 작업지시서 => 발주지시서 전체현황불러오기 + 발주지시서 화면
	@RequestMapping("orderList.do")
	public String directionOrder(Model model, TB_order tborder, @RequestParam Map<String, Object> paramMap,
			HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		logger.info("작업지시서 사이드바 : 발주지시서 " + className);

		// 제품테이블(item) : item_code(제품명) item_name(제품번호)
		// 발주테이블 : 발주업체명(order_company), 발주일자 order_date, 발주개수 : order_count
		List<TB_order> list = directionService.searchOrderList(tborder);

		logger.info("발주지시서 리스트 : " + list);

		model.addAttribute("orderList", list);

		return "direction/directionOrder";
	}

	// orderListJson for react
	@RequestMapping("orderListJson.do")
	@ResponseBody
	public Map<String, Object> orderListJson(@RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		logger.info("작업지시서 사이드바 : 발주지시서 " + className);
		logger.info("##################################" + paramMap);

		Map<String, Object> resultMap = new HashMap<>();

		int cpage = Integer.valueOf((String) paramMap.get("cpage"));
		int pageSize = Integer.valueOf((String) paramMap.get("pageSize"));

		int startSeq = (cpage - 1) * pageSize;

		paramMap.put("startSeq", startSeq);
		paramMap.put("pageSize", pageSize);

		// 제품테이블(item) : item_code(제품명) item_name(제품번호)
		// 발주테이블 : 발주업체명(order_company), 발주일자 order_date, 발주개수 : order_count
		List<Map<String, Object>> orderList = directionService.searchOrderListJson(paramMap);
		int orderCnt = directionService.orderListCnt(paramMap);

		resultMap.put("orderList", orderList);
		resultMap.put("listCount", orderCnt);

		return resultMap;
	}

	// ajax 발주리스트 검색 및 조건 검색
	@PostMapping("/searchOrder")
	@ResponseBody
	public Map<String, Object> searchOrder(@RequestBody Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {

		logger.info("+ Start " + className + ".noticeSave");
		logger.info("제대로 들어왔습니까  - paramMap : " + paramMap);
		// - paramMap : {searchTitle=카카, searchStDate=, searchEdDate=}

		// 파라미터로 받아온 ajax => DTO에 맞게 넣어주기
		TB_order tborder = new TB_order();
		tborder.setOrder_company((String) paramMap.get("searchCompany"));
		// tborder.setSearchStDate((String) paramMap.get("searchStDate"));
		// tborder.setSearchStDate((String) paramMap.get("searchEdDate"));

		// 검색 시작일 설정
		if (paramMap.containsKey("searchStDate") && !paramMap.get("searchStDate").toString().isEmpty()) {
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date searchStDate = new Date(dateFormat.parse((String) paramMap.get("searchStDate")).getTime());
			tborder.setSearchStDate(searchStDate);
		}

		// 검색 종료일 설정
		if (paramMap.containsKey("searchEdDate") && !paramMap.get("searchEdDate").toString().isEmpty()) {
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date searchEdDate = new Date(dateFormat.parse((String) paramMap.get("searchEdDate")).getTime());
			tborder.setSearchEdDate(searchEdDate);
		}

		System.out.println("Order Company: " + tborder.getOrder_company());

		// 검색 조건으로 서비스 호출
		List<TB_order> orderList = directionService.searchOrderList(tborder);
		logger.info("쿼리 타고 온 결과" + orderList);
		// 결과를 resultMap에 넣음
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("searchOrder", orderList);

		return resultMap;
	}

	// 작업지시서 => 반품지시서 현황 DB->url이동화면
	@RequestMapping("returnList.do")
	public String directionReturn() {
		logger.info("작업지시서 사이드바 : 반품지시서 " + className);

		return "direction/directionReturn";
	}

	// ReturnListJson for react
	@RequestMapping("returnListJson.do")
	@ResponseBody
	public Map<String, Object> directionReturnListJson(Model model, @RequestParam Map<String, Object> paramMap) {

		logger.info("+ Start " + className + ".directionReturnList");
		logger.info("   - paramMap : " + paramMap);

		Map<String, Object> resultMap = new HashMap<>();

		// 페이징
		int cpage = Integer.valueOf((String) paramMap.get("cpage"));
		int pageSize = Integer.valueOf((String) paramMap.get("pageSize"));
		int startSeq = (cpage - 1) * pageSize;
		paramMap.put("startSeq", startSeq);
		paramMap.put("pageSize", pageSize);

		int returnListCnt = directionService.returnListCnt(paramMap);
		model.addAttribute("returnListCnt", returnListCnt);

		List<Map<String, Object>> returnList = directionService.directionReturnList(paramMap);

		resultMap.put("returnList", returnList);
		resultMap.put("listCount", returnListCnt);

		model.addAttribute("returnList", returnList);

		return resultMap;
	}

	// 작업지시서 => 반품지시서 리스트 및 검색
	@RequestMapping("ajax_returnList.do")

	public String directionReturnList(Model model, @RequestParam Map<String, Object> paramMap) {

		logger.info("+ Start " + className + ".directionReturnList");
		logger.info("   - paramMap : " + paramMap);

		// 페이징
		int cpage = Integer.valueOf((String) paramMap.get("currentPage"));
		int pageSize = Integer.valueOf((String) paramMap.get("pageSize"));
		int startSeq = (cpage - 1) * pageSize;
		paramMap.put("startSeq", startSeq);
		paramMap.put("pageSize", pageSize);

		int returnListCnt = directionService.returnListCnt(paramMap);
		model.addAttribute("returnListCnt", returnListCnt);

		List<Map<String, Object>> returnList = directionService.directionReturnList(paramMap);
		logger.info("   - returnList(전체현황+검색) : " + returnList);

		model.addAttribute("returnList", returnList);

		return "direction/directionReturnList";
	}

	
	// 작업지시서 => 배송지시서 현황
	@RequestMapping("deliveryList.do")
	public String directionDelivery() {

		return "direction/directionDelivery";
	}
	

	// 작업지시서 => 배송지시서 검색 및 리스트 불러오기
	@RequestMapping("directionDeliveryList.do")
	public String directionDeliveryList(Model model, HttpServletRequest request, HttpServletResponse response,
			@RequestParam Map<String, Object> paramMap) {

		logger.info("작업지시서 배송 : 배송지시서리스트 및 검색 " + className);
		logger.info("페이징 파라미터 있니 paramMap@@@@@@@@@@@@@@@@@@@@@@@" + paramMap);

		// 페이징
		int cpage = Integer.valueOf((String) paramMap.get("currentPage"));
		int pageSize = Integer.valueOf((String) paramMap.get("pageSize"));
		int startSeq = (cpage - 1) * pageSize;
		paramMap.put("startSeq", startSeq);
		paramMap.put("pageSize", pageSize);

		List<Map<String, Object>> deliveryList = directionService.directionDeliveryList(paramMap);
		logger.info("   - directionDeliveryList(전체현황+검색) : " + deliveryList);


		int deliveryListCnt = directionService.deliveryListCnt(paramMap);
		model.addAttribute("deliveryListCnt", deliveryListCnt);

		model.addAttribute("deliveryList", deliveryList);

		return "direction/directionDeliveryList";
	}
}
