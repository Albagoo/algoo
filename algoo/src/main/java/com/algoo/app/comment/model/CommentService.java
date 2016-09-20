package com.algoo.app.comment.model;

import java.util.List;

public interface CommentService {
	public int insertComment(CommentVO cmtVo);
	public List<CommentVO> selectComment(int freeNo);
	public int insertReply(CommentVO vo);
}
