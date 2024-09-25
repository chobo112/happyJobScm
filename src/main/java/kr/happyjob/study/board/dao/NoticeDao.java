package kr.happyjob.study.board.dao;

import java.util.List;
import java.util.Map;

import kr.happyjob.study.board.model.NoticeModel;

public interface NoticeDao {
	public List<NoticeModel> noticeList(Map<String, Object> paramMap) throws Exception;

	public int noticeListCnt(Map<String, Object> paramMap) throws Exception;

	public int noticeSave(Map<String, Object> paramMap) throws Exception;

	public int noticeUpdate(Map<String, Object> paramMap) throws Exception;

	public int noticeDelete(Map<String, Object> paramMap) throws Exception;

	public NoticeModel noticeDetail(Map<String, Object> paramMap) throws Exception;

	public int noticeSaveFile(Map<String, Object> paramMap);

	public int noticeUpdateFile(Map<String, Object> paramMap);
	
	public List<NoticeModel> MainNoticeList(Map<String, Object> paramMap);

	public int noticeSaveFileJson(Map<String, Object> paramMap);

	public int noticeUpdateJson(Map<String, Object> paramMap);

}
