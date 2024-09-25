package kr.happyjob.study.mypage.controller;

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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.happyjob.study.board.model.NoticeModel;
import kr.happyjob.study.mypage.model.OrderModel;
import kr.happyjob.study.mypage.model.ReturnModel;
import kr.happyjob.study.mypage.service.MypageService;
import kr.happyjob.study.product.model.CartModel;
import kr.happyjob.study.product.model.ProductModel;

@RequestMapping("/mypage/")
@Controller
public class MypageController {

	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());

	// Get class name for logger
	private final String className = this.getClass().toString();

	@Autowired
	MypageService mypageService;

	@GetMapping("cart.do")
	public String cart() {

		return "mypage/cart";
	}

	@PostMapping("cartList.do")
	@ResponseBody
	public ModelAndView cartList(HttpServletRequest request, HttpSession session) {
		logger.info("+ Start " + className + ".cartList");

		String loginID = (String) session.getAttribute("loginId");

		ModelAndView mv = new ModelAndView();

		List<ProductModel> list = mypageService.cartList(loginID);
		int cnt = mypageService.cartListCnt(loginID);

		mv.addObject("cartInfo", list);
		mv.addObject("cnt", cnt);
		mv.setViewName("mypage/cartList");

		return mv;
	}

	@RequestMapping("cartListJson.do")
	@ResponseBody
	public Map<String, Object> cartListJson(Model model, @RequestParam Map<String, Object> paramMap,
			HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {
		logger.info("+ Start " + className + ".cartList");
		logger.info("   - paramMap : " + paramMap);

		Map<String, Object> resultmap = new HashMap<String, Object>();

		String loginID = (String) session.getAttribute("loginId");

		// int cpage = Integer.valueOf((String) paramMap.get("cpage"));
		// int pageSize = Integer.valueOf((String) paramMap.get("pageSize"));

		// int startSeq = (cpage - 1) * pageSize;

		// paramMap.put("startSeq", startSeq);
		// paramMap.put("pageSize", pageSize);

		List<ProductModel> list = mypageService.cartList(loginID);
		int cnt = mypageService.cartListCnt(loginID);

		resultmap.put("cartInfo", list);
		resultmap.put("cartCnt", cnt);
		resultmap.put("loginId", loginID);

		return resultmap;
	}

	@PostMapping("cartDelete.do")
	@ResponseBody
	public String cartDelete(@RequestBody CartModel cartModel, HttpSession session) {
		logger.info("+ Start " + className + ".cartDelete");
		logger.info("   - paramMap : " + cartModel);

		String loginID = (String) session.getAttribute("loginId");

		mypageService.cartDelete(cartModel, loginID);

		return "mypage/cartList";
	}

	@PostMapping("cartDeleteJson.do")
	@ResponseBody
	public Map<String, Object> cartDeleteJson(@RequestBody CartModel cartModel, HttpSession session) {

		logger.info("+ Start " + className + ".cartDelete");
		logger.info("   - paramMap : " + cartModel);

		Map<String, Object> resultmap = new HashMap<String, Object>();
		int result = 0;
		String returnMsg = "";

		String loginID = (String) session.getAttribute("loginId");

		result = mypageService.cartDelete(cartModel, loginID);
		if (result > 0) {
			returnMsg = "success";
		} else {
			returnMsg = "fail";
		}

		resultmap.put("result", returnMsg);

		return resultmap;
	}

	@PostMapping("cartCountChange.do")
	@ResponseBody
	public ProductModel cartCountChange(@RequestBody CartModel cartModel, HttpSession session) throws Exception {
		logger.info("+ Start " + className + ".cartCountChange");
		logger.info("   - paramMap : " + cartModel);

		String loginID = (String) session.getAttribute("loginId");

		ProductModel result = mypageService.cartCountChange(cartModel, loginID);

		return result;
	}

	@PostMapping("cartCountChangeJson.do")
	@ResponseBody
	public Map<String, Object> cartCountChangeJson(@RequestBody CartModel cartModel, HttpSession session)
			throws Exception {
		logger.info("+ Start " + className + ".cartCountChange");
		logger.info("   - paramMap : " + cartModel);

		Map<String, Object> resultmap = new HashMap<String, Object>();
		String loginID = (String) session.getAttribute("loginId");

		int result = 0;
		String returnMsg = "";

		result = mypageService.cartCountChangeJson(cartModel, loginID);

		if (result > 0) {
			returnMsg = "success";
		} else {
			returnMsg = "fail";
		}

		resultmap.put("result", returnMsg);

		return resultmap;
	}

	@PostMapping("productBuy.do")
	@ResponseBody
	public Map<String, Object> productBuy(@RequestBody List<CartModel> list, HttpSession session) {
		logger.info("+ Start " + className + ".cartCountChange");
		logger.info("   - paramMap : " + list);

		Map<String, Object> resultmap = new HashMap<String, Object>();

		String loginID = (String) session.getAttribute("loginId");

		mypageService.productBuy(list, loginID);

		return resultmap;
	}

	@PostMapping("productBuyJson.do")
	@ResponseBody
	public Map<String, Object> productBuyJson(@RequestBody Map<String, Object> list, HttpSession session) {
		logger.info("+ Start " + className + ".cartCountChange");
		logger.info("   - paramMap : " + list);

		Map<String, Object> resultmap = new HashMap<String, Object>();

		String loginID = (String) session.getAttribute("loginId");

		int result = 0;
		String returnMsg = "";

		result = mypageService.productBuyJson(list, loginID);

		if (result > 0) {
			returnMsg = "success";
		} else {
			returnMsg = "fail";
		}

		resultmap.put("result", returnMsg);

		return resultmap;
	}

	@GetMapping("order.do")
	public String order() {

		return "mypage/order";
	}

	@PostMapping("orderHistory.do")
	@ResponseBody
	public ModelAndView orderHistory(@RequestBody OrderModel model, HttpSession session) {
		logger.info("+ Start " + className + ".orderHistory");
		logger.info("model : " + model.toString());

		String loginID = (String) session.getAttribute("loginId");

		ModelAndView mv = new ModelAndView();

		List<OrderModel> result = mypageService.orderHistory(model, loginID);
		int cnt = mypageService.orderHistoryCnt(model, loginID);

		mv.addObject("orderList", result);
		mv.addObject("cnt", cnt);
		mv.setViewName("mypage/orderList");

		return mv;
	}

	@PostMapping("orderHistoryJson.do")
	@ResponseBody
	public Map<String, Object> orderHistoryJson(
			@RequestParam Map<String, Object> paramMap, HttpSession session) {
		logger.info("+ Start " + className + ".orderHistory");
		logger.info("paramMap : " + paramMap);

		Map<String, Object> resultmap = new HashMap<String, Object>();
		String loginID = (String) session.getAttribute("loginId");

		int cpage = Integer.valueOf((String) paramMap.get("cpage"));
		int pageSize = Integer.valueOf((String) paramMap.get("pageSize"));
		String startDate = String.valueOf(paramMap.get("startDate"));
		String endDate = String.valueOf(paramMap.get("endDate"));
		
		OrderModel model = new OrderModel();
		model.setCpage(cpage);
		model.setPageSize(pageSize);
		model.setStartDate(startDate);
		model.setEndDate(endDate);

		List<OrderModel> result = mypageService.orderHistory(model, loginID);
		int cnt = mypageService.orderHistoryCnt(model, loginID);

		resultmap.put("orderList", result);
		resultmap.put("orderCnt", cnt);
		logger.info("resultmap : " + resultmap);

		return resultmap;
	}

	@PostMapping("returnInfo.do")
	@ResponseBody
	public ProductModel returnInfo(@RequestBody ProductModel model) {
		logger.info("+ Start " + className + ".returnInfo");

		return mypageService.returnInfo(model);
	}

	@PostMapping("orderReturn.do")
	@ResponseBody
	public int orderReturn(@RequestBody ReturnModel model) {
		logger.info("+ Start " + className + ".orderReturn");
		logger.info(model);

		int result = mypageService.orderReturn(model);

		return result;
	}

	@GetMapping("return.do")
	public String returnHistory() {
		return "mypage/returnHistory";
	}

	@PostMapping("returnHistory.do")
	@ResponseBody
	public ModelAndView returnHistory(@RequestBody ReturnModel model, HttpSession session) {
		logger.info("+ Start " + className + ".returnHistory");

		ModelAndView mv = new ModelAndView();

		String loginID = (String) session.getAttribute("loginId");

		List<ReturnModel> list = mypageService.returnHistory(model, loginID);
		int cnt = mypageService.returnHistoryCnt(model, loginID);

		mv.addObject("cnt", cnt);
		mv.addObject("list", list);
		mv.setViewName("mypage/returnHistoryList");

		return mv;
	}
	

	@PostMapping("returnHistoryJson.do")
	@ResponseBody
	public Map<String, Object> returnHistoryJson(
			@RequestParam Map<String, Object> paramMap, HttpSession session) {
		logger.info("+ Start " + className + ".returnHistory");
		logger.info("paramMap : " + paramMap);

		Map<String, Object> resultmap = new HashMap<String, Object>();
		String loginID = (String) session.getAttribute("loginId");

		int cpage = Integer.valueOf((String) paramMap.get("cpage"));
		int pageSize = Integer.valueOf((String) paramMap.get("pageSize"));
		String startDate = String.valueOf(paramMap.get("startDate"));
		String endDate = String.valueOf(paramMap.get("endDate"));
		
		ReturnModel model = new ReturnModel();
		model.setCpage(cpage);
		model.setPageSize(pageSize);
		model.setStartDate(startDate);
		model.setEndDate(endDate);

		List<ReturnModel> result = mypageService.returnHistory(model, loginID);
		int cnt = mypageService.returnHistoryCnt(model, loginID);

		resultmap.put("returnList", result);
		resultmap.put("returnCnt", cnt);
		logger.info("resultmap : " + resultmap);

		return resultmap;
	}
	
}


