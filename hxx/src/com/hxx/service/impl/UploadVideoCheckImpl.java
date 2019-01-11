package com.hxx.service.impl;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import com.hxx.service.UploadFileCheck;

@Component
public class UploadVideoCheckImpl implements UploadFileCheck {

	@Value("${file.video.suffix}")
	private String videoPassSuffix;
	@Value("${file.video.size}")
	private long videoMaxSize;
	@Value("${file.video.path}")
	private String videoSavePath;

	@Override
	public boolean passUpload(String fileSuffix) {
		return videoPassSuffix.contains(fileSuffix);
	}

	@Override
	public boolean passUploadFileMaxSize(long fileSize) {
		return fileSize < videoMaxSize;
	}

	@Override
	public String getFileSavePath(String fileSuffix) {
		return videoSavePath;
	}

}
