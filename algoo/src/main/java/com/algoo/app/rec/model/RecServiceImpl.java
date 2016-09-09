package com.algoo.app.rec.model;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.algoo.app.company.model.CompanyVO;
import com.algoo.app.service.model.ServiceDAO;
import com.algoo.app.service.model.ServiceVO;

@Service
public class RecServiceImpl implements RecService{

	@Autowired
	private RecDAO recDao;
	@Autowired
	private ServiceDAO serviceDao;
	
	private static final Logger logger
	=LoggerFactory.getLogger(RecServiceImpl.class);
	
	@Override
	public RecVO selectRecByCode(int recCode) {
		return recDao.selectRecByCode(recCode);
	}

	@Override
	public CompanyVO selectCompanyByCode(int compCode) {
		return recDao.selectCompanyByCode(compCode);
	}

	@Override
	public ServiceVO selectServiceByCode(int serviceCode) {
		return recDao.selectServiceByCode(serviceCode);
	}

	
	@Override
	public int selectTotalCount(RecSeachVO vo) {
		return recDao.selectTotalCount(vo);
	}

	@Override
	public List<RecVO> selectAllRec(RecSeachVO vo) {
		return recDao.selectAllRec(vo);
	}

	@Override
	public int updateReadCount(int readCount) {
		return recDao.updateReadCount(readCount);
	}

	@Override
	@Transactional
	public int intsertRec(RecVO rVo, ServiceVO sVo) {
		int cnt=0;
		int res = serviceDao.selectByNew();
		sVo.setServiceCode(res);
		cnt=recDao.insertSevice(sVo);
		logger.info("rec서비스 파라미터,rVo={},sVo={}",
				rVo,sVo);
		logger.info("서비스시퀀스번호?={}",res);
		
		rVo.setServiceCode(res);
		cnt=recDao.intsertRec(rVo);
		
		return cnt;
	}

	@Override
	public List<Map<String, Object>> selectJobName() {
		return recDao.selectJobName();
	}

	@Override
	public List<Map<String, Object>> selectJobName2(String jobName) {
		return recDao.selectJobName2(jobName);
	}

}
