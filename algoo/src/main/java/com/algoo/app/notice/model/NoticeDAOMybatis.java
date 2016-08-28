package com.algoo.app.notice.model;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeDAOMybatis extends SqlSessionDaoSupport 
implements NoticeDAO{
	
	private String namespace="config.mybatis.mapper.oracle.notice";
	
	public int insertNotice(NoticeVO noticeVo){
		//공지 등록
		return getSqlSession().insert(namespace
				+".insertNotice", noticeVo);
	}
	
	public List<NoticeVO> selectAll(NoticeVO noticeVo){
		//공지 리스트
		List<NoticeVO> alist
		=getSqlSession().selectList(namespace+".selectAll",
				noticeVo);
		
		return alist;
	}
	
	public NoticeVO selectByNo(int mainNo){
		//공지 상세보기
		NoticeVO noticeVo
		=getSqlSession().selectOne(namespace
				+".selectByNo", mainNo);
		
		return noticeVo; 
	}
	
	public int updateNotice(NoticeVO noticeVo){
		//공지 수정
		return getSqlSession().update(namespace
				+".updateNotice", noticeVo);
	}
	
	public int deleteNotice(int mainNo){
		//공지 삭제
		return getSqlSession().delete(namespace
				+".deleteNotice", mainNo);
	}
}