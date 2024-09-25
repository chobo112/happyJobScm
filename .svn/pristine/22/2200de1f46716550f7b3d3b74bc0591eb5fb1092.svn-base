package kr.happyjob.study.management.controller;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.happyjob.study.management.model.ManagementModel;
import kr.happyjob.study.management.service.ManagementService;

@Controller
@RequestMapping("/management/")
public class ManagementController {

	@Autowired
	ManagementService managementService;

	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());

	// Get class name for logger
	private final String className = this.getClass().toString();

	// 처음 로딩될 때 공지사항 연결
	@RequestMapping("userInfo.do")
	public String userInfo(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {

		logger.info("+ !!!!!~Start~!!! " + className + ".initUserInfo");
		logger.info("   - paramMap : " + paramMap);

		String loginID = (String) session.getAttribute("loginId");
		paramMap.put("loginID", loginID);

		return "management/userInfo";
	}
	
	@RequestMapping("userList.do")
	public String test1(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		logger.info("+ Start " + className + ".initManagement");
		logger.info("   - paramMap : " + paramMap);
		
		int cpage = Integer.valueOf((String) paramMap.get("currentPage"));
		int pageSize = Integer.valueOf((String) paramMap.get("pageSize"));

		int startSeq = (cpage - 1) * pageSize;

		paramMap.put("startSeq", startSeq);
		paramMap.put("pageSize", pageSize);

		List<ManagementModel> userList = managementService.userList(paramMap);
		int userCnt = managementService.userListCnt(paramMap);

		model.addAttribute("user", userList);
		model.addAttribute("userCnt", userCnt);

		return "management/userList";
	}
	
	@RequestMapping("userDetail.do") // 내부 직원 상세 조회
	public String userDetail(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		logger.info("+ Start " + className + ".initManagement");
		logger.info("   - paramMap : " + paramMap);
		
		//int cpage = Integer.valueOf((String) paramMap.get("currentPage"));
		//int pageSize = Integer.valueOf((String) paramMap.get("pageSize"));
		

		//int startSeq = (cpage - 1) * pageSize;

		//paramMap.put("startSeq", startSeq);
		//paramMap.put("pageSize", pageSize);

		List<ManagementModel> userList = managementService.userDetail(paramMap);
		//int userCnt = managementService.userListCnt(paramMap);

		model.addAttribute("user", userList); //여기에 데이터가 담겨서 전달된다. list같은 방식으로 데이터를 추출해서 출력시키면 됨
		//model.addAttribute("userCnt", userCnt);

		return "management/userDetail";
	}

	@RequestMapping("custDetail.do") // 기업 고객 상세 조회
	public String custDetail(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		logger.info("+ Start " + className + ".initManagement");
		logger.info("   - paramMap : " + paramMap);

		List<ManagementModel> userList = managementService.custDetail(paramMap);

		model.addAttribute("user", userList);

		return "management/userDetail";
	}
	
	@RequestMapping("regist.do")
	@ResponseBody
	public Map<String, Object> regist(@RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		logger.info("+ Start " + className + ".noticeSave");
		logger.info("   - paramMap : " + paramMap);

		Map<String, Object> resultMap = new HashMap<String, Object>();
		//String loginId = (String) session.getAttribute("loginId");
		//paramMap.put("loginId", loginId);
		int result = 0;
		String returnMsg = "";

		result = managementService.regist(paramMap);

		if (result > 0) {
			returnMsg = "success";
		} else {
			returnMsg = "fail";
		}

		resultMap.put("result", returnMsg);

		return resultMap;

	}
	
	@RequestMapping("userAjust.do")
	@ResponseBody
	public Map<String, Object> userAjust(@RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		logger.info("+ Start " + className + ".noticeSave");
		logger.info("   - paramMap : " + paramMap);

		Map<String, Object> resultMap = new HashMap<String, Object>();
		int result = 0;
		String returnMsg = "";

		result = managementService.userAjust(paramMap);

		if (result > 0) {
			returnMsg = "success";
		} else {
			returnMsg = "fail";
		}

		resultMap.put("result", returnMsg);

		return resultMap;

	}
	
	@RequestMapping("userDelete.do")
	@ResponseBody
	public Map<String, Object> userDelete(@RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		logger.info("+ Start " + className + ".!!userDelete!!");
		logger.info("   - paramMap : " + paramMap);

		Map<String, Object> resultMap = new HashMap<String, Object>();
		int result = 0;
		String returnMsg = "";

		result = managementService.userDelete(paramMap);

		if (result > 0) {
			returnMsg = "success";
		} else {
			returnMsg = "fail";
		}

		resultMap.put("result", returnMsg);

		return resultMap;
	}
	
	@RequestMapping("userSearch.do")
	public String userSearch(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		logger.info("+ Start " + className + ".initManagement");
		logger.info("   - paramMap : " + paramMap);
		
		int cpage = Integer.valueOf((String) paramMap.get("currentPage"));
		int pageSize = Integer.valueOf((String) paramMap.get("pageSize"));

		int startSeq = (cpage - 1) * pageSize;

		paramMap.put("startSeq", startSeq);
		paramMap.put("pageSize", pageSize);

		List<ManagementModel> userList = managementService.userSearch(paramMap);
		int userCnt = managementService.userListCnt2(paramMap);

		model.addAttribute("user", userList);
		model.addAttribute("userCnt", userCnt);

		return "management/userList";
	}
	
	@RequestMapping("productInfo.do")
	public String productInfo(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {

		logger.info("+ !!!!!~Start~!!! " + className + ".initUserInfo");
		logger.info("   - paramMap : " + paramMap);

		String loginID = (String) session.getAttribute("loginId");
		paramMap.put("loginID", loginID);

		return "management/productInfo";
	}
	
	@RequestMapping("supplyInfo.do")
	public String supplyInfo(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {

		logger.info("+ !!!!!~Start~!!! " + className + ".initUserInfo");
		logger.info("   - paramMap : " + paramMap);

		String loginID = (String) session.getAttribute("loginId");
		paramMap.put("loginID", loginID);

		return "management/supplyInfo";
	}
	
	@RequestMapping("comnCordInfo.do")
	public String comncordInfo(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {

		logger.info("+ !!!!!~Start~!!! " + className + ".initUserInfo");
		logger.info("   - paramMap : " + paramMap);

		String loginID = (String) session.getAttribute("loginId");
		paramMap.put("loginID", loginID);

		return "management/comnCordInfo";
	}
	
	@RequestMapping("supplyList.do")
	public String supplyList(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		logger.info("+ Start " + className + ".supplyList!!!");
		logger.info("   - paramMap : " + paramMap);
		
		int cpage = Integer.valueOf((String) paramMap.get("currentPage"));
		int pageSize = Integer.valueOf((String) paramMap.get("pageSize"));

		int startSeq = (cpage - 1) * pageSize;

		paramMap.put("startSeq", startSeq);
		paramMap.put("pageSize", pageSize);

		List<ManagementModel> supplyList = managementService.supplyList(paramMap);
		int supplyCnt = managementService.supplyListCnt(paramMap);

		model.addAttribute("supply", supplyList);
		model.addAttribute("supplyCnt", supplyCnt);

		return "management/supplyList";
	}
	
	@RequestMapping("custProduct.do")
	public String custProduct(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		logger.info("+ Start " + className + ".custProduct!!!");
		logger.info("   - paramMap : " + paramMap);

		List<ManagementModel> productList = managementService.custProduct(paramMap);
		
		model.addAttribute("productList", productList);

		return "management/custProduct";
	}
	
	@RequestMapping("supplySearch.do")
	public String supplySearch(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		logger.info("+ Start " + className + ".supplySearch!!");
		logger.info("   - paramMap : " + paramMap);
		
		int cpage = Integer.valueOf((String) paramMap.get("currentPage"));
		int pageSize = Integer.valueOf((String) paramMap.get("pageSize"));
		int condition = Integer.valueOf((String) paramMap.get("condition"));

		int startSeq = (cpage - 1) * pageSize;

		paramMap.put("startSeq", startSeq);
		paramMap.put("pageSize", pageSize);
		
		List<ManagementModel> supplyList;
		
		if(condition == 0){
			supplyList = managementService.supplySearch(paramMap);
		}
		else{
			 supplyList = managementService.supplySearch2(paramMap);
		}
		
		int supplyCnt = managementService.supplyListCnt(paramMap);
		

		model.addAttribute("supply", supplyList);
		model.addAttribute("supplyCnt", supplyCnt);

		return "management/supplyList";
	}
	
	@RequestMapping("warehouseInfo.do")
	public String warehouseInfo(Model model, @RequestParam Map<String, Object> paramMap){
		
		logger.info("+ Start " + className + ".warehouseInfo");
		logger.info("   - paramMap : " + paramMap);
		
		return "management/warehouseInfo";
	}
	@RequestMapping("warehouseList.do")
	public String warehouseList(Model model, @RequestParam Map<String, Object> paramMap){
		
		logger.info("+ Start " + className + ".warehouseList");
		logger.info("   - paramMap : " + paramMap);
		
		List<Map<String, Object>> list = managementService.warehouseList(paramMap);
		logger.info("   - list : " + list);
		
		model.addAttribute("list", list);
		
		
		return "management/warehouseList";
	}
	@RequestMapping("newStorageSave.do")
	public String newStorageSave(Model model, @RequestParam Map<String, Object> paramMap){
		
		logger.info("+ Start " + className + ".newStorageSave");
		logger.info("   - paramMap : " + paramMap);
		
		int i = managementService.newStorageSave(paramMap);
		logger.info("   - int i  : " + i);
		
		return "management/warehouseInfo";
	}
	
	@RequestMapping("warehouseDetail.do")
	public String warehouseDetail(Model model, @RequestParam Map<String, Object> paramMap){
		
		logger.info("+ Start " + className + ".warehouseDetail");
		logger.info("   - paramMap : " + paramMap);
		
		List<Map<String, Object>> map = managementService.warehouseDetail(paramMap);
				
		logger.info("   - dd : " + map);
		
		model.addAttribute("list", map);
		
		
		return "management/warehouseDetail";
	}

	@RequestMapping("orderCompany.do")
	public String orderCompany(Model model, @RequestParam Map<String, Object> paramMap){
		
		logger.info("+ Start " + className + ".orderCompany");
		logger.info("   - paramMap : " + paramMap);
	
		
		
		return "management/orderCompany";
	}
	@RequestMapping("orderCompanyList.do")
	public String orderCompanyList(Model model, @RequestParam Map<String, Object> paramMap){
		
		logger.info("+ Start " + className + ".orderCompany");
		logger.info("   - paramMap : " + paramMap);
		
		
		List<Map<String, Object>> list = managementService.orderCompanyList(paramMap);
		logger.info("   - list : " + list);
		
		
		model.addAttribute("list", list);
		
		return "management/orderCompanyList";
	}
	@RequestMapping("newCompanySave.do")
	public String newCompanySave(Model model, @RequestParam Map<String, Object> paramMap){
		
		logger.info("+ Start " + className + ".newCompanySave");
		logger.info("   - paramMap : " + paramMap);
		
		
		int i = managementService.newCompanySave(paramMap);
		logger.info("   - list : " + i);

		
		return "management/orderCompany";
	}

	@RequestMapping("orderComponyDetail.do")
	public String orderComponyDetail(Model model, @RequestParam Map<String, Object> paramMap){
		
		logger.info("+ Start " + className + ".orderComponyDetail");
		logger.info("   - paramMap : " + paramMap);
		
		
		List<Map<String, Object>> list = managementService.orderComponyDetail(paramMap);
		logger.info("   - list : " + list);
		
		model.addAttribute("list", list);
		
		
		return "management/orderComponyDetail";
	}
	@RequestMapping("orderComSelectItem.do")
	public String orderComSelectItem(Model model, @RequestParam Map<String, Object> paramMap){
		
		logger.info("+ Start " + className + ".orderComponyDetail");
		logger.info("   - paramMap : " + paramMap);
		
		
		List<Map<String, Object>> list = managementService.orderComSelectItem(paramMap);
		logger.info("   - list : " + list);
		
		model.addAttribute("select", list);
		
		
		return "management/orderComponyDetail";
	}
	@RequestMapping("newItemSave.do")
	public String newItemSave(Model model, @RequestParam Map<String, Object> paramMap){
		
		logger.info("+ Start " + className + ".newItemSave");
		logger.info("   - paramMap : " + paramMap);
		
		
		managementService.newItemSave(paramMap);
		
		
		return "management/orderComponyDetail";
	}

	@RequestMapping("getCodeList.do")
	public String getCodeList(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		logger.info("+ Start " + className + ".getCodeList!!!");
		logger.info("   - paramMap : " + paramMap);
		
		int cpage = Integer.valueOf((String) paramMap.get("currentPage"));
		int pageSize = Integer.valueOf((String) paramMap.get("pageSize"));

		int startSeq = (cpage - 1) * pageSize;

		paramMap.put("startSeq", startSeq);
		paramMap.put("pageSize", pageSize);

		List<ManagementModel> codeList = managementService.getCodeList(paramMap);
		int codeCnt = managementService.codeCnt(paramMap);

		model.addAttribute("codeList", codeList);
		model.addAttribute("codeCnt", codeCnt);

		return "management/codeView";
	}
	
	@RequestMapping("getDetailCodeList.do")
	public String getDetailCodeList(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		logger.info("+ Start " + className + ".getDetailCodeList!!!");
		logger.info("   - paramMap : " + paramMap);
		
		//int cpage = Integer.valueOf((String) paramMap.get("currentPage"));
		//int pageSize = Integer.valueOf((String) paramMap.get("pageSize"));

		//int startSeq = (cpage - 1) * pageSize;

		//paramMap.put("startSeq", startSeq);
		//paramMap.put("pageSize", pageSize);

		List<ManagementModel> codeList = managementService.getDetailCodeList(paramMap);
		int codeCnt = managementService.codeCnt(paramMap);

		model.addAttribute("codeList", codeList);
		model.addAttribute("codeCnt", codeCnt);

		return "management/detailCodeView";
	}
	
	@RequestMapping("comCodeAdjust.do")
	@ResponseBody
	public Map<String, Object> comCodeAdjust(@RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		logger.info("+ Start " + className + ".comCodeAdjust");
		logger.info("   - paramMap : " + paramMap);

		Map<String, Object> resultMap = new HashMap<String, Object>();
		int result = 0;
		String returnMsg = "";

		result = managementService.comCodeAdjust(paramMap);

		if (result > 0) {
			returnMsg = "success";
		} else {
			returnMsg = "fail";
		}

		resultMap.put("result", returnMsg);

		return resultMap;

	}
	
	@RequestMapping("comDetailCodeAdjust.do")
	@ResponseBody
	public Map<String, Object> comDetailCodeAdjust(@RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		logger.info("+ Start " + className + ".comDetailCodeAdjust");
		logger.info("   - paramMap : " + paramMap);

		Map<String, Object> resultMap = new HashMap<String, Object>();
		int result = 0;
		String returnMsg = "";

		result = managementService.comDetailCodeAdjust(paramMap);

		if (result > 0) {
			returnMsg = "success";
		} else {
			returnMsg = "fail";
		}

		resultMap.put("result", returnMsg);

		return resultMap;
	}
	
	@RequestMapping("comCodeRegist.do")
	@ResponseBody
	public Map<String, Object> comCodeRegist(@RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		logger.info("+ Start " + className + ".comCodeRegist");
		logger.info("   - paramMap : " + paramMap);

		Map<String, Object> resultMap = new HashMap<String, Object>();
		String loginId = (String) session.getAttribute("loginId");
		paramMap.put("loginId", loginId);
		int result = 0;
		String returnMsg = "";

		result = managementService.comCodeRegist(paramMap);

		if (result > 0) {
			returnMsg = "success";
		} else {
			returnMsg = "fail";
		}

		resultMap.put("result", returnMsg);

		return resultMap;
	}
	
	@RequestMapping("comDetailCodeRegist.do")
	@ResponseBody
	public Map<String, Object> comDetailCodeRegist(@RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		logger.info("+ Start " + className + ".comDetailCodeRegist");
		logger.info("   - paramMap : " + paramMap);

		Map<String, Object> resultMap = new HashMap<String, Object>();
		String loginId = (String) session.getAttribute("loginId");
		paramMap.put("loginId", loginId);
		int result = 0;
		String returnMsg = "";

		result = managementService.comDetailCodeRegist(paramMap);

		if (result > 0) {
			returnMsg = "success";
		} else {
			returnMsg = "fail";
		}

		resultMap.put("result", returnMsg);

		return resultMap;
	}
	
	@RequestMapping("comCodeDelete.do")
	@ResponseBody
	public Map<String, Object> comCodeDelete(@RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		logger.info("+ Start " + className + ".comCodeDelete");
		logger.info("   - paramMap : " + paramMap);

		Map<String, Object> resultMap = new HashMap<String, Object>();
		//String loginId = (String) session.getAttribute("loginId");
		//paramMap.put("loginId", loginId);
		int result = 0;
		String returnMsg = "";

		result = managementService.comCodeDelete(paramMap);

		if (result > 0) {
			returnMsg = "success";
		} else {
			returnMsg = "fail";
		}

		resultMap.put("result", returnMsg);

		return resultMap;
	}
	
	@RequestMapping("comDetailCodeDelete.do")
	@ResponseBody
	public Map<String, Object> comDetailCodeDelete(@RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		logger.info("+ Start " + className + ".comDetailCodeDelete");
		logger.info("   - paramMap : " + paramMap);

		Map<String, Object> resultMap = new HashMap<String, Object>();
		//String loginId = (String) session.getAttribute("loginId");
		//paramMap.put("loginId", loginId);
		int result = 0;
		String returnMsg = "";

		result = managementService.comDetailCodeDelete(paramMap);

		if (result > 0) {
			returnMsg = "success";
		} else {
			returnMsg = "fail";
		}

		resultMap.put("result", returnMsg);

		return resultMap;
	}
	
	@RequestMapping("comnCodeSearch.do")
	public String comnCodeSearch(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		logger.info("+ Start " + className + ".comnCodeSearch!!");
		logger.info("   - paramMap : " + paramMap);
		
		int cpage = Integer.valueOf((String) paramMap.get("currentPage"));
		int pageSize = Integer.valueOf((String) paramMap.get("pageSize"));
		int condition = Integer.valueOf((String) paramMap.get("condition"));

		int startSeq = (cpage - 1) * pageSize;

		paramMap.put("startSeq", startSeq);
		paramMap.put("pageSize", pageSize);
		
		List<ManagementModel> codeList;
	
		if(condition == 0){
			codeList = managementService.comnCodeSearch(paramMap);
		}
		else if(condition == 1){
			codeList = managementService.comnCodeSearch2(paramMap);
		}
		else {
			codeList = managementService.comnCodeSearch3(paramMap);
		}
		
		int codeCnt = managementService.codeCnt(paramMap);
		

		model.addAttribute("codeList", codeList);
		model.addAttribute("codeCnt", codeCnt);

		return "management/codeView";
	}
	
	@RequestMapping("getProductList.do")
	public String getProductList(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		logger.info("+ Start " + className + ".getProductList!!!");
		logger.info("   - paramMap : " + paramMap);
		
		int cpage = Integer.valueOf((String) paramMap.get("currentPage"));
		int pageSize = Integer.valueOf((String) paramMap.get("pageSize"));

		int startSeq = (cpage - 1) * pageSize;

		paramMap.put("startSeq", startSeq);
		paramMap.put("pageSize", pageSize);

		List<ManagementModel> productList = managementService.getProductList(paramMap);
		int productCnt = managementService.productCnt(paramMap);

		model.addAttribute("productList", productList);
		model.addAttribute("productCnt", productCnt);

		return "management/productList";
	}
	
	@RequestMapping("getDetailProductList.do")
	public String getDetailProductList(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		logger.info("+ Start " + className + ".getDetailProductList!!!");
		logger.info("   - paramMap : " + paramMap);

		List<ManagementModel> productList = managementService.getDetailProductList(paramMap);

		model.addAttribute("productList", productList);

		return "management/getDetailProductList";
	}
	
	@RequestMapping("productSearch.do")
	public String productSearch(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		logger.info("+ Start " + className + ".productSearch!!");
		logger.info("   - paramMap : " + paramMap);
		
		int cpage = Integer.valueOf((String) paramMap.get("currentPage"));
		int pageSize = Integer.valueOf((String) paramMap.get("pageSize"));
		int condition = Integer.valueOf((String) paramMap.get("condition"));

		int startSeq = (cpage - 1) * pageSize;

		paramMap.put("startSeq", startSeq);
		paramMap.put("pageSize", pageSize);
	

		List<ManagementModel> productList = managementService.productSearch(paramMap);
		int productCnt = managementService.productCnt(paramMap);
		

		model.addAttribute("productList", productList);
		model.addAttribute("productCnt", productCnt);

		return "management/productList";
	}
	
	@RequestMapping("productRegist.do")
	@ResponseBody
	public Map<String, Object> productRegist(@RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		logger.info("+ Start " + className + ".productRegist");
		logger.info("   - paramMap : " + paramMap);

		Map<String, Object> resultMap = new HashMap<String, Object>();
		int result = 0;
		String returnMsg = "";

		result = managementService.productRegist(paramMap);

		if (result > 0) {
			returnMsg = "success";
		} else {
			returnMsg = "fail";
		}

		resultMap.put("result", returnMsg);

		return resultMap;
	}
	
	@RequestMapping("productUpdate.do")
	@ResponseBody
	public Map<String, Object> productUpdate(@RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		logger.info("+ Start " + className + ".productUpdate");
		logger.info("   - paramMap : " + paramMap);

		Map<String, Object> resultMap = new HashMap<String, Object>();
		int result = 0;
		String returnMsg = "";

		result = managementService.productUpdate(paramMap);

		if (result > 0) {
			returnMsg = "success";
		} else {
			returnMsg = "fail";
		}

		resultMap.put("result", returnMsg);

		return resultMap;
	}
	
	@RequestMapping("productDelete.do")
	@ResponseBody
	public Map<String, Object> productDelete(@RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		logger.info("+ Start " + className + ".productDelete");
		logger.info("   - paramMap : " + paramMap);

		Map<String, Object> resultMap = new HashMap<String, Object>();
		int result = 0;
		String returnMsg = "";

		result = managementService.productDelete(paramMap);

		if (result > 0) {
			returnMsg = "success";
		} else {
			returnMsg = "fail";
		}

		resultMap.put("result", returnMsg);

		return resultMap;
	}

}