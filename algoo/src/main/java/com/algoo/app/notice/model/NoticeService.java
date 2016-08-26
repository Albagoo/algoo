package com.algoo.app.notice.model;

import java.util.List;

public interface NoticeService {
	public int insertNotice(NoticeVO noticeVo);
	public List<NoticeVO> selectAll(NoticeVO noticeVo);
	public NoticeVO selectByNo(int mainNo);
	public int updateNotice(NoticeVO noticeVo);
	public int deleteNotice(int mainNo);
}