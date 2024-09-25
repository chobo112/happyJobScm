package kr.happyjob.study.responsibilities.service;

import java.util.List;
import java.util.Map;

import kr.happyjob.study.responsibilities.vo.ReturnVO;

public interface ReturnService {

	List<ReturnVO> returnList(Map<String, Object> paramMap) throws Exception;

	List<ReturnVO> returnDetail(Map<String, Object> paramMap) throws Exception;

	int confirm(Map<String, Object> paramMap);

	int modeItemCount(Map<String, Object> paramMap);

	int returnCnt(Map<String, Object> paramMap);

}
