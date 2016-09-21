package com.algoo.app.comment.model;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class CommentServiceImpl implements CommentService{

	@Autowired
	private CommentDAO cmtDao;
	
	@Override
	public int insertComment(CommentVO cmtVo) {
		return cmtDao.insertComment(cmtVo);
	}

	@Override
	public List<CommentVO> selectComment(int freeNo) {
		return cmtDao.selectComment(freeNo);
	}
	
	@Override
	@Transactional
	public int insertReply(CommentVO vo) {
		int cnt = cmtDao.updateSortNo(vo);
		
		cnt = cmtDao.insertReply(vo);
		
		return cnt;
	}

	@Override
	public void deleteComment(Map<String, String> map) {
		cmtDao.deleteComment(map);
	}

	@Override
	public CommentVO selectCommentByNo(int cmtNo) {
		return cmtDao.selectCommentByNo(cmtNo);
	}
}