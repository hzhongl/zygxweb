package com.hxx.service;

import org.springframework.web.multipart.MultipartFile;

import com.hxx.domain.ResultMessage;

public interface UploadFileUtilsService {
	
	public ResultMessage uploadFiles(MultipartFile[] files);
	
}
