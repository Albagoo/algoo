package com.algoo.app.notice.model;

import java.util.List;

import com.algoo.app.notice.common.ListNoticeVO;

public interface NoticeDAO {
	public int insertNotice(NoticeVO noticeVo);
	public List<NoticeVO> selectAll(NoticeVO noticeVo);
	public List<NoticeVO> selectByCategory(ListNoticeVO vo); //08-31 카테고리로 검색
	public int selectTotalCount(ListNoticeVO vo); //08-31 카테고리로 검색
	public int updateReadCount(int no);
	public NoticeVO selectByNo(int no);
	public int updateNotice(NoticeVO noticeVo);
	public int deleteNotice(int no);
}