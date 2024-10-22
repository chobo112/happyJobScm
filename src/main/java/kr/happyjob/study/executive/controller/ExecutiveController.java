package kr.happyjob.study.executive.controller;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.happyjob.study.executive.model.StorageDetailModel;
import kr.happyjob.study.executive.service.ExecutiveService;

@Controller
@RequestMapping("/executives/")
public class ExecutiveController {
	
	private final Logger logger = LogManager.getLogger(this.getClass());

	// Get class name for logger
	private final String className = this.getClass().toString();
	
	@Autowired ExecutiveService executiveService;
	
	@RequestMapping("storage.do")
	public String storage(){
		
		logger.info("+ Start " + className + ".main");
		logger.info("   - paramMap : " + "");
		
		return "executives/storageList";
	}
	
	@RequestMapping("storageList.do")
	public String storageList(Model model, @RequestParam Map<String, Object> paramMap){
		
		logger.info("+ Start " + className + ".main");
		logger.info("   - paramMap : " + paramMap);
		
		List<Map<String, Object>> list = executiveService.storageAll(paramMap);
		
		logger.info("   - list : " + list);
		
				
		model.addAttribute("list", list);
		
		return "executives/storage";
	}
	
	@RequestMapping("storageDetail.do")
	public String storageDetail(Model model, @RequestParam Map<String, Object> paramMap){
		
		logger.info("+ Start " + className + ".storageDetail");
		logger.info("   - paramMap : " + paramMap);
		//Map<String, Object> resultMap = new HashMap<String, Object>();
		
		List<Map<String, Object>> map = executiveService.storageDetail(paramMap);
				
		logger.info("   - dd : " + map);
		
		model.addAttribute("list", map);
		
		//resultMap.put("detail", map);
		
		return "executives/storageDetail";
		
	}
	
	@RequestMapping("sales.do")
	public String sales(){
		
		logger.info("+ Start " + className + ".sales");
		logger.info("   - paramMap : " + "");
	
		return "executives/sales";
		
	}
	
	@RequestMapping("salesList.do")
	public String salesList(Model model, @RequestParam Map<String, Object> paramMap){
		
		logger.info("+ Start " + className + ".salesList");
		logger.info("   - paramMap : " + paramMap);
		
		int cpage = Integer.valueOf((String) paramMap.get("currentPage"));
		int pageSize = Integer.valueOf((String) paramMap.get("pageSize"));

		int startSeq = (cpage - 1) * pageSize;

		paramMap.put("startSeq", startSeq);
		paramMap.put("pageSize", pageSize);
		
		List<Map<String, Object>> list = executiveService.salesList(paramMap);
		int salesPage = executiveService.salesPage(paramMap);
		
		logger.info("   - list : " + list);
		logger.info("   - salesPage : " + salesPage);
				
		model.addAttribute("list", list);
		model.addAttribute("salesPage", salesPage);
		
		
		return "executives/salesList";
	}
	
	@RequestMapping("salesListJson.do")
	@ResponseBody
	public Map<String, Object> salesListJson( @RequestParam Map<String, Object> paramMap){
		
		logger.info("+ Start " + className + ".salesList");
		logger.info("   - paramMap : " + paramMap);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		int cpage = Integer.valueOf((String) paramMap.get("cpage"));
		int pageSize = Integer.valueOf((String) paramMap.get("pageSize"));
		
		int startSeq = (cpage - 1) * pageSize;
		
		paramMap.put("startSeq", startSeq);
		paramMap.put("pageSize", pageSize);
		
		//서버 String(래퍼 클래스) => DB 데이터 타입 int
		List<Map<String, Object>> list = executiveService.salesList(paramMap);
		int salesPage = executiveService.salesPage(paramMap);
		
		resultMap.put("list", list);
		resultMap.put("salesPage", salesPage);
		
		logger.info("   - list : " + list);

		logger.info("   - salesPage : " + salesPage);
		
		return resultMap;
	}
	
	@RequestMapping("salesTop.do")
	public String salesTop(Model model, @RequestParam Map<String, Object> paramMap){
		
		logger.info("+ Start " + className + ".salesTop");
		logger.info("   - paramMap : " + paramMap);
		
		
		return "executives/salesTop";
	}
	
	@RequestMapping("salesTopList.do")
	public String salesTopList(Model model, @RequestParam Map<String, Object> paramMap){
		
		logger.info("+ Start " + className + ".salesTopList");
		logger.info("   - paramMap : " + paramMap);
		
		List<Map<String, Object>> list = executiveService.salesTop(paramMap);
		
		model.addAttribute("list", list);
		
		return "executives/salesTopList";
	}
	

	@RequestMapping("salesTopListJsonVue.do")
	@ResponseBody
	public Map<String, Object> salesTopListJsonVue(@RequestParam Map<String, Object> paramMap){
		
		logger.info("+ Start " + className + ".salesTopList");
		
		logger.info(" @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@" );
		logger.info("   - paramMap : " + paramMap);
		logger.info(" @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@" );
		
		Map<String, Object> resultMap = new HashMap<String, Object>();

		List<Map<String, Object>> list = executiveService.salesTop(paramMap);
		
		resultMap.put("list", list);
		
		logger.info("   - list : " + list);
		
		return resultMap;
		
	}
	
	@RequestMapping("salesTopListJson.do")
	@ResponseBody
	public Map<String, Object> salesTopListJson(@RequestBody Map<String, Object> paramMap){
		
		logger.info("+ Start " + className + ".salesTopList");
		
		logger.info(" @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@" );
		logger.info("   - paramMap : " + paramMap);
		logger.info(" @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@" );
		
		Map<String, Object> resultMap = new HashMap<String, Object>();

		List<Map<String, Object>> list = executiveService.salesTop(paramMap);
		
		resultMap.put("list", list);
		
		logger.info("   - list : " + list);
		
		return resultMap;
		
	}
	
	
	@RequestMapping("approval.do")
	public String approval(Model model, @RequestParam Map<String, Object> paramMap){
		
		logger.info("+ Start " + className + ".approval");
		logger.info("   - paramMap : " + paramMap);
		
		
		return "executives/approval";
	}
	
	@RequestMapping("orderApproval.do")
	public String orderApproval(Model model, @RequestParam Map<String, Object> paramMap){
		
		logger.info("+ Start " + className + ".orderApproval");
		logger.info("   - paramMap : " + paramMap);
		
		int cpage = Integer.valueOf((String) paramMap.get("currentPage"));
		int pageSize = Integer.valueOf((String) paramMap.get("pageSize"));

		int startSeq = (cpage - 1) * pageSize;

		paramMap.put("startSeq", startSeq);
		paramMap.put("pageSize", pageSize);
		
		List<Map<String, Object>> approvalY = executiveService.orderApprovalY(paramMap);
		List<Map<String, Object>> approvalN = executiveService.orderApprovalN(paramMap);
		
		int orderAppPage = executiveService.orderAppPage(paramMap);
		logger.info("     orderAppPage" + orderAppPage);
		
		model.addAttribute("orderAppPage", orderAppPage);
		if(approvalY != null){			
			model.addAttribute("Y", approvalY);
		}
		
		if(approvalN != null){
			model.addAttribute("N", approvalN);			
		}
		
		return "executives/orderApproval";
	}
	@RequestMapping("returnApproval.do")
	public String returnApproval(Model model, @RequestParam Map<String, Object> paramMap){
		
		logger.info("+ Start " + className + ".returnApproval");
		logger.info("   - paramMap : " + paramMap);
		
		int cpage = Integer.valueOf((String) paramMap.get("currentPage"));
		int pageSize = Integer.valueOf((String) paramMap.get("pageSize"));

		int startSeq = (cpage - 1) * pageSize;

		paramMap.put("startSeq", startSeq);
		paramMap.put("pageSize", pageSize);
		
		List<Map<String, Object>> approvalY = executiveService.returnApprovalY(paramMap);
		List<Map<String, Object>> approvalN = executiveService.returnApprovalN(paramMap);
		
		int returnAppPage = executiveService.returnAppPage(paramMap);
		logger.info("     returnAppPage    " + returnAppPage);
		
		model.addAttribute("returnAppPage", returnAppPage);
		
		if(approvalY != null){			
			model.addAttribute("Y", approvalY);
		}
		
		if(approvalN != null){
			model.addAttribute("N", approvalN);			
		}
		
		return "executives/returnApproval";
	}
	
	@RequestMapping("approvalY.do")
	public String approvalY(Model model, @RequestParam Map<String, Object> paramMap){
		
		logger.info("+ Start " + className + ".approvalY");
		logger.info("   - paramMap : " + paramMap);
		
		
		executiveService.approvalY(paramMap);
		
		
		return "executives/approval";
	}
	
	@RequestMapping("PandL.do")
	public String PL(Model model, @RequestParam Map<String, Object> paramMap){
		
		logger.info("+ Start " + className + ".P&L");
		logger.info("   - paramMap : " + paramMap);
				
		return "executives/pl";
	}
	
	@RequestMapping("chart.do")
	@ResponseBody
	public List<Map<String, Object>> chart(@RequestParam Map<String, Object> paramMap){
		logger.info("+ Start " + className + ".noticeSave");
		logger.info("   - paramMap : " + paramMap);

		List<Map<String,Object>> list = executiveService.chart(paramMap);
		logger.info("list :       " + list);

		return list;
	}
	
	// 창고 목록
	@RequestMapping("storageListJson.do")
	@ResponseBody
	public Map<String , Object> storageListJson(Model model, @RequestBody Map<String, Object> paramMap){
		
		logger.info("+ Start " + className + ".storageListJson");
		logger.info("   - paramMap : " + paramMap);
		
		List<Map<String, Object>> list = executiveService.storageAll(paramMap);
		
		logger.info("   - list : " + list);
		
		Map<String , Object> resultMap = new HashMap<String, Object>();
		resultMap.put("storageList", list);
		
		return resultMap;
	}
	
	// 창고 상세
	@RequestMapping("storageDetailJson.do")
	@ResponseBody
	public Map<String , Object> storageDetailJson(Model model, @RequestBody Map<String, Object> paramMap){
		
		logger.info("+ Start " + className + ".storageDetailJson");
		logger.info("   - paramMap : " + paramMap);
		
		List<StorageDetailModel> storageDetailList = executiveService.storageDetailJson(paramMap);
		logger.info("   - dd : " + storageDetailList);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();	
		
		// model.addAttribute("list", map);
		resultMap.put("storageDetailList", storageDetailList);
		
		return resultMap;
		
	}
	
	// 발주 승인 리스트
	@RequestMapping("orderApprovalJson")
	@ResponseBody
	public Map<String, Object> orderApprovalJson(Model model, @RequestParam Map<String, Object> paramMap) throws Exception {
		logger.info("+ Start " + className + ".orderApprovalJson");
		logger.info("   - paramMap : " + paramMap);

		Map<String, Object> resultMap = new HashMap<>();

		int cpage = Integer.valueOf((String) paramMap.get("cpage"));
		int pageSize = Integer.valueOf((String) paramMap.get("pageSize"));

		int startSeq = (cpage - 1) * pageSize;

		paramMap.put("startSeq", startSeq);
		paramMap.put("pageSize", pageSize);
				
		List<Map<String, Object>> orderList = executiveService.orderApprovalAll(paramMap);
		
		int orderListCnt = executiveService.orderListCnt(paramMap);
		logger.info("     orderListCount: " + orderListCnt);
		
		resultMap.put("orderListCount", orderListCnt);
		
		resultMap.put("orderList", orderList);
		
		return resultMap;
	}
	
	// 반품 입금 승인 리스트
	@RequestMapping("returnApprovalJson")
	@ResponseBody
	public Map<String, Object> returnApprovalJson(Model model, @RequestParam Map<String, Object> paramMap) throws Exception {
		
		logger.info("+ Start " + className + ".returnApprovalJson");
		logger.info("   - paramMap : " + paramMap);
		
		int cpage = Integer.valueOf((String) paramMap.get("cpage"));
		int pageSize = Integer.valueOf((String) paramMap.get("pageSize"));

		int startSeq = (cpage - 1) * pageSize;

		paramMap.put("startSeq", startSeq);
		paramMap.put("pageSize", pageSize);
		
		Map<String, Object> resultMap = new HashMap<>();
		
		List<Map<String, Object>> returnList = executiveService.returnApprovalAll(paramMap);
		
		int returnListCnt = executiveService.returnListCnt(paramMap);
		logger.info("     returnListCount: " + returnListCnt);
				
		resultMap.put("returnListCount", returnListCnt);
		
		resultMap.put("returnList", returnList);
		
		return resultMap;
	}
	
	// 승인여부
	@RequestMapping("approvalYJson")
	@ResponseBody
	public Map<String, Object> approvalYJson(@RequestParam Map<String, Object> paramMap) throws Exception {
		logger.info("+ Start " + className + ".approvalYJson");
		logger.info("   - paramMap : " + paramMap);

		Map<String, Object> resultMap = new HashMap<String, Object>();
		int result = executiveService.approvalYJson(paramMap);
		String returnMsg = "";

		if (result > 0) {
			returnMsg = "success";
		} else {
			returnMsg = "fail";
		}

		resultMap.put("result", returnMsg);

		return resultMap;
	}
	
}
