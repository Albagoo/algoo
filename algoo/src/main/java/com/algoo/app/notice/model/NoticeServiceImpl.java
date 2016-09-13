package com.algoo.app.notice.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.algoo.app.notice.common.ListNoticeVO;

@Service
public class NoticeServiceImpl implements NoticeService{
	
	@Autowired
	private NoticeDAO noticeDao;

	@Override
	public int insertNotice(NoticeVO noticeVo) {
		int cnt = noticeDao.insertNotice(noticeVo);
		return cnt;
	}
	
	@Override
	public List<NoticeVO> selectAll(NoticeVO noticeVo){
		return noticeDao.selectAll(noticeVo);
	}
	
	@Override	//08-31
	public List<NoticeVO> selectByCategory(ListNoticeVO vo) {
		return noticeDao.selectByCategory(vo);
	}
	
	@Override	//08-31
	public int selectTotalCount(ListNoticeVO vo) {
		return noticeDao.selectTotalCount(vo);
	}

	@Override	//09-02
	public List<NoticeVO> searchCategory(ListNoticeVO vo) {
		return noticeDao.searchCategory(vo);
	}

	@Override
	public NoticeVO selectByNo(int no){
		return noticeDao.selectByNo(no);
	}
	
	@Override
	public int updateNotice(NoticeVO noticeVo){
		return noticeDao.updateNotice(noticeVo);
	}
	
	public int deleteNotice(int no){
		return noticeDao.deleteNotice(no);
	}
}