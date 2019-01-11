package com.hxx.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.Map;
import java.util.UUID;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.BeansException;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.hxx.domain.ResultMessage;
import com.hxx.service.UploadFileCheck;
import com.hxx.service.UploadFileUtilsService;



@Service
public class UploadFileUtilsServiceImpl implements UploadFileUtilsService, ApplicationContextAware {

	private Map<String, UploadFileCheck> uploadFileChecks;

	@Override
	public ResultMessage uploadFiles(MultipartFile[] files) {
		ResultMessage resultMessage = new ResultMessage();
		// 遍历所有上传文件
		for (int i = 0; i < files.length; i++) {
			resultMessage = saveFile(files[i], resultMessage);
		}
		return resultMessage;
	}

	private ResultMessage saveFile(MultipartFile uploadFile, ResultMessage resultMessage) {

		try {
			if (!uploadFile.isEmpty()) { // 文件不为空
				String fileSuffix = FilenameUtils.getExtension(uploadFile.getOriginalFilename()); // 文件后缀名

				UploadFileCheck uploadFileCheckImpl = uploadFileChecks.values().stream()
						.filter(uploadFileCheck -> uploadFileCheck.passUpload(fileSuffix.toLowerCase()))
						.findFirst().orElseThrow(() -> new RuntimeException("不支持的文件格式"));
				String fileSavePath = uploadFileCheckImpl.getFileSavePath(fileSuffix);

				if (uploadFileCheckImpl.passUploadFileMaxSize(uploadFile.getSize())) {
					File localFile = new File(System.getProperty("webapp.root") //项目根路径（绝对路径）
							+ fileSavePath
							+ UUID.randomUUID() // 随机字符串，避免文件重名
							+ "_" + uploadFile.getOriginalFilename() // 原文件名
							);
					if (!localFile.getParentFile().exists()) { //父级路径不存在就创建
						localFile.getParentFile().mkdirs();
					}
					try {
						uploadFile.transferTo(localFile); // 转存文件
						System.out.println("文件保存成功");
						resultMessage.setUploadSuccessNumber(resultMessage.getUploadSuccessNumber() + 1);
						resultMessage.getSuccessMessages().put(uploadFile.getOriginalFilename(), fileSavePath + localFile.getName());
						System.out.println("文件路径:"+resultMessage.getSuccessMessages());
					} catch (IllegalStateException e) {
						e.printStackTrace();
					} catch (IOException e) {
						e.printStackTrace();
					}
				} else {
					resultMessage.setUploadFailNumber(resultMessage.getUploadFailNumber() + 1);
					resultMessage.getFailMessages().put(uploadFile.getOriginalFilename(), "文件大小超过限制");
				}
			}
			else {
				resultMessage.getFailMessages().put(uploadFile.getOriginalFilename(), "上传文件为空");
			}
		} catch (RuntimeException e) {
			e.printStackTrace();
			resultMessage.setUploadFailNumber(resultMessage.getUploadFailNumber() + 1);
			resultMessage.getFailMessages().put(uploadFile.getOriginalFilename(), e.getMessage());
		}

		return resultMessage;
	}

	@Override
	public void setApplicationContext(ApplicationContext context) throws BeansException {
		uploadFileChecks = context.getBeansOfType(UploadFileCheck.class);
	}

}
