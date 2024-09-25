package kr.happyjob.study.sampletest.service;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.happyjob.study.sampletest.model.SamplenoticeModel;
import kr.happyjob.study.common.comnUtils.FileUtilCho;
import kr.happyjob.study.sampletest.dao.SampletestNoticeDao;;

@Service
public class SampletestNoticeServiceImpl implements SampletestNoticeService {

	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());
	
	// Get class name for logger
	private final String className = this.getClass().toString();
	
	// Root path for file upload 
	@Value("${fileUpload.rootPath}")
	private String rootPath;
	
	@Value("${fileUpload.virtualRootPath}")
	private String virtualRootPath;
	
	@Value("${fileUpload.noticePath}")
	private String noticePath;
	
	@Autowired
	SampletestNoticeDao sampletestNoticeDao;
	
	/** 공지사항 목록 조회 */
	public List<SamplenoticeModel> listnotice(Map<String, Object> paramMap) throws Exception {
				
		return sampletestNoticeDao.listnotice(paramMap);
	}
	
	/** 공지사항 목록 카운트 조회 */
	public int totalcntnotice(Map<String, Object> paramMap) throws Exception {
				
		return sampletestNoticeDao.totalcntnotice(paramMap);
	}
	
	/** 공지사항 등록 */
	public int insertnotice(Map<String, Object> paramMap) throws Exception {
		return sampletestNoticeDao.insertnotice(paramMap);
	}
	
	/** 공지사항 수정 */
	public int updatenotice(Map<String, Object> paramMap) throws Exception {
		return sampletestNoticeDao.updatenotice(paramMap);
	}
	
	/** 공지사항 삭제 */
	public int deletenotice(Map<String, Object> paramMap) throws Exception {
		return sampletestNoticeDao.deletenotice(paramMap);
	}
	
	/** 공지사항 한건조회 */
	public SamplenoticeModel selectnotice (Map<String, Object> paramMap) throws Exception {
		return sampletestNoticeDao.selectnotice(paramMap);
	}
	
	/** 공지사항 등록  파일 */
	public int insertnoticefile(Map<String, Object> paramMap, HttpServletRequest request) throws Exception {
		
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
				
		String itemFilePath = noticePath + File.separator;  
		FileUtilCho fileup = new FileUtilCho(multipartHttpServletRequest, rootPath, virtualRootPath, itemFilePath);
		Map<String, Object> fileinfo = fileup.uploadFiles();
		
		//map.put("file_nm", file_nm);
        //map.put("file_size", file_Size);
        //map.put("file_loc", file_loc);
        //map.put("vrfile_loc", vrfile_loc);
        //map.put("fileExtension", fileExtension);
        //map.put("file_nm_uuid", file_nm_uuid);
		
		// db Insert  
		// file 첨부 O / X  Db 작업 처리    
		
		paramMap.put("fileinfo",fileinfo);
		
		if(fileinfo.get("file_nm") == null || fileinfo.get("file_nm") == "") {
			paramMap.put("fileexits","N");
		} else {
			paramMap.put("fileexits","Y");
		}
		
		logger.info("fileexits : " + paramMap.get("fileexits"));
		
		return sampletestNoticeDao.insertnoticefile(paramMap);
	}

	/** 공지사항 수정  파일 */
	public int updatenoticefile(Map<String, Object> paramMap, HttpServletRequest request) throws Exception {
		
		MultipartHttpServletRequest multipartHttpServletRequest = (MultipartHttpServletRequest) request;
		
		SamplenoticeModel orginfo = sampletestNoticeDao.selectnotice(paramMap);
		String orgfilename = orginfo.getFile_name();
		String orgphypath = orginfo.getPhygical_path();
		
		String checkyn = (String) paramMap.get("checkyn");
		
		if(orginfo.getFile_name() != null) {
			if(!"on".equals(checkyn)) {
				File orgfile = new File(orginfo.getPhygical_path());
				orgfile.delete();
			}
		}
		
		String itemFilePath = noticePath + File.separator;  
		FileUtilCho fileup = new FileUtilCho(multipartHttpServletRequest, rootPath, virtualRootPath, itemFilePath);
		Map<String, Object> fileinfo = fileup.uploadFiles();
		
        
		
		if(fileinfo.get("file_nm") == null || fileinfo.get("file_nm") == "") {
			paramMap.put("fileexits","N");
			paramMap.put("fileinfo",null);
			
		} else {
			paramMap.put("fileexits","Y");
			paramMap.put("fileinfo",fileinfo);
		}
		
		if("on".equals(checkyn)) {
			paramMap.put("fileexits", "N");
			
			System.out.println(paramMap.get("fileexits"));
		} else {
			paramMap.put("fileexits", "Y");
		}
		
		return sampletestNoticeDao.updatenoticefile(paramMap);
		
	}
	
	/** 공지사항 삭제 */
	public int deletenoticefile(Map<String, Object> paramMap) throws Exception {
		
		SamplenoticeModel orginfo = sampletestNoticeDao.selectnotice(paramMap);
		String orgfilename = orginfo.getFile_name();
		String orgphypath = orginfo.getPhygical_path();
		
		if(orginfo.getFile_name() != null) {
		   File orgfile = new File(orginfo.getPhygical_path());
		   orgfile.delete();
		}
		
		return sampletestNoticeDao.deletenotice(paramMap);
	}
}
