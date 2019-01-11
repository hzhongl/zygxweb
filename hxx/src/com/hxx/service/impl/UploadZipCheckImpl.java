package com.hxx.service.impl;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import com.hxx.service.UploadFileCheck;

@Component
public class UploadZipCheckImpl implements UploadFileCheck {

	@Value("${file.zip.suffix}")
	private String zipFilePassSuffix;
	@Value("${file.zip.size}")
	private long zipFileMaxSize;
	@Value("${file.zip.path}")
	private String zipFileSavePath;

	@Override
	public boolean passUpload(String fileSuffix) {
		if (zipFilePassSuffix.contains(fileSuffix))
			return true;
		return false;
	}
	
	@Override
	public boolean passUploadFileMaxSize(long fileSize) {
		return fileSize < zipFileMaxSize;
	}

	@Override
	public String getFileSavePath(String fileSuffix) {
		return zipFileSavePath;
	}

}
