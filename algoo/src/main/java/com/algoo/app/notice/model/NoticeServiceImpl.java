package com.algoo.app.notice.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	public List<NoticeVO> selectAll(){
		return noticeDao.selectAll();
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

	@Override
	public NoticeVO prevContent(int no) {
		return noticeDao.prevContent(no);
	}

	@Override
	public NoticeVO nextContent(int no) {
		return noticeDao.nextContent(no);
	}
	
	@Override
	@Transactional
	public int deleteSelectNotice(List<NoticeVO> nList) {
		int cnt=0;
		try{
			for(NoticeVO vo : nList){
				int no=vo.getMainNo();
				if(no!=0){
					cnt=noticeDao.deleteNotice(no);
				}
			}//for
		}catch(RuntimeException e){
			e.printStackTrace();
			cnt=-1;
		}
		
		return cnt;
	}
}