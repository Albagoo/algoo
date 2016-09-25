package com.algoo.app.admin.model;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.algoo.app.common.SearchVO;
import com.algoo.app.member.model.MemberVO;


public interface AdminMemberService {
	public static final int EXIST_ID=1;
	public static final int NONE_EXIST_ID=2;
	
	public static final int LOGIN_OK=1;
	public static final int PWD_DISAGREE=2;
	public static final int ID_NONE=3;
	
	public List<MemberVO> selectMemberList(SearchVO searchVo);
	public int selectMemberCount(SearchVO searchVo);
	public int deleteMem(String userid);
	public int updateMem(MemberVO memberVo);
	public int checkUserid(String userid);
	public int loginCheck(AdminMemberVO adminMemberVo);
	public AdminMemberVO selectAdminByUserid(String userid);
	public List<MemberVO> selectAll();
	public List<MemberVO> xlsExcelReader(MultipartHttpServletRequest req);
	public List<MemberVO> xlsxExcelReader(MultipartHttpServletRequest req);
}
