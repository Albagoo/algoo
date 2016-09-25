package com.algoo.app.excel;

import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.web.servlet.view.document.AbstractExcelView;

import com.algoo.app.member.model.MemberVO;

public class ExcelView extends AbstractExcelView {

	@Override
	protected void buildExcelDocument(Map<String, Object> ModelMap, HSSFWorkbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String excelName = null;
		HSSFSheet worksheet = null;
		HSSFRow row = null;

		@SuppressWarnings("unchecked")
			List<MemberVO> list = (List<MemberVO>)ModelMap.get("excelList");
			excelName = URLEncoder.encode("MYMEMBER_LIST", "UTF-8");
			worksheet = workbook.createSheet(excelName + " WorkSheet");
			row = worksheet.createRow(0);
			row.createCell(0).setCellValue("회원코드");
			row.createCell(1).setCellValue("아이디");
			row.createCell(2).setCellValue("닉네임");
			row.createCell(3).setCellValue("비밀번호");
			row.createCell(4).setCellValue("이름");
			row.createCell(5).setCellValue("생일");
			row.createCell(6).setCellValue("성별");
			row.createCell(7).setCellValue("email1");
			row.createCell(8).setCellValue("email2");
			row.createCell(9).setCellValue("hp1");
			row.createCell(10).setCellValue("hp2");
			row.createCell(11).setCellValue("hp3");
			row.createCell(12).setCellValue("우편번호");
			row.createCell(13).setCellValue("주소");
			row.createCell(14).setCellValue("상세주소");
			row.createCell(15).setCellValue("사진이름");
			row.createCell(16).setCellValue("가입일");
			row.createCell(17).setCellValue("탈퇴일");
			for (int i = 1; i < list.size() + 1; i++) {
			row = worksheet.createRow(i);
			row.createCell(0).setCellValue(list.get(i - 1).getMemberCode());
			row.createCell(1).setCellValue(list.get(i - 1).getUserid());
			row.createCell(2).setCellValue(list.get(i - 1).getNickName());
			row.createCell(3).setCellValue(list.get(i - 1).getPassword());
			row.createCell(4).setCellValue(list.get(i - 1).getUserName());
			row.createCell(5).setCellValue(list.get(i - 1).getBirth());
			row.createCell(6).setCellValue(list.get(i - 1).getGender());
			row.createCell(7).setCellValue(list.get(i - 1).getEmail1());
			row.createCell(8).setCellValue(list.get(i - 1).getEmail2());
			row.createCell(9).setCellValue(list.get(i - 1).getHp1());
			row.createCell(10).setCellValue(list.get(i - 1).getHp2());
			row.createCell(11).setCellValue(list.get(i - 1).getHp3());
			row.createCell(12).setCellValue(list.get(i - 1).getZipcode());
			row.createCell(13).setCellValue(list.get(i - 1).getAddress());
			row.createCell(14).setCellValue(list.get(i - 1).getAddressDetail());
			row.createCell(15).setCellValue(list.get(i - 1).getPhoto());
			row.createCell(16).setCellValue(list.get(i - 1).getJoinDate()+"");
			row.createCell(17).setCellValue(list.get(i - 1).getOutDate()+"");
		}

		// 엑셀파일로 만듬
		response.setContentType("Application/Msexcel");
		// 다운받을때 헤더 설정
		response.setHeader("Content-Disposition", "ATTachment; Filename=" + excelName + ".xls");
		
	}
	
}
