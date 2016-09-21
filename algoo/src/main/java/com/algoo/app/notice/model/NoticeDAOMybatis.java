package com.algoo.app.notice.model;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.algoo.app.notice.common.ListNoticeVO;

@Repository
public class NoticeDAOMybatis extends SqlSessionDaoSupport 
implements NoticeDAO{
	
	private String namespace="config.mybatis.mapper.oracle.notice";

	@Override
	public int insertNotice(NoticeVO noticeVo) {
		//공지 등록
		return getSqlSession().insert(namespace+".insertNotice", noticeVo);
	}
	
	@Override
	public List<NoticeVO> selectAll(){
		//공지 리스트
		List<NoticeVO> alist
		=getSqlSession().selectList(namespace+".selectAll");
		
		return alist;
	}
	
	@Override	//08-31
	public List<NoticeVO> selectByCategory(ListNoticeVO vo) {
		return getSqlSession().selectList(namespace
				+".selectByCategory", vo);
	}
	
	@Override	//08-31
	public int selectTotalCount(ListNoticeVO vo) {
		return getSqlSession().selectOne(namespace
				+".selectTotalCount", vo);
	}
	
	@Override	//09-02
	public List<NoticeVO> searchCategory(ListNoticeVO vo) {
		return getSqlSession().selectList(namespace
				+".searchCategory", vo);
	}

	@Override
	public NoticeVO selectByNo(int no){
		//공지 상세보기
		NoticeVO noticeVo
		=getSqlSession().selectOne(namespace
				+".selectByNo", no);
		
		return noticeVo; 
	}
	
	@Override
	public int updateNotice(NoticeVO noticeVo){
		//공지 수정
		return getSqlSession().update(namespace
				+".updateNotice", noticeVo);
	}
	
	@Override
	public int deleteNotice(int no){
		//공지 삭제
		return getSqlSession().delete(namespace
				+".deleteNotice", no);
	}

	@Override
	public NoticeVO prevContent(int no) {
		return getSqlSession().selectOne(namespace+".prevContent", no);
	}

	@Override
	public NoticeVO nextContent(int no) {
		return getSqlSession().selectOne(namespace+".nextContent", no);
	}
}