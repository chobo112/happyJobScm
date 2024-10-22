package kr.happyjob.study.responsibilities.controller;

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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.happyjob.study.responsibilities.service.ReturnService;
import kr.happyjob.study.responsibilities.vo.ReturnVO;

@RequestMapping("/work/")
@Controller
public class ReturnController {
	
	
	@Autowired
	ReturnService rService;
	
	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());

	// Get class name for logger
	private final String className = this.getClass().toString();
	
	@RequestMapping("returnChk.do")//return은 예약어여서 쓸수 없음
	public String returnCheck(@ModelAttribute ReturnVO rvo, HttpServletResponse response, HttpServletRequest request,
	                          @RequestParam Map<String, Object> paramMap, HttpSession session) {
	    String loginID = (String) session.getAttribute("loginId");
	    paramMap.put("loginID", loginID);

	    return "/work/Return"; 
	}

	
	@RequestMapping("returnList.do")
	@ResponseBody
	public Map<String , Object> returnList (@ModelAttribute ReturnVO rvo, HttpServletResponse response,
			@RequestParam Map<String, Object> paramMap  ) throws Exception{
		Map<String , Object> resultMap = new HashMap<>();
		
		int cpage = Integer.valueOf((String)paramMap.get("currentPage"));
		int pageSize = Integer.valueOf((String) paramMap.get("pageSize"));
		int startSeq = (cpage -1)*pageSize;
		
		paramMap.put("startSeq", startSeq);
		paramMap.put("pageSize",pageSize);
		
		List<ReturnVO> returnList = rService.returnList(paramMap);
		int returnCnt = rService.returnCnt(paramMap);
		resultMap.put("returnList", returnList);
		resultMap.put("returnCnt", returnCnt);
		return resultMap;
	}
	
	@RequestMapping("returnListJson.do")
	@ResponseBody
	public Map<String , Object> returnListJson (@ModelAttribute ReturnVO rvo, HttpServletResponse response,
			@RequestParam Map<String, Object> paramMap  ) throws Exception{
		Map<String , Object> resultMap = new HashMap<>();
		
		int cpage = Integer.valueOf((String)paramMap.get("cpage"));
		int pageSize = Integer.valueOf((String) paramMap.get("pageSize"));
		int startSeq = (cpage -1)*pageSize;
		
		paramMap.put("startSeq", startSeq);
		paramMap.put("pageSize",pageSize);
		
		List<ReturnVO> returnList = rService.returnList(paramMap);
		int returnCnt = rService.returnCnt(paramMap);
		resultMap.put("returnList", returnList);
		resultMap.put("returnCnt", returnCnt);
		return resultMap;
	}
	
	@RequestMapping("returnDetail.do")
	@ResponseBody
	public Map<String , Object> returnDetail (@ModelAttribute ReturnVO rvo, HttpServletResponse response, HttpServletRequest request,
            @RequestParam Map<String, Object> paramMap, HttpSession session) throws Exception{
		Map<String , Object> resultMap = new HashMap<>();
		
		List<ReturnVO> returnDetail = rService.returnDetail(paramMap);
		
		resultMap.put("returnDetail", returnDetail);
		
		return resultMap;
	}
	
	@RequestMapping("returnDetailJson.do")
	@ResponseBody
	public Map<String , Object> returnDetailJson (@ModelAttribute ReturnVO rvo, HttpServletResponse response, HttpServletRequest request,
            @RequestBody Map<String, Object> paramMap, HttpSession session) throws Exception{
		logger.info("   - paramMap : " + paramMap);
		
		Map<String , Object> resultMap = new HashMap<>();
		
		List<ReturnVO> returnDetail = rService.returnDetail(paramMap);
		
		resultMap.put("returnDetail", returnDetail);
		
		return resultMap;
	}
	
	@RequestMapping("confirm.do")
	@ResponseBody
	public Map<String , Object> confirm (@ModelAttribute ReturnVO rvo, HttpServletResponse response, HttpServletRequest request,
            @RequestParam Map<String, Object> paramMap, HttpSession session)throws Exception{
		Map<String , Object> resultMap = new HashMap<>();
		
		int result =0;
		String resultMsg="";
		
		result= rService.confirm(paramMap);
		if(result > 0 ) {
			resultMsg="SUCCESS";
		}else {
			resultMsg="FAIL";
		}
		resultMap.put("resultMsg", resultMsg);
		return resultMap;
	}
	
	@RequestMapping("modItemCount.do")
	@ResponseBody
	public Map<String , Object> modItemCount (@ModelAttribute ReturnVO rvo, HttpServletResponse response, HttpServletRequest request,
            @RequestParam Map<String, Object> paramMap, HttpSession session)throws Exception{
		Map<String , Object> resultMap = new HashMap<>();
		
		int result =0;
		String resultMsg="";
		
		result= rService.modeItemCount(paramMap);
		if(result > 0 ) {
			resultMsg="SUCCESS";
		}else {
			resultMsg="FAIL";
		}
		resultMap.put("resultMsg", resultMsg);
		return resultMap;
	}
	
}
