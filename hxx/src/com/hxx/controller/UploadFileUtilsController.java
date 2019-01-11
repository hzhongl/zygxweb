package com.hxx.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.hxx.domain.ResultMessage;
import com.hxx.service.UploadFileUtilsService;

@Controller
public class UploadFileUtilsController {

	@Autowired
	private UploadFileUtilsService uploadFileUtilsService;

	@PostMapping("uploadFile.json")
	@ResponseBody
	public ResultMessage uploadFiles(@RequestParam("file") MultipartFile[] files) {
		return uploadFileUtilsService.uploadFiles(files);
	}
}
