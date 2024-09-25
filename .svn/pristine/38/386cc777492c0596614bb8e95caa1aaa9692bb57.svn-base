package kr.happyjob.study.management.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import kr.happyjob.study.management.dao.ManagementDao;
import kr.happyjob.study.management.model.ManagementModel;

@Service
public class ManagementServiceImpl implements ManagementService {

	@Autowired
	ManagementDao managementDao;
	
	private final Logger logger = LogManager.getLogger(this.getClass());

	@Value("${fileUpload.rootPath}")
	private String rootPath;

	@Value("${fileUpload.virtualRootPath}")
	private String virtualRootPath;

	@Value("${fileUpload.noticePath}")
	private String noticePath;

	@Override
	public List<ManagementModel> userList(Map<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return managementDao.userList(paramMap);
	}
	
	@Override
	public List<ManagementModel> supplyList(Map<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return managementDao.supplyList(paramMap);
	}
	
	@Override
	public List<ManagementModel> userDetail(Map<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return managementDao.userDetail(paramMap);
	}
	
	@Override
	public List<ManagementModel> custDetail(Map<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return managementDao.custDetail(paramMap);
	}
	
	@Override
	public List<ManagementModel> custProduct(Map<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return managementDao.custProduct(paramMap);
	}

	@Override
	public int userListCnt(Map<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return managementDao.userListCnt(paramMap);
	}
	
	@Override
	public int userListCnt2(Map<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return managementDao.userListCnt2(paramMap);
	}
	
	@Override
	public int supplyListCnt(Map<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return managementDao.supplyListCnt(paramMap);
	}
	
	@Override
	public int custProductCnt(Map<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return managementDao.custProductCnt(paramMap);
	}
	
	@Override
	public int codeCnt(Map<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return managementDao.codeCnt(paramMap);
	}
	
	@Override
	public int regist(Map<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return managementDao.regist(paramMap);
	}
	
	@Override
	public int userAjust(Map<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return managementDao.userAjust(paramMap);
	}
	
	@Override
	public int userDelete(Map<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return managementDao.userDelete(paramMap);
	}

	@Override
	public List<Map<String, Object>> warehouseList(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return managementDao.warehouseList(paramMap);
	}

	@Override
	public int newStorageSave(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return managementDao.newStorageSave(paramMap);
	}
	
	@Override
	public List<Map<String, Object>> warehouseDetail(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return managementDao.warehouseDetail(paramMap);
	}

	@Override
	public List<Map<String, Object>> orderCompanyList(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return managementDao.orderCompanyList(paramMap);
	}
	@Override
	public int newCompanySave(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return managementDao.newCompanySave(paramMap);
	}

	@Override
	public List<ManagementModel> userSearch(Map<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return managementDao.userSearch(paramMap);
	}
	
	@Override
	public List<ManagementModel> supplySearch(Map<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return managementDao.supplySearch(paramMap);
	}
	
	@Override
	public List<ManagementModel> supplySearch2(Map<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return managementDao.supplySearch2(paramMap);
	}
	
	@Override
	public List<ManagementModel> comnCodeSearch(Map<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return managementDao.comnCodeSearch(paramMap);
	}
	
	@Override
	public List<ManagementModel> comnCodeSearch2(Map<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return managementDao.comnCodeSearch2(paramMap);
	}
	
	@Override
	public List<ManagementModel> comnCodeSearch3(Map<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return managementDao.comnCodeSearch3(paramMap);
	}

	@Override
	public List<ManagementModel> getCodeList(Map<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return managementDao.getCodeList(paramMap);
	}
	
	@Override
	public List<ManagementModel> getDetailCodeList(Map<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return managementDao.getDetailCodeList(paramMap);
	}

	@Override
	public List<Map<String, Object>> orderComponyDetail(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return managementDao.orderComponyDetail(paramMap);
	} 

	@Override
	public int comCodeAdjust(Map<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return managementDao.comCodeAdjust(paramMap);
	}
	
	@Override
	public int comDetailCodeAdjust(Map<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return managementDao.comDetailCodeAdjust(paramMap);
	}
	
	@Override
	public int comCodeRegist(Map<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return managementDao.comCodeRegist(paramMap);
	}
	
	@Override
	public int comDetailCodeRegist(Map<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return managementDao.comDetailCodeRegist(paramMap);
	}
	
	@Override
	public int comCodeDelete(Map<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return managementDao.comCodeDelete(paramMap);
	}
	
	@Override
	public int comDetailCodeDelete(Map<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return managementDao.comDetailCodeDelete(paramMap);
	}

	@Override
	public List<Map<String, Object>> orderComSelectItem(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		return managementDao.orderComSelectItem(paramMap);
	}
	@Override
	public void newItemSave(Map<String, Object> paramMap) {
		// TODO Auto-generated method stub
		managementDao.newItemSave(paramMap);
	}
	
	@Override
	public List<ManagementModel> getProductList(Map<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return managementDao.getProductList(paramMap);
	}
	
	@Override
	public List<ManagementModel> getDetailProductList(Map<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return managementDao.getProductList(paramMap);
	}
	
	@Override
	public int productCnt(Map<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return managementDao.productCnt(paramMap);
	}
	
	@Override
	public List<ManagementModel> productSearch(Map<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return managementDao.productSearch(paramMap);
	}
	
	@Override
	public int productRegist(Map<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return managementDao.productRegist(paramMap);
	}
	
	@Override
	public int productUpdate(Map<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return managementDao.productUpdate(paramMap);
	}
	
	@Override
	public int productDelete(Map<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return managementDao.productDelete(paramMap);
	}

//	@Override
//	public int getCodeList(Map<String, Object> paramMap) throws Exception {
//		// TODO Auto-generated method stub
//		return managementDao.getCodeList(paramMap);
//	}
	
	

/*	@Override
	public List<NoticeModel> noticeList(Map<String, Object> paramMap) throws Exception {

		return noticeDao.noticeList(paramMap);
	}
	
	@Override
	public List<NoticeModel> userList2(Map<String, Object> paramMap) throws Exception {

		return noticeDao.userList(paramMap);
	}

	

	@Override
	public int noticeSave(Map<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return noticeDao.noticeSave(paramMap);
	}

	@Override
	public NoticeModel noticeDetail(Map<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return noticeDao.noticeDetail(paramMap);
	}

	@Override
	public int noticeUpdate(Map<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return noticeDao.noticeUpdate(paramMap);
	}

	@Override
	public int noticeDelete(Map<String, Object> paramMap) throws Exception {
		// 1. 업로드 되었던 파일을 삭제
		NoticeModel orginFile = noticeDao.noticeDetail(paramMap);
		if (orginFile.getFile_name() != null) {
			File oldFile = new File(orginFile.getPhsycal_path());
			oldFile.delete();
		}
		return noticeDao.noticeDelete(paramMap);
	}

	@Override
	public int noticeSaveFile(Map<String, Object> paramMap, HttpServletRequest request) throws Exception {

		// 업로드 된 파일을 db에 저장
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;

		String itemFilePath = noticePath + File.separator;
		FileUtilCho fileUpload = new FileUtilCho(multipartHttpServletRequest, rootPath, virtualRootPath, itemFilePath);

		Map<String, Object> fileInfo = fileUpload.uploadFiles();

		if (fileInfo.get("file_nm") == null) {
			paramMap.put("fileYn", "N");
			paramMap.put("fileinfo", null);
		} else {
			paramMap.put("fileYn", "Y");
			paramMap.put("fileinfo", fileInfo);
		}

		return noticeDao.noticeSaveFile(paramMap);
	}

	@Override
	public int noticeUpdateFile(Map<String, Object> paramMap, HttpServletRequest request) throws Exception {

		// 1. 업로드 되었던 파일을 삭제
		NoticeModel orginFile = noticeDao.noticeDetail(paramMap);
		if (orginFile.getFile_name() != null) {
			File oldFile = new File(orginFile.getPhsycal_path());
			oldFile.delete();
		}

		// 2. 수정 된 파일을 폴더에 저장
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;

		String itemFilePath = noticePath + File.separator;
		FileUtilCho fileUpload = new FileUtilCho(multipartHttpServletRequest, rootPath, virtualRootPath, itemFilePath);

		Map<String, Object> fileInfo = fileUpload.uploadFiles();

		if (fileInfo.get("file_nm") == null) {
			paramMap.put("fileYn", "N");
			paramMap.put("fileinfo", null);
		} else {
			paramMap.put("fileYn", "Y");
			paramMap.put("fileinfo", fileInfo);
		}

		return noticeDao.noticeUpdateFile(paramMap);
	}
	*/

}