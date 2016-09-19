package com.algoo.app.comment.model;

import java.util.List;

public interface CommentDAO {
	public int insertComment(CommentVO cmtVo);
	public List<CommentVO> selectComment(int freeNo);
	public int updateSortNo(CommentVO vo);
	public int insertReply(CommentVO vo);
}