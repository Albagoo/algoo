package com.algoo.app.notice.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NoticeServiceImpl implements NoticeService{
	@Autowired
	private NoticeDAO noticeDao;
	
	public int insertNotice(NoticeVO noticeVo){
		int cnt = noticeDao.insertNotice(noticeVo);
		return cnt;
	}
	
	public List<NoticeVO> selectAll(NoticeVO noticeVo){
		return noticeDao.selectAll(noticeVo);
	}
	
	public NoticeVO selectByNo(int mainNo){
		return noticeDao.selectByNo(mainNo);
	}
	
	public int updateNotice(NoticeVO noticeVo){
		return noticeDao.updateNotice(noticeVo);
	}
	
	public int deleteNotice(int mainNo){
		return noticeDao.deleteNotice(mainNo);
	}
}