package com.algoo.app.common;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@Component
public class FileUploadWebUtil {
	private static final Logger logger
	=LoggerFactory.getLogger(FileUploadWebUtil.class);
	
	//File Constant
	public static final int PDS_UPLOAD=1; //PDS File
	public static final int IMAGE_UPLOAD=2; //Image File
	
	@Resource(name="fileUploadProperties")
	private Properties fileUploadProps;
	
	public List<Map<String, Object>> FileUpload(
			HttpServletRequest request,
			int uploadType){
		//Exclusive Upload Class
		MultipartHttpServletRequest multipartRequest
		=(MultipartHttpServletRequest) request;
		
		Map<String, MultipartFile> fileMap
		=multipartRequest.getFileMap();
		
		//Result Save List Collection
		List<Map<String, Object>> fileList
		= new ArrayList<Map<String, Object>>();
		
		Iterator<String> iter = fileMap.keySet().iterator();
		while(iter.hasNext()){
			String key = iter.next();
			MultipartFile tempFile = fileMap.get(key);
			
			//Case by Exist Upload File
			//-> Operate FileName, FileSize Upload
			if(!tempFile.isEmpty()){
				String ofileName = tempFile.getOriginalFilename();
				logger.info("업로드 원본 파일명={}", ofileName);
				
				//Change FileName
				String fileName = getUniqueFileName(ofileName);
				logger.info("업로드 변경된 파일명={}", fileName);
				
				//Operate FileSize
				long fileSize = tempFile.getSize();
				
				//Operate Upload
				try{
					//Operate UploadPath
					String upPath
					= getUploadPath(request, uploadType);
					
					//Make File Object
					File file = new File(upPath, fileName);
					
					//Operate Upload
					tempFile.transferTo(file);
				}catch(IOException e){
					e.printStackTrace();
				}
				//FileName, FileSize is Save for Map
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("fileName", fileName);
				map.put("fileSize", fileSize);
				
				//Map is Save for List
				fileList.add(map);
			} //if
		} //while
		return fileList;
	}
	
	public String getUniqueFileName(String ofileName){
		//Change FileName for CurrentTime 
		//-> abc20160818.txt
		int idx = ofileName.lastIndexOf(".");
		//Extract pure FileName
		String fName = ofileName.substring(0, idx);
		//Extract included '.' for extension -> .txt
		String ext = ofileName.substring(idx);
		
		//Linked extension for the pure FileName and CurrentTime
		String fileName = fName+getCurrentTime()+ext;
		
		return fileName;
	}
	
	public String getCurrentTime(){
		//Apply CurrentTime for msec
		Date today = new Date();
		SimpleDateFormat sdf
		= new SimpleDateFormat("yyyyMMddHHmmssSSS");
		String str = sdf.format(today);
		
		return str;
	}
	
	public String getUploadPath(HttpServletRequest request,
			int uploadType){
		//Operate for UploadPath
		String realPath="";
		
		String type=
		fileUploadProps.getProperty("file.upload.type");
		
		if(type.equals("test")){
			//Case by test -> Operate for UploadPath
			if(uploadType==PDS_UPLOAD){
				//PDS File Upload
				realPath
				=fileUploadProps.getProperty("file.upload.path.test");
			}else{
				//File Image Upload on Case by Insert Article
				realPath = fileUploadProps.getProperty("imageFile.upload.path.test");
			}
			
			logger.info("테스트 경로={}", realPath);
		}else{
			//Case by real distribute
			if(uploadType==PDS_UPLOAD){
				//PDS
				realPath
				=fileUploadProps.getProperty("file.upload.path.test");
			}else{
				//Image
				realPath
				=fileUploadProps.getProperty("imageFile.upload.path.test");
			}
			
			realPath
			=fileUploadProps.getProperty("file.upload.path");
			
			logger.info("실제 배포시 경로={}", realPath);
			//Operate for Physical Path
			realPath
			=request.getSession().getServletContext().getRealPath(realPath);
			
			logger.info("실제 배포시 물리적 경로={}", realPath);
		} //if
		
		return realPath;
	}
}