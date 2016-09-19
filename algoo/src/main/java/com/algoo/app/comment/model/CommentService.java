package com.algoo.app.comment.model;

import java.util.List;

import com.algoo.app.common.SearchVO;

public interface CommentService {
	public int insertComment(CommentVO cmtVo);
	public List<CommentVO> selectComment(int freeNo);
}
