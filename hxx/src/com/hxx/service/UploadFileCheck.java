package com.hxx.service;

public interface UploadFileCheck {
	
	// 允许上传的文件类型
	public boolean passUpload(String fileSuffix);
	
	// 允许上传文件最大大小
	public boolean passUploadFileMaxSize(long fileSize);
	
	// 根据文件后缀名获取文件保存路径
	public String getFileSavePath(String fileSuffix);
}
