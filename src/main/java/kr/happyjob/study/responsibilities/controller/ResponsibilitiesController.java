package kr.happyjob.study.responsibilities.controller;

import java.util.List;
import java.util.Map;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.happyjob.study.responsibilities.service.ResponsibilitiesService;

@Controller
@RequestMapping("/work/")
public class ResponsibilitiesController {

	private final Logger logger = LogManager.getLogger(this.getClass());

	// Get class name for logger
	private final String className = this.getClass().toString();
	
	@Autowired ResponsibilitiesService responsibilitiesService;
	
	@RequestMapping("orderChk.do")
	public String orderChk(){
		
		logger.info("+ Start " + className + ".orderChk");
		logger.info("   - paramMap : " + "");
		
		return "work/orderCheck";
	}
	@RequestMapping("orderList.do")
	public String orderList(Model model, @RequestParam Map<String, Object> paramMap){
		
		logger.info("+ Start " + className + ".obtainList");
		logger.info("   - paramMap : " + paramMap);
		
		List<Map<String, Object>> list = responsibilitiesService.orderList(paramMap);
		logger.info("   - list : " + list);
		
		model.addAttribute("list", list);

		
		return "work/orderList";
	}
	@RequestMapping("deposit.do")
	public String deposit(Model model, @RequestParam Map<String, Object> paramMap){
		
		logger.info("+ Start " + className + ".deposit");
		logger.info("   - paramMap : " + paramMap);
		
		responsibilitiesService.deposit(paramMap);
		
		return "work/orderList";
	}
	
	@RequestMapping("deliveryChk.do")
	public String deliveryChk(Model model, @RequestParam Map<String, Object> paramMap){
		
		logger.info("+ Start " + className + ".deliveryChk");
		logger.info("   - paramMap : " + paramMap);
	
		return "work/deliveryChk";
	}
	
	@RequestMapping("deliveryList.do")
	public String deliveryList(Model model, @RequestParam Map<String, Object> paramMap){
		
		logger.info("+ Start " + className + ".deliveryChk");
		logger.info("   - paramMap : " + paramMap);
		
		List<Map<String, Object>> list = responsibilitiesService.deliveryList(paramMap);
		
		logger.info("   - list : " + list);
		
		model.addAttribute("list", list);
		
		return "work/deliveryList";
	}
	
	@RequestMapping("deliveryDetail.do")
	@ResponseBody
	public List<Map<String, Object>> deliveryDetail(Model model, @RequestParam Map<String, Object> paramMap){
		
		logger.info("+ Start " + className + ".deliveryDetail");
		logger.info("   - paramMap : " + paramMap);
		
		List<Map<String, Object>> list = responsibilitiesService.deliveryDetail(paramMap);
		
		logger.info("   - list : " + list);
		
		
		return list;
	}
	@RequestMapping("deleveryDone.do")
	public String deleveryDone(Model model, @RequestParam Map<String, Object> paramMap){
		
		logger.info("+ Start " + className + ".deliveryChk");
		logger.info("   - paramMap : " + paramMap);
		
		responsibilitiesService.deleveryDone(paramMap);
		
		return "work/deliveryList";
	}
	
}
