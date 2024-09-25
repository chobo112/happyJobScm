package kr.happyjob.study.sampletest.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import kr.happyjob.study.sampletest.model.SamplenoticeModel;
import kr.happyjob.study.system.model.ComnCodUtilModel;
import kr.happyjob.study.system.model.ComnDtlCodModel;
import kr.happyjob.study.system.model.ComnGrpCodModel;

public interface SampletestNoticeService {

	/** 공지사항 목록 조회 */
	public List<SamplenoticeModel> listnotice(Map<String, Object> paramMap) throws Exception;
	
	/** 공지사항 목록 카운트 조회 */
	public int totalcntnotice(Map<String, Object> paramMap) throws Exception;
	
	/** 공지사항 등록 */
	public int insertnotice(Map<String, Object> paramMap) throws Exception;
	
	/** 공지사항 수정 */
	public int updatenotice(Map<String, Object> paramMap) throws Exception;
	
	/** 공지사항 삭제 */
	public int deletenotice(Map<String, Object> paramMap) throws Exception;
	
	
	/** 공지사항 한건조회 */
	public SamplenoticeModel selectnotice(Map<String, Object> paramMap) throws Exception;

	/** 공지사항 등록  파일 */
	public int insertnoticefile(Map<String, Object> paramMap, HttpServletRequest request) throws Exception;

	/** 공지사항 수정  파일 */
	public int updatenoticefile(Map<String, Object> paramMap, HttpServletRequest request) throws Exception;
	
	/** 공지사항 삭제 */
	public int deletenoticefile(Map<String, Object> paramMap) throws Exception;
	
}
