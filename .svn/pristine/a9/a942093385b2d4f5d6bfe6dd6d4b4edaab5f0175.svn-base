package kr.happyjob.study.board.service;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.happyjob.study.board.dao.InquiryDao;
import kr.happyjob.study.board.model.InquiryModel;
import kr.happyjob.study.common.comnUtils.FileUtilCho;

@Service
public class InquiryServiceImpl implements InquiryService {

	@Autowired
	InquiryDao inquiryDao;


	@Override
	public List<InquiryModel> inquiryList(Map<String, Object> paramMap) throws Exception {

		return inquiryDao.inquiryList(paramMap);
	}

	@Override
	public int inquiryListCnt(Map<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return inquiryDao.inquiryListCnt(paramMap);
	}

	@Override
	public int inquirySave(Map<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return inquiryDao.inquirySave(paramMap); 
	}

	@Override
	public List<InquiryModel> categoryList(Map<String, Object> paramMap) throws Exception {
		return inquiryDao.categoryList(paramMap);
	}

	@Override
	public InquiryModel inquiryDetail(Map<String, Object> paramMap) throws Exception {
		return inquiryDao.inquiryDetail(paramMap);
	}

	@Override
	public int inquiryDelete(Map<String, Object> paramMap) throws Exception {
		return inquiryDao.inquiryDelete(paramMap);
	}

	@Override
	public int inquiryUpdate(Map<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return inquiryDao.inquiryUpdate(paramMap);
	}

	@Override
	public InquiryModel answerDetail(Map<String, Object> paramMap) throws Exception {
		return inquiryDao.answerDetail(paramMap);
	}

	@Override
	public int answerChk(Map<String, Object> paramMap) throws Exception {
		return inquiryDao.answerChk(paramMap);
	}

	@Override
	public int answerInsert(Map<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return inquiryDao.answerInsert(paramMap);
	}

	@Override
	public int answerUpdate(Map<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return inquiryDao.answerUpdate(paramMap);
	}

	@Override
	public int answerDelete(Map<String, Object> paramMap) throws Exception {
		// TODO Auto-generated method stub
		return inquiryDao.answerDelete(paramMap);
	}



}
