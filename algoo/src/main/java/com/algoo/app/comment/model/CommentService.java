package com.algoo.app.comment.model;

import java.util.List;
import java.util.Map;

public interface CommentService {
	public int insertComment(CommentVO cmtVo);
	public List<CommentVO> selectComment(int freeNo);
	public int insertReply(CommentVO vo);
	public void deleteComment(Map<String, String> map);
	public CommentVO selectCommentByNo(int cmtNo);
	public int commentCount(int freeNo);
}
