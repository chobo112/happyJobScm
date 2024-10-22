package kr.happyjob.study.board.dao;

import java.util.List;
import java.util.Map;

import kr.happyjob.study.board.model.InquiryModel;

public interface InquiryDao {
	public List<InquiryModel> inquiryList(Map<String, Object> paramMap) throws Exception;

	public int inquiryListCnt(Map<String, Object> paramMap) throws Exception;

	public int inquirySave(Map<String, Object> paramMap) throws Exception;
	
	public List<InquiryModel> categoryList(Map<String, Object> paramMap) throws Exception;

	public InquiryModel inquiryDetail(Map<String, Object> paramMap)throws Exception;

	public int inquiryDelete(Map<String, Object> paramMap) throws Exception;

	public int inquiryUpdate(Map<String, Object> paramMap)throws Exception;

	public InquiryModel answerDetail(Map<String, Object> paramMap)throws Exception;

	public int answerChk(Map<String, Object> paramMap)throws Exception;

	public int answerInsert(Map<String, Object> paramMap) throws Exception;

	public int answerUpdate(Map<String, Object> paramMap)throws Exception;

	public int answerDelete(Map<String, Object> paramMap)throws Exception;

	public InquiryModel inquiryDetailJson(Map<String, Object> paramMap);

}
