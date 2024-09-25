package kr.happyjob.study.board.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import kr.happyjob.study.board.model.NoticeModel;

public interface NoticeService {
	public List<NoticeModel> noticeList(Map<String, Object> paramMap) throws Exception;

	public int noticeListCnt(Map<String, Object> paramMap) throws Exception;

	public int noticeSave(Map<String, Object> paramMap) throws Exception;

	public int noticeUpdate(Map<String, Object> paramMap) throws Exception;

	public int noticeDelete(Map<String, Object> paramMap) throws Exception;

	public NoticeModel noticeDetail(Map<String, Object> paramMap) throws Exception;

	public int noticeSaveFile(Map<String, Object> paramMap, HttpServletRequest request) throws Exception;

	public int noticeUpdateFile(Map<String, Object> paramMap, HttpServletRequest request) throws Exception;

	public List<NoticeModel> MainNoticeList(Map<String, Object> paramMap);
	
	public int noticeSaveFileJson(Map<String, Object> text, MultipartFile[] files) throws Exception;

	public int noticeUpdateJson(Map<String, Object> paramMap, MultipartFile[] files) throws Exception;
}
