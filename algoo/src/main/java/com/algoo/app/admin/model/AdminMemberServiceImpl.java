package com.algoo.app.admin.model;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.algoo.app.common.SearchVO;
import com.algoo.app.member.model.MemberDAO;
import com.algoo.app.member.model.MemberVO;



@Service
public class AdminMemberServiceImpl implements AdminMemberService{
	@Autowired
	private AdminMemberDAO adminMemberDao;
	
	@Autowired
	private MemberDAO memberDao;
	
	private static final Logger logger = LoggerFactory.getLogger(AdminMemberServiceImpl.class);


	@Override
	public int selectMemberCount(SearchVO searchVo) {
		return adminMemberDao.selectMemberCount(searchVo);
	}


	@Override
	public List<MemberVO> selectMemberList(SearchVO searchVo) {
		return adminMemberDao.selectMemberList(searchVo);
	}


	@Override
	public int deleteMem(String userid) {
		return adminMemberDao.deleteMem(userid);
	}


	@Override
	public int updateMem(MemberVO memberVo) {
		return adminMemberDao.updateMem(memberVo);
	}


	@Override
	public int checkUserid(String userid) {
		int result=0;
		int count = adminMemberDao.checkUserid(userid);
		if(count>0){ //해당 아이디가 이미 존재하는 경우
			result=EXIST_ID;
		}else{ //해당 아이디가 없는 경우
			result=NONE_EXIST_ID;
		}
		return result;
	}


	@Override
	public int loginCheck(AdminMemberVO adminMemberVo) {
		String dbPwd = adminMemberDao.loginCheck(adminMemberVo);
		int result=0;
		
		if(dbPwd==null || dbPwd.isEmpty()){
			result=ID_NONE;
		}else{
			if(dbPwd.equals(adminMemberVo.getPassword())){
				result=LOGIN_OK;
			}else{
				result=PWD_DISAGREE;
			}
		}
		return result;
	}


	@Override
	public AdminMemberVO selectAdminByUserid(String userid) {
		return adminMemberDao.selectAdminByUserid(userid);
	}


	@Override
	public List<MemberVO> selectAll() {
		return adminMemberDao.selectAll();
	}
	
	public List<MemberVO> xlsExcelReader(MultipartHttpServletRequest req) {
		// 반환할 객체를 생성
		List<MemberVO> list = new ArrayList<MemberVO>();
		
		MultipartHttpServletRequest multipartRequest
		=(MultipartHttpServletRequest)req;
		
		Map<String, MultipartFile> fileMap
		=multipartRequest.getFileMap();
		
		Iterator<String> iter = fileMap.keySet().iterator();
		while(iter.hasNext()){
			String key = iter.next();
			MultipartFile file = fileMap.get(key);
			logger.info(file+"");
			HSSFWorkbook workbook = null;
		
		
		try {
			// HSSFWorkbook은 엑셀파일 전체 내용을 담고 있는 객체
			workbook = new HSSFWorkbook(file.getInputStream());
	
			// 탐색에 사용할 Sheet, Row, Cell 객체
			HSSFSheet curSheet;
			HSSFRow curRow;
			HSSFCell curCell;
			MemberVO vo;
	
			// Sheet 탐색 for문
			for (int sheetIndex = 0; sheetIndex < workbook.getNumberOfSheets(); sheetIndex++) {
				// 현재 sheet 반환
				curSheet = workbook.getSheetAt(sheetIndex);
				logger.info(curSheet+"");
				// row 탐색 for문
				for (int rowIndex = 0; rowIndex < curSheet.getPhysicalNumberOfRows(); rowIndex++) {
					// row 0은 헤더정보이기 때문에 무시
					if (rowIndex != 0) {
						curRow = curSheet.getRow(rowIndex);
						vo = new MemberVO();
						String value;
	
						// row의 첫번째 cell값이 비어있지 않는 경우만 cell탐색
						if (curRow.getCell(0) != null) {
							if (!"".equals(curRow.getCell(0).getStringCellValue())) {
								// cell 탐색 for문
								for (int cellIndex = 0; cellIndex < curRow.getPhysicalNumberOfCells(); cellIndex++) {
									curCell = curRow.getCell(cellIndex);
									logger.info(curCell+"");
									// cell 스타일이 다르더라도 String으로 반환 받음
									switch (curCell.getCellType()) {
									case HSSFCell.CELL_TYPE_FORMULA:
										value = curCell.getCellFormula();
										break;
									case HSSFCell.CELL_TYPE_NUMERIC:
										value = curCell.getNumericCellValue() + "";
										break;
									case HSSFCell.CELL_TYPE_STRING:
										value = curCell.getStringCellValue() + "";
										break;
									case HSSFCell.CELL_TYPE_BLANK:
										value = curCell.getBooleanCellValue() + "";
										break;
									case HSSFCell.CELL_TYPE_ERROR:
										value = curCell.getErrorCellValue() + "";
										break;
									default:
										value = new String();
										break;
									} // end switch

									// 현재 colum index에 따라서 vo입력
									switch (cellIndex) {
									case 0: // 아이디
										vo.setMemberCode(value);
										break;
									case 1: // 이름
										vo.setUserid(value);
										break;
									case 2: // 나이
										vo.setNickName(value);
										break;
									case 3: // 이메일
										vo.setPassword(value);
										break;
									case 4: // 이메일
										vo.setUserName(value);
										break;
									case 5: // 이메일
										vo.setBirth(value);
										break;
									case 6: // 이메일
										vo.setGender(value);
										break;
									case 7: // 이메일
										vo.setEmail1(value);
										break;
									case 8: // 이메일
										vo.setEmail2(value);
										break;
									case 9: // 이메일
										vo.setHp1(value);
										break;
									case 10: // 이메일
										vo.setHp2(value);
										break;
									case 11: // 이메일
										vo.setHp3(value);
										break;
									case 12: // 이메일
										vo.setZipcode(value);
										break;
									case 13: // 이메일
										vo.setAddress(value);
										break;
									/*case 14: // 이메일
										vo.setAddressDetail(value);
										break;*/
									/*case 15: // 이메일
										vo.setPhoto(value);
										break;*/
									/*case 16: // 이메일
										vo.setJoinDate(value);
										break;
									case 17: // 이메일
										vo.setOutDate(value);
										break;*/
									default:
										break;
									}
								} // end for
								// cell 탐색 이후 vo 추가
								list.add(vo);
							} // end
						} // end if
					}
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		}
		logger.info("list.size() = {}", list.size());
		
		// 디비에 insert
		for(MemberVO memberVo : list){
			logger.info(""+memberVo);
			memberDao.insertMember(memberVo);
		}
		
		return list;
	}
	
	public List<MemberVO> xlsxExcelReader(MultipartHttpServletRequest req) {
		// 반환할 객체를 생성
		List<MemberVO> list = new ArrayList<MemberVO>();
		
		MultipartHttpServletRequest multipartRequest
		=(MultipartHttpServletRequest)req;
		
		Map<String, MultipartFile> fileMap
		=multipartRequest.getFileMap();
		
		Iterator<String> iter = fileMap.keySet().iterator();
		while(iter.hasNext()){
			String key = iter.next();
			MultipartFile file = fileMap.get(key);
		XSSFWorkbook workbook = null;

		try {
		// HSSFWorkbook은 엑셀파일 전체 내용을 담고 있는 객체
		workbook = new XSSFWorkbook(file.getInputStream());

		// 탐색에 사용할 Sheet, Row, Cell 객체
		XSSFSheet curSheet;
		XSSFRow curRow;
		XSSFCell curCell;
		MemberVO vo;

		// Sheet 탐색 for문
		for (int sheetIndex = 0; sheetIndex < workbook.getNumberOfSheets(); sheetIndex++) {
		// 현재 sheet 반환
		curSheet = workbook.getSheetAt(sheetIndex);
		// row 탐색 for문
		for (int rowIndex = 0; rowIndex < curSheet.getPhysicalNumberOfRows(); rowIndex++) {
		// row 0은 헤더정보이기 때문에 무시
		if (rowIndex != 0) {
		curRow = curSheet.getRow(rowIndex);
		vo = new MemberVO();
		String value;

		// row의 첫번째 cell값이 비어있지 않는 경우만 cell탐색
		if (curRow.getCell(0) != null) {
		if (!"".equals(curRow.getCell(0).getStringCellValue())) {
		// cell 탐색 for문
		for (int cellIndex = 0; cellIndex < curRow.getPhysicalNumberOfCells(); cellIndex++) {
		curCell = curRow.getCell(cellIndex);

		if (true) {
		value = "";
		// cell 스타일이 다르더라도 String으로 반환 받음
		switch (curCell.getCellType()) {
		case HSSFCell.CELL_TYPE_FORMULA:
		value = curCell.getCellFormula();
		break;
		case HSSFCell.CELL_TYPE_NUMERIC:
		value = curCell.getNumericCellValue() + "";
		break;
		case HSSFCell.CELL_TYPE_STRING:
		value = curCell.getStringCellValue() + "";
		break;
		case HSSFCell.CELL_TYPE_BLANK:
		value = curCell.getBooleanCellValue() + "";
		break;
		case HSSFCell.CELL_TYPE_ERROR:
		value = curCell.getErrorCellValue() + "";
		break;
		default:
		value = new String();
		break;
		} // end switch

		// 현재 colum index에 따라서 vo입력
		switch (cellIndex) {
		case 0: // 아이디
			vo.setMemberCode(value);
			break;
		case 1: // 이름
			vo.setUserid(value);
			break;
		case 2: // 나이
			vo.setNickName(value);
			break;
		case 3: // 이메일
			vo.setPassword(value);
			break;
		case 4: // 이메일
			vo.setUserName(value);
			break;
		case 5: // 이메일
			vo.setBirth(value);
			break;
		case 6: // 이메일
			vo.setGender(value);
			break;
		case 7: // 이메일
			vo.setEmail1(value);
			break;
		case 8: // 이메일
			vo.setEmail2(value);
			break;
		case 9: // 이메일
			vo.setHp1(value);
			break;
		case 10: // 이메일
			vo.setHp2(value);
			break;
		case 11: // 이메일
			vo.setHp3(value);
			break;
		case 12: // 이메일
			vo.setZipcode(value);
			break;
		case 13: // 이메일
			vo.setAddress(value);
			break;
		case 14: // 이메일
			vo.setAddressDetail(value);
			break;
		case 15: // 이메일
			vo.setPhoto(value);
			break;
		case 16: // 이메일
			vo.setJoinDate(value);
			break;
		case 17: // 이메일
			vo.setOutDate(value);
			break;
		default:
			break;
		}
		} // end if
		} // end for
		// cell 탐색 이후 vo 추가
		list.add(vo);
		} // end
		} // end if
		}

		}
		}
		} catch (IOException e) {
		e.printStackTrace();
		}
		}
		// 디비에 insert
		for(MemberVO memberVo : list){
			memberDao.insertMember(memberVo);
		}
		return list;
		}

		


}
