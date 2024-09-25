package kr.happyjob.study.board.controller;

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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.happyjob.study.board.model.InquiryModel;
import kr.happyjob.study.board.service.InquiryService;
import kr.happyjob.study.board.service.NoticeService;

@Controller
@RequestMapping("/board/")
public class InquiryController {

	@Autowired
	InquiryService inquiryService;
	
	
	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());

	// Get class name for logger
	private final String className = this.getClass().toString();

	// 처음 로딩될 때 1:1문의사항 메인 연결 및 카테고리 리스트 불러오기
	@RequestMapping("inquiry.do")
	public String init(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {

		logger.info("+ Start " + className + ".initInquiry");
		logger.info("   - paramMap : " + paramMap);

		List<InquiryModel> categoryList = inquiryService.categoryList(paramMap);
		
		String loginID = (String) session.getAttribute("loginId");
		String userType = (String) session.getAttribute("userType");
		paramMap.put("loginID", loginID);

		model.addAttribute("loginID", loginID);
		model.addAttribute("userType", userType);
		model.addAttribute("categoryList", categoryList);
		
		
		return "board/inquiry";
	}
	
	// 1:1 문의사항 리스트 불러오기
	@RequestMapping("inquiryList.do")
	public String getInquiryList(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		logger.info("+ Start " + className + ".getNoticeList");
		logger.info("   - paramMap : " + paramMap);

		int cpage = Integer.valueOf((String) paramMap.get("currentPage"));
		int pageSize = Integer.valueOf((String) paramMap.get("pageSize"));

		int startSeq = (cpage - 1) * pageSize;

		paramMap.put("startSeq", startSeq);
		paramMap.put("pageSize", pageSize);

		List<InquiryModel> inquiryList = inquiryService.inquiryList(paramMap);
		int inquiryCnt = inquiryService.inquiryListCnt(paramMap);

		model.addAttribute("inquiryList", inquiryList);
		model.addAttribute("inquiryCnt", inquiryCnt);

		return "board/inquiryList";
	}

	// 1:1문의사항 등록
	@RequestMapping("inquiryInsert.do")
	@ResponseBody
	public  Map<String, Object> inquiryInsert(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		
		logger.info("+ Start " + className + ".inquiryInsert");
		logger.info("   - paramMap : " + paramMap);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		String loginId = (String) session.getAttribute("loginId");
		paramMap.put("loginId", loginId);
		int result = 0;
		String returnMsg = "";
		
		result = inquiryService.inquirySave(paramMap);
		
		if (result > 0) {
			returnMsg = "success";
		} else {
			returnMsg = "fail";
		}
		
		resultMap.put("result", returnMsg);
		
		return resultMap;
	}

	//상세정보 불러오기
	@RequestMapping("inquiryDetail.do")
	@ResponseBody
	public Map<String, Object> inquiryDetail(@RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		logger.info("+ Start " + className + ".inquiryDetail");
		logger.info("   - paramMap : " + paramMap);

		Map<String, Object> resultMap = new HashMap<String, Object>();

		InquiryModel detail = inquiryService.inquiryDetail(paramMap);

		resultMap.put("detailValue", detail);

		return resultMap;

	}

		

	//1:1문의 수정
	@RequestMapping("inquiryUpdate.do")
	@ResponseBody
	public Map<String, Object> inquiryUpdate(@RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		logger.info("+ Start " + className + ".noticeUpdate");
		logger.info("   - paramMap : " + paramMap);

		Map<String, Object> resultMap = new HashMap<String, Object>();
		String loginId = (String) session.getAttribute("loginId");
		paramMap.put("loginId", loginId);
		int result = 0;
		String returnMsg = "";

		result = inquiryService.inquiryUpdate(paramMap);

		if (result > 0) {
			returnMsg = "success";
		} else {
			returnMsg = "fail";
		}

		resultMap.put("result", returnMsg);

		return resultMap;

	}
	
	
	
	//1:1문의 삭제
	@RequestMapping("inquiryDelete.do")
	@ResponseBody
	public Map<String, Object> inquiryDelete(@RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		logger.info("+ Start " + className + ".inquiryDelete");
		logger.info("   - paramMap : " + paramMap);

		Map<String, Object> resultMap = new HashMap<String, Object>();
		int result = 0;
		String returnMsg = "";

		result = inquiryService.inquiryDelete(paramMap);

		if (result > 0) {
			returnMsg = "success";
		} else {
			returnMsg = "fail";
		}

		resultMap.put("result", returnMsg);

		return resultMap;

	}

// ---------------------------------답변 부분------------------------
	
	//답변 불러오기
	@RequestMapping("answerDetail.do")
	@ResponseBody
	public Map<String, Object> answerDetail(@RequestParam Map<String, Object> paramMap, HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {
		logger.info("+ Start " + className + ".inquiryDetail");
		logger.info("   - paramMap : " + paramMap);

		Map<String, Object> resultMap = new HashMap<String, Object>();

		InquiryModel answerDetail = inquiryService.answerDetail(paramMap);

		resultMap.put("answerDetail", answerDetail);

		return resultMap;

	}
	
	//답변 확인
		@RequestMapping("answerChk.do")
		@ResponseBody
		public Map<String, Object> answerChk(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
				HttpServletResponse response, HttpSession session) throws Exception {
			logger.info("+ Start " + className + ".answerChk");
			logger.info("   - paramMap : " + paramMap);

			Map<String, Object> resultMap = new HashMap<String, Object>();
			int result = 0;
			result = inquiryService.answerChk(paramMap);
			System.out.println("나오니"+ result);

			resultMap.put("chkResult", result);
			model.addAttribute("chkResult", result);
			
			return resultMap;

		}
		
		//답변 등록
		@RequestMapping("answerInsert.do")
		@ResponseBody
		public  Map<String, Object> answerInsert(Model model, @RequestParam Map<String, Object> paramMap, HttpServletRequest request,
				HttpServletResponse response, HttpSession session) throws Exception {
			
			logger.info("+ Start " + className + ".answerInsert");
			logger.info("   - paramMap : " + paramMap);
			System.out.println("왜안타니ㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣㅣ");
			
			Map<String, Object> resultMap = new HashMap<String, Object>();
			String loginId = (String) session.getAttribute("loginId");
			paramMap.put("loginId", loginId);
			int result = 0;
			String returnMsg = "";
			
			result = inquiryService.answerInsert(paramMap);
			
			if (result > 0) {
				returnMsg = "success";
			} else {
				returnMsg = "fail";
			}
			
			resultMap.put("result", returnMsg);
			
			return resultMap;
		}


		//답변 수정
		@RequestMapping("answerUpdate.do")
		@ResponseBody
		public Map<String, Object> answerUpdate(@RequestParam Map<String, Object> paramMap, HttpServletRequest request,
				HttpServletResponse response, HttpSession session) throws Exception {
			logger.info("+ Start " + className + ".noticeUpdate");
			logger.info("   - paramMap : " + paramMap);

			Map<String, Object> resultMap = new HashMap<String, Object>();
			String loginId = (String) session.getAttribute("loginId");
			paramMap.put("loginId", loginId);
			int result = 0;
			String returnMsg = "";

			result = inquiryService.answerUpdate(paramMap);

			if (result > 0) {
				returnMsg = "success";
			} else {
				returnMsg = "fail";
			}

			resultMap.put("result", returnMsg);

			return resultMap;

		}

		
		//답변 삭제
		@RequestMapping("answerDelete.do")
		@ResponseBody
		public Map<String, Object> answerDelete(@RequestParam Map<String, Object> paramMap, HttpServletRequest request,
				HttpServletResponse response, HttpSession session) throws Exception {
			logger.info("+ Start " + className + ".inquiryDelete");
			logger.info("   - paramMap : " + paramMap);

			Map<String, Object> resultMap = new HashMap<String, Object>();
			int result = 0;
			String returnMsg = "";

			result = inquiryService.answerDelete(paramMap);

			if (result > 0) {
				returnMsg = "success";
			} else {
				returnMsg = "fail";
			}

			resultMap.put("result", returnMsg);

			return resultMap;

		}
		
		// -------------------------- 리액트 ------------------------
		
		// 1:1 문의사항 리스트 불러오기
		@RequestMapping("inquiryListJson.do")
		@ResponseBody
		public Map<String, Object> inquiryListJson(Model model, @RequestBody Map<String, Object> paramMap, HttpServletRequest request,
				HttpServletResponse response) throws Exception {
			logger.info("+ Start " + className + ".inquiryListJson");
			logger.info("   - paramMap : " + paramMap);

			int cpage = Integer.valueOf(String.valueOf(paramMap.get("currentPage")));
			int pageSize = Integer.valueOf(String.valueOf(paramMap.get("pageSize")));

			int startSeq = (cpage - 1) * pageSize;

			paramMap.put("startSeq", startSeq);
			paramMap.put("pageSize", pageSize);

			List<InquiryModel> inquiryList = inquiryService.inquiryList(paramMap);
			int inquiryCnt = inquiryService.inquiryListCnt(paramMap);
			
			Map<String, Object> resultMap = new HashMap<String, Object>();

			resultMap.put("inquiryList", inquiryList);
			resultMap.put("inquiryCnt", inquiryCnt);

			return resultMap;
		}
		
		// 1:1 문의 및 답변 상세 정보 불러오기
		@RequestMapping("inquiryDetailJson.do")
		@ResponseBody
		public Map<String, Object> inquiryDetailJson(@RequestBody Map<String, Object> paramMap, HttpServletRequest request,
				HttpServletResponse response, HttpSession session) throws Exception {
			logger.info("+ Start " + className + ".inquiryDetailJson");
			logger.info("   - paramMap : " + paramMap);

			Map<String, Object> resultMap = new HashMap<String, Object>();

			InquiryModel detail = inquiryService.inquiryDetailJson(paramMap);
			InquiryModel answerDetail = inquiryService.answerDetail(paramMap);
			String userType = (String) session.getAttribute("userType");

			resultMap.put("inquiryDetail", detail);
			resultMap.put("answerDetail", answerDetail);

			return resultMap;
		}
		
		// 카테고리 리스트 불러오기
		@RequestMapping("inquiryCategoryJson.do")
		@ResponseBody
		public Map<String, Object> inquiryCategoryJson(Model model, @RequestBody Map<String, Object> paramMap, HttpServletRequest request,
				HttpServletResponse response, HttpSession session) throws Exception {

			logger.info("+ Start " + className + ".inquiryCategoryJson");
			logger.info("   - paramMap : " + paramMap);

			List<InquiryModel> categoryList = inquiryService.categoryList(paramMap);
			
			Map<String, Object> resultMap = new HashMap<String, Object>();
			resultMap.put("categoryList", categoryList);
		
			return resultMap;
		}
		
		// 1:1문의사항 등록
		@RequestMapping("inquiryInsertJson.do")
		@ResponseBody
		public  Map<String, Object> inquiryInsertJson(Model model, @RequestBody Map<String, Object> paramMap, HttpServletRequest request,
				HttpServletResponse response, HttpSession session) throws Exception {
			
			logger.info("+ Start " + className + ".inquiryInsertJson");
			logger.info("   - paramMap : " + paramMap);
			
			Map<String, Object> resultMap = new HashMap<String, Object>();
			String loginId = (String) session.getAttribute("loginId");
			paramMap.put("loginId", loginId);
			int result = 0;
			String returnMsg = "";
			
			result = inquiryService.inquirySave(paramMap);
			
			if (result > 0) {
				returnMsg = "success";
			} else {
				returnMsg = "fail";
			}
			
			resultMap.put("result", returnMsg);
			
			return resultMap;
		}
		
		//1:1문의 수정
		@RequestMapping("inquiryUpdateJson.do")
		@ResponseBody
		public Map<String, Object> inquiryUpdateJson(@RequestBody Map<String, Object> paramMap, HttpServletRequest request,
				HttpServletResponse response, HttpSession session) throws Exception {
			logger.info("+ Start " + className + ".inquiryUpdateJson");
			logger.info("   - paramMap : " + paramMap);

			Map<String, Object> resultMap = new HashMap<String, Object>();
			String loginId = (String) session.getAttribute("loginId");
			paramMap.put("loginId", loginId);
			int result = 0;
			String returnMsg = "";

			result = inquiryService.inquiryUpdate(paramMap);

			if (result > 0) {
				returnMsg = "success";
			} else {
				returnMsg = "fail";
			}

			resultMap.put("result", returnMsg);

			return resultMap;

		}
		
		//1:1문의 삭제
		@RequestMapping("inquiryDeleteJson.do")
		@ResponseBody
		public Map<String, Object> inquiryDeleteJson(@RequestBody Map<String, Object> paramMap, HttpServletRequest request,
				HttpServletResponse response, HttpSession session) throws Exception {
			logger.info("+ Start " + className + ".inquiryDeleteJson");
			logger.info("   - paramMap : " + paramMap);

			Map<String, Object> resultMap = new HashMap<String, Object>();
			int result = 0;
			String returnMsg = "";

			result = inquiryService.inquiryDelete(paramMap);

			if (result > 0) {
				returnMsg = "success";
			} else {
				returnMsg = "fail";
			}

			resultMap.put("result", returnMsg);

			return resultMap;
		}
		
	// 답변 등록
	@RequestMapping("answerInsertJson.do")
	@ResponseBody
	public Map<String, Object> answerInsertJson(Model model, @RequestBody Map<String, Object> paramMap,
			HttpServletRequest request, HttpServletResponse response, HttpSession session) throws Exception {

		logger.info("+ Start " + className + ".answerInsertJson");
		logger.info("   - paramMap : " + paramMap);

		Map<String, Object> resultMap = new HashMap<String, Object>();
		String loginId = (String) session.getAttribute("loginId");
		paramMap.put("loginId", loginId);
		int result = 0;
		String returnMsg = "";

		result = inquiryService.answerInsert(paramMap);

		if (result > 0) {
			returnMsg = "success";
		} else {
			returnMsg = "fail";
		}

		resultMap.put("result", returnMsg);

		return resultMap;
	}

}
