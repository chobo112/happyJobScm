package kr.happyjob.study.business.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.happyjob.study.business.service.BusinessService;

@Controller
@RequestMapping("/business/")
public class BusinessController {
	   // Set logger
	   private final Logger logger = LogManager.getLogger(this.getClass());

	   // Get class name for logger
	   private final String className = this.getClass().toString();
	   
	   @Autowired
	   private BusinessService businessService;

	   //거래내역 -> 수주내역화면 show
		@RequestMapping("obtain.do")//url똑같이했음 페이지랑
		public String obtainBusiness(){
			logger.info("거래내역 : 수주내역 폼 이동"+className);
			
			return "business/obtain";
		}
		
		
		//거래내역 => 수주내역 => 수주리스트 현황 DB->url이동화면
		@RequestMapping("obtainList.do")
		public String obtainList(Model model, @RequestParam Map<String, Object> paramMap){
			
			logger.info("+ Start " + className);
			logger.info("   - paramMap : " + paramMap);
			
			//페이징
			int cpage = Integer.valueOf((String) paramMap.get("currentPage"));
			int pageSize = Integer.valueOf((String) paramMap.get("pageSize"));
			int startSeq = (cpage - 1) * pageSize;
			paramMap.put("startSeq", startSeq);
			paramMap.put("pageSize", pageSize);
			int obtainListCnt = businessService.obtainListCnt(paramMap);
			model.addAttribute("obtainListCnt", obtainListCnt);
			
			
			List<Map<String, Object>> obtainList = businessService.businessObtainList(paramMap);
			
			logger.info("크기 : " + obtainList.size());
			
			logger.info("   - obtainList(전체현황+검색) : " + obtainList);
			
			model.addAttribute("obtainList", obtainList);
			
			
			return "business/obtainList";
		}
		
		
		//거래내역 => 수주내역 => 배송지시서 모달에서 배달원 전체조회
		@RequestMapping("deliveryMan.do")
		@ResponseBody
		public List<Map<String, Object>> deliveryMan(Model model, @RequestParam Map<String, Object> paramMap) {
		    logger.info("+ Start " + className + ".deliveryMan");
		    logger.info("   -  paramMap : " + paramMap);
		    
		    List<Map<String, Object>> deliveryManList = businessService.businessdeliveryManList(paramMap);
		    logger.info("   - deliveryManList : " + deliveryManList);
		    
		    return deliveryManList;
		}
		
		
		//거래내역 => 수주내역 => 배송지시서 모달에서 창고조회(item_code가 있는)
		@RequestMapping("findStorage.do")
		@ResponseBody
		public List<Map<String, Object>> getStorage(Model model, 
													@RequestBody Map<String, Object> paramMap
													) {
			//@RequestParam("Storage_item_code") String itemCode
		    logger.info("+ Start " + className + ".getStorageList");
		    logger.info("   - paramMap : " + paramMap);
		    
		    //파라미터 넣어서 그릇 던져주자
	        //paramMap.put("Storage_item_code", itemCode);
		    
		    List<Map<String, Object>> getStorageList = businessService.getStorageListList(paramMap);
		    logger.info("   - getStorageList : " + getStorageList);
		    
		    return getStorageList;
		}
		
		
		
		//거러내역 => 수주내역 => 배송지시서 작성버튼 누르게 되면 상태값 0,1 비교 cf) => 들어간 배송테이블의 pk시퀀스도 select
		@RequestMapping("findstatus.do")
		@ResponseBody
		public Map<String, Object> findStatus(@RequestBody Map<String, Object> paramMap) {
			//@RequestParam("Storage_item_code") String itemCode
		    logger.info("+ @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@Start " + className + ".findStatus");
		    logger.info("   - paramMap : " + paramMap);
		    Integer findStatus = businessService.findInsertOrUpdateCnt(paramMap);
		    logger.info("   - @@@@@@@@@@@@@@@@@@@findStatus  : " + findStatus);

		    Map<String, Object> map = new HashMap<>();
		    if ((int) findStatus == 1) {
		    	//1인경우에 맵 자체 반환해서 꺼내서 쓰자
		    	map = businessService.selectDelivery(paramMap);
		    	logger.info("   - 11111111111111111111@#@#@#@#@#@#@#@#@#@#@#@##@#@map  : " + map);
		    	return map;
		    }else {
		    	//0일때 상태값 0, 1 반환
		    	map.put("status", findStatus);
		    	logger.info("   - 0000000000000000000000000000@#@#@#@#@#@#@#@#@#@#@#@##@#@map  : " + map);

		    	return map; 
		    }
		    
		    
		}
		
		
		//배송지시서 작성하기
		@RequestMapping("deliveryInsert.do")
		@ResponseBody
		public Integer InsertDelivery(@RequestBody Map<String, Object> paramMap) {
			//@RequestParam("Storage_item_code") String itemCode
		    logger.info("+ Start " + className + ".InsertDelivery");
		    logger.info("   - paramMap : " + paramMap);
		    //session.get
		    Integer InsertDelivery = businessService.deliveryInsert(paramMap);
		    logger.info("   - InsertDelivery : " + InsertDelivery);
		    //return InsertDelivery;
		    return InsertDelivery;
		}
		
		
		//거래내역 => 수주내역 => 배송지시서 수정 버튼 클릭시(배송지시서 => 수정)
		@RequestMapping("deliveryUpdate.do")
		@ResponseBody
		  public Integer deliveryUpdate(@RequestBody Map<String, Object> paramMap) {
			  logger.info("+ Start " + className + ".InsertDelivery");
			  logger.info("   - paramMap : " + paramMap);
			  //1번 조회해서 백틱에 데이터 넣어주기(ajax)
		      Integer  deliveryModelUpdate = businessService.updateDeliveryModal(paramMap);
			  logger.info(" businessService.updateDeliveryModal : => " + deliveryModelUpdate);
		      // 응답 데이터 구성

		      return deliveryModelUpdate;
		  }
		
		
		//거래내역 => 수주내역 모달 밑에 데이터 붙여주고 update  => 혹시 시간 남으면 데이터들 많이 띄워주기 위해서 listMap구조로 변경하려고
		@RequestMapping("deliverySelectUpdate.do")
		@ResponseBody
		  public List<Map<String, Object>> deliverySelectUpdate(@RequestBody Map<String, Object> paramMap) {
			  logger.info("+Start " + className + ".InsertDelivery");
			  logger.info("   -paramMap : " + paramMap);
		        
			  //1번 조회해서 백틱에 데이터 넣어주기(ajax)
			  List<Map<String, Object>> deliveryReModelupSelect = businessService.getDeliveryReModalSelect(paramMap);
			  logger.info("controller(deliveryModelupSelect) => " + deliveryReModelupSelect);

		      return deliveryReModelupSelect;
		  }

		
		
		
		
		
		
		
		   //거래내역 -> 발주내역
			@RequestMapping("order.do")//url똑같이했음 페이지랑
			public String orderBusiness(){
				logger.info("거래내역 : 발주내역 폼 이동"+className);
				
				return "business/order";
			}

			
			
			//거래내역 => 발리스트 현황 DB->url이동화면
			@RequestMapping("orderList.do")
			public String orderList(Model model, @RequestParam Map<String, Object> paramMap){
				
				logger.info("+ Start " + className );
				logger.info("   - paramMap : " + paramMap);
				
				int cpage = Integer.valueOf((String) paramMap.get("currentPage"));
				int pageSize = Integer.valueOf((String) paramMap.get("pageSize"));
				int startSeq = (cpage - 1) * pageSize;
				paramMap.put("startSeq", startSeq);
				paramMap.put("pageSize", pageSize);
				
				int orderListCnt = businessService.orderListCnt(paramMap);
				
				List<Map<String, Object>> orderList = businessService.businessorderList(paramMap);

				logger.info("크기 : " + orderList.size());
				
				model.addAttribute("orderListCnt", orderListCnt);
				model.addAttribute("orderList", orderList);
				
				return "business/orderList";
			}
			
			// orderListJson.do for react
			@RequestMapping("orderListJson.do")
			@ResponseBody
			public Map<String, Object>  orderListJson(@RequestParam Map<String, Object> paramMap){
				
				logger.info("+ Start " + className );
				logger.info("   - paramMap : " + paramMap);
				
				Map<String, Object> resultMap = new HashMap<>();

				int cpage = Integer.valueOf((String) paramMap.get("cpage"));
				int pageSize = Integer.valueOf((String) paramMap.get("pageSize"));

				int startSeq = (cpage - 1) * pageSize;
				
				paramMap.put("startSeq", startSeq);
				paramMap.put("pageSize", pageSize);
				
				List<Map<String, Object>> orderList = businessService.businessorderList(paramMap);
				int orderListCnt = businessService.orderListCnt(paramMap);
				logger.info("크기 : " + orderList.size());
				
				resultMap.put("orderList", orderList);
				resultMap.put("orderListCnt", orderListCnt);
				
				//model.addAttribute("orderList", orderList);
				
				return resultMap;
			}
			
			@RequestMapping("orderDetailJson.do")
			@ResponseBody
			public Map<String, Object>  orderDetailJson(@RequestParam Map<String, Object> paramMap){
				
				logger.info("+ Start " + className );
				logger.info("   - paramMap : " + paramMap);
				
				Map<String, Object> resultMap = new HashMap<>();

				int cpage = Integer.valueOf((String) paramMap.get("cpage"));
				int pageSize = Integer.valueOf((String) paramMap.get("pageSize"));

				int startSeq = (cpage - 1) * pageSize;
				
				paramMap.put("startSeq", startSeq);
				paramMap.put("pageSize", pageSize);
				
				List<Map<String, Object>> orderList = businessService.businessorderList(paramMap);
				int orderListCnt = businessService.orderListCnt(paramMap);
				logger.info("크기 : " + orderList.size());
				
				resultMap.put("orderList", orderList);
				resultMap.put("orderListCnt", orderListCnt);
				
				return resultMap;
			}
			
			//거래내역 => 발주내역 => 발주회사 찾기 (item_code가 있는)
			@RequestMapping("findOrderCompany.do")
			@ResponseBody
			public List<Map<String, Object>> getOrderCompnay(Model model, 
														@RequestBody Map<String, Object> paramMap
														) {
				//@RequestParam("Storage_item_code") String itemCode
			    logger.info("+ Start " + className + ".getStorageList");
			    logger.info("   - paramMap : " + paramMap);
			    
			    //파라미터 넣어서 그릇 던져주자
		        //paramMap.put("Storage_item_code", itemCode);
			    
			    List<Map<String, Object>> OrderCompnayList = businessService.getOrderCompnay(paramMap);
			    logger.info("   - getOrderCompnay : " + OrderCompnayList);
			    
			    return OrderCompnayList;
			}
			
			
			
			
			//발주지시서 작성하기
			@RequestMapping("OrderInsert.do")
			@ResponseBody
			public Integer InsertOrder(@RequestBody Map<String, Object> paramMap) {
				//@RequestParam("Storage_item_code") String itemCode
			    logger.info("+ Start " + className + "OrderInsert");
			    logger.info("   - paramMap : " + paramMap);
			    //session.get
			    Integer InsertOrder = businessService.insertOrder(paramMap);
			    logger.info("   - InsertDelivery : " + InsertOrder);
			    //return InsertDelivery;
			    
			    return InsertOrder;
			}
			
			
			//발주모달버튼 클릭시에 insert인지, update인지 비교
			@RequestMapping("findOrderStatus.do")
			@ResponseBody
			public Integer findOrderStatus(@RequestBody Map<String, Object> paramMap) {
				//@RequestParam("Storage_item_code") String itemCode
			    logger.info("+ Start " + className);
			    logger.info("   -paramMap : " + paramMap);
			    Integer findOrderStatus = businessService.getOrderStatus(paramMap);
			    logger.info("   - findStatus  : " + findOrderStatus);
			   
			    return findOrderStatus; //0아니면 1이 조회가 되어야 하는데..??
			}

			
			
		//아래부터는 반품관련
		//반품내역현황
	    @RequestMapping("/return.do")
	    public String returnBusiness() {
	        logger.info("거래내역 : 반품내역 컨트롤러");
	        return "business/return"; // 반품내역 페이지 경로
	    }
	    
	    //거래내역 => 반품내역 조회
		@RequestMapping("returnList.do")
		public String returnList(Model model, @RequestParam Map<String, Object> paramMap,
								 HttpServletRequest request,	HttpServletResponse response){
			logger.info("+ Start " + className + ".directionReturnList");
			logger.info("   - paramMap : " + paramMap);
			
			
			
			
			List<Map<String, Object>> returnList = businessService.businessreturnList(paramMap);
			
			logger.info(" returnList크기 : " + returnList.size());
			logger.info("   - returnList(반품내역+검색) : " + returnList);
			
			model.addAttribute("returnList", returnList);
			
			
			
			return "business/returnList";
		}
		
		//거래내역 => 반품내역 => 배송지시서 작성 시에 insert 인지, update인지 비교..0,1
		@RequestMapping("return_findstatusn.do")
		@ResponseBody
		public Integer findstatus_Return(@RequestBody Map<String, Object> paramMap) {
			//@RequestParam("Storage_item_code") String itemCode
		    logger.info("+ Start!!!!!!!!findstatus_Return!!!!!!!!!!!!! " + className + ".findStatus");
		    logger.info("   - !!!!!!!!!!!!!!!!!paramMap : " + paramMap);
		    Integer findStatusRe = businessService.Order_findstatus(paramMap);
		    logger.info("   - !!!!!!!!findstatus_Return!!!!!!!!!!반품상태 0 or 1  : " + findStatusRe);
		   
		    return findStatusRe; //0아니면 1이 조회가 되어야 하는데..??
		}
		
		//거래내역 => 반품내역 => 반품지시서 모달 => 등록
		@RequestMapping("RE_deliveryInsert.do")
		@ResponseBody
		public Integer RE_deliveryInsert(@RequestBody Map<String, Object> paramMap) {
			//@RequestParam("Storage_item_code") String itemCode
		    logger.info("+ Start " + className + ".InsertDelivery");
		    logger.info("   - paramMap  : " + paramMap);
		    //session.get
		    Integer RE_deliveryInsert = businessService.RE_deliveryInsert(paramMap);
		    logger.info("   - RE_deliveryInsert : " + RE_deliveryInsert);
		    //return InsertDelivery;
		    return RE_deliveryInsert;
		}
		
		//거래내역 => 수주내역 모달 밑에 데이터 붙여주고 update  => 혹시 시간 남으면 데이터들 많이 띄워주기 위해서 listMap구조로 변경하려고
		@RequestMapping("return_deliverySelect.do")
		@ResponseBody
		  public List<Map<String, Object>> return_deliverySelectUpdate(@RequestBody Map<String, Object> paramMap) {
			  logger.info("+Start%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% " + className + ".InsertDelivery");
			  logger.info("   -paramMap%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  : " + paramMap);
		        
			  //1번 조회해서 백틱에 데이터 넣어주기(ajax)
			  List<Map<String, Object>> returnDeliveryUpdate = businessService.return_deliverySelect(paramMap);
			  logger.info("controller(deliveryModelupSelect) => " + returnDeliveryUpdate);

		      return returnDeliveryUpdate;
		  }

		
		@RequestMapping("returndeliveryUpdate.do")
		@ResponseBody
		  public Integer returndeliveryUpdate(@RequestBody Map<String, Object> paramMap) {
			  logger.info("+ Start " + className + ".InsertDelivery");
			  logger.info("   - paramMap : " + paramMap);
			  //1번 조회해서 백틱에 데이터 넣어주기(ajax) => 배송지시서 테이블 update라서 함수는 공통
		      Integer  returnModelUpdate = businessService.updateDeliveryModal(paramMap);
			  logger.info(" returnModelUpdate : => " + returnModelUpdate);
		      // 응답 데이터 구성

		      return returnModelUpdate;
		  }
		

}
