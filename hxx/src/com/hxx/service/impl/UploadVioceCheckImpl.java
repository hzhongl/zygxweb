package com.hxx.service.impl;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import com.hxx.service.UploadFileCheck;

@Component
public class UploadVioceCheckImpl implements UploadFileCheck {

	@Value("${file.vioce.suffix}")
	private String viocePassSuffix;
	@Value("${file.vioce.size}")
	private long vioceMaxSize;
	@Value("${file.vioce.path}")
	private String vioceSavePath;

	@Override
	public boolean passUpload(String fileSuffix) {
//		if (viocePassSuffix.contains(fileSuffix))
//			return true;
//		return false;
		return viocePassSuffix.contains(fileSuffix) ? true : false;
	}

	//允许上传文件最大大小
	@Override
	public boolean passUploadFileMaxSize(long fileSize) {
		return fileSize < vioceMaxSize;
	}
	
	// 允许上传的文件类型，根据文件后缀名获取文件保存路径
	@Override
	public String getFileSavePath(String fileSuffix) {
		return vioceSavePath;
	}
	
}
