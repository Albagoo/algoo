package com.algoo.app.comment.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.algoo.app.common.SearchVO;

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

}
