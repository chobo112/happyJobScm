package kr.happyjob.study.executive.service;

import java.util.List;
import java.util.Map;

import kr.happyjob.study.executive.model.StorageDetailModel;

public interface ExecutiveService {

	public List<Map<String, Object>> storageAll(Map<String, Object> paramMap);

	public List<Map<String, Object>> storageDetail(Map<String, Object> paramMap);

	public List<Map<String, Object>> salesList(Map<String, Object> paramMap);

	public List<Map<String, Object>> salesTop(Map<String, Object> paramMap);

	public List<Map<String, Object>> orderApprovalY(Map<String, Object> paramMap);

	public List<Map<String, Object>> orderApprovalN(Map<String, Object> paramMap);

	public List<Map<String, Object>> returnApprovalY(Map<String, Object> paramMap);

	public List<Map<String, Object>> returnApprovalN(Map<String, Object> paramMap);

	public void approvalY(Map<String, Object> paramMap);

	public List<Map<String, Object>> chart(Map<String, Object> paramMap);

	public int salesPage(Map<String, Object> paramMap);

	public int orderAppPage(Map<String, Object> paramMap);

	public int returnAppPage(Map<String, Object> paramMap);

	public List<StorageDetailModel> storageDetailJson(Map<String, Object> paramMap);
	
	public List<Map<String, Object>> orderApprovalAll(Map<String, Object> paramMap);
	
	public List<Map<String, Object>> returnApprovalAll(Map<String, Object> paramMap);
	
	public int approvalYJson(Map<String, Object> paramMap);
	
	public int orderListCnt(Map<String, Object> paramMap);

	public int returnListCnt(Map<String, Object> paramMap);

}
