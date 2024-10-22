package kr.happyjob.study.management.dao;

import java.util.List;
import java.util.Map;

import kr.happyjob.study.management.model.ManagementModel;

public interface ManagementDao {
	
	
	public List<ManagementModel> userList(Map<String, Object> paramMap) throws Exception;
	
	public List<Map<String, Object>> userListVue(Map<String, Object> paramMap) throws Exception;
	
	public List<ManagementModel> supplyList(Map<String, Object> paramMap) throws Exception;
	
	public List<ManagementModel> userDetail(Map<String, Object> paramMap) throws Exception;
	
	public List<ManagementModel> custDetail(Map<String, Object> paramMap) throws Exception;
	
	public List<ManagementModel> custProduct(Map<String, Object> paramMap) throws Exception;
	public List<Map<String, Object>> custProductVue(Map<String, Object> paramMap) throws Exception;
	
	public int regist(Map<String, Object> paramMap) throws Exception;
	
	public int userAjust(Map<String, Object> paramMap) throws Exception;

	public int userListCnt(Map<String, Object> paramMap) throws Exception;
	
	public int userListCntVue(Map<String, Object> paramMap);

	
	public int userListCnt2(Map<String, Object> paramMap) throws Exception;
	
	public int supplyListCnt(Map<String, Object> paramMap) throws Exception;
	public int supplyListCntVue(Map<String, Object> paramMap) throws Exception;
	
	public int custProductCnt(Map<String, Object> paramMap) throws Exception;
	
	public int codeCnt(Map<String, Object> paramMap) throws Exception;
	
	public int userDelete(Map<String, Object> paramMap) throws Exception;
	
	public List<ManagementModel> userSearch(Map<String, Object> paramMap) throws Exception;
	
	public List<ManagementModel> supplySearch(Map<String, Object> paramMap) throws Exception;
	
	public List<Map<String, Object>> supplySearchVue(Map<String, Object> paramMap) throws Exception;
	
	public List<ManagementModel> supplySearch2(Map<String, Object> paramMap) throws Exception;
	
	public List<ManagementModel> comnCodeSearch(Map<String, Object> paramMap) throws Exception;
	
	public List<ManagementModel> comnCodeSearch2(Map<String, Object> paramMap) throws Exception;
	
	public List<ManagementModel> comnCodeSearch3(Map<String, Object> paramMap) throws Exception;

	public List<Map<String, Object>> warehouseList(Map<String, Object> paramMap);

	public int newStorageSave(Map<String, Object> paramMap);

	public List<Map<String, Object>> warehouseDetail(Map<String, Object> paramMap);
	
	public List<ManagementModel> getCodeList(Map<String, Object> paramMap) throws Exception;
	
	public List<ManagementModel> getDetailCodeList(Map<String, Object> paramMap) throws Exception;

	public List<Map<String, Object>> orderCompanyList(Map<String, Object> paramMap);

	public int newCompanySave(Map<String, Object> paramMap);

	public void orderComponyDelete(Map<String, Object> paramMap);
	
	public int comCodeAdjust(Map<String, Object> paramMap) throws Exception;
	
	public int comDetailCodeAdjust(Map<String, Object> paramMap) throws Exception;
	
	public int productRegist(Map<String, Object> paramMap) throws Exception;
	
	public int productUpdate(Map<String, Object> paramMap) throws Exception;
	
	public int comDetailCodeRegist(Map<String, Object> paramMap) throws Exception;
	
	public int comCodeDelete(Map<String, Object> paramMap) throws Exception;
	
	public int comDetailCodeDelete(Map<String, Object> paramMap) throws Exception;

	public List<Map<String, Object>> orderComponyDetail(Map<String, Object> paramMap);

	public List<Map<String, Object>> orderComSelectItem(Map<String, Object> paramMap);

	public void newItemSave(Map<String, Object> paramMap);
	
	public List<ManagementModel> getProductList(Map<String, Object> paramMap) throws Exception;
	
	public List<ManagementModel> getDetailProductList(Map<String, Object> paramMap) throws Exception;
	
	public List<ManagementModel> productSearch(Map<String, Object> paramMap) throws Exception;
	
	public int productCnt(Map<String, Object> paramMap) throws Exception;
	
	public int comCodeRegist(Map<String, Object> paramMap) throws Exception;
	
	public int productDelete(Map<String, Object> paramMap) throws Exception;


//	public int noticeSave(Map<String, Object> paramMap) throws Exception;
//
//	public int noticeUpdate(Map<String, Object> paramMap) throws Exception;
//
//	public int noticeDelete(Map<String, Object> paramMap) throws Exception;
//
//	public int noticeSaveFile(Map<String, Object> paramMap);
//
//	public int noticeUpdateFile(Map<String, Object> paramMap);
	
	public List<Map<String, Object>> userInfoList(Map<String, Object> paramMap) throws Exception;
 	
 	public int userInfoListCount(Map<String, Object> paramMap) throws Exception;

 	
 	public List<Map<String, Object>> userInfoListDetail(Map<String, Object> paramMap) throws Exception;
 	
 	//public ManagementModel userInfoListDetail(Map<String, Object> paramMap) throws Exception;
 	
 	public List<Map<String, Object>> custInfoList(Map<String, Object> paramMap) throws Exception;
 	
 	public int custInfoListCount(Map<String, Object> paramMap) throws Exception;
 	
 	public List<Map<String, Object>> custInfoListDetail(Map<String, Object> paramMap) throws Exception;
 	
 	public int userSave(Map<String, Object> paramMap) throws Exception;
 	
 	public int userUpdate(Map<String, Object> paramMap) throws Exception;
 	
 	public int custSave(Map<String, Object> paramMap) throws Exception;
 	
 	public int custUpdate(Map<String, Object> paramMap) throws Exception;
 	
 	public int custDelete(Map<String, Object> paramMap) throws Exception;

	public List<Map<String, Object>> userTypeListVue(Map<String, Object> paramMap);

}