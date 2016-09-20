package com.algoo.app.notice.model;

import java.util.List;

import com.algoo.app.notice.common.ListNoticeVO;

public interface NoticeDAO {
	public int insertNotice(NoticeVO noticeVo);
	public List<NoticeVO> selectAll(NoticeVO noticeVo);
	public List<NoticeVO> selectByCategory(ListNoticeVO vo); //08-31 검색
	public int selectTotalCount(ListNoticeVO vo); //08-31
	public List<NoticeVO> searchCategory(ListNoticeVO vo); //09-02 카테고리 검색 
	public NoticeVO selectByNo(int no);
	public int updateNotice(NoticeVO noticeVo);
	public int deleteNotice(int no);
	public NoticeVO prevContent(int no);
	public NoticeVO nextContent(int no);
}