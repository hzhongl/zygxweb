package com.hxx.service.impl;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import com.hxx.service.UploadFileCheck;

@Component
public class UploadImageCheckImpl implements UploadFileCheck {

	@Value("${file.image.suffix}")
	private String imagePassSuffix;
	@Value("${file.image.size}")
	private long imageMaxSize;
	@Value("${file.image.path}")
	private String imageSavePath;

	@Override
	public boolean passUpload(String fileSuffix) {
		if (imagePassSuffix.contains(fileSuffix))
			return true;
		return false;
	}

	//允许上传文件最大大小
	@Override
	public boolean passUploadFileMaxSize(long fileSize) {
		return fileSize < imageMaxSize;
	}
	
	// 允许上传的文件类型，根据文件后缀名获取文件保存路径
	@Override
	public String getFileSavePath(String fileSuffix) {
		return imageSavePath;
	}
	
}
