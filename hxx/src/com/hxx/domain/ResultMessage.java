package com.hxx.domain;

import java.util.HashMap;
import java.util.Map;

public class ResultMessage {
	
	private int uploadFailNumber;
	private int uploadSuccessNumber;
	private Map<String, String> failMessages;
	private Map<String, String> successMessages;
	
	public ResultMessage() {
		failMessages = new HashMap<>();
		successMessages = new HashMap<>();
	}
	
	public int getUploadFailNumber() {
		return uploadFailNumber;
	}
	public void setUploadFailNumber(int uploadFailNumber) {
		this.uploadFailNumber = uploadFailNumber;
	}
	public int getUploadSuccessNumber() {
		return uploadSuccessNumber;
	}
	public void setUploadSuccessNumber(int uploadSuccessNumber) {
		this.uploadSuccessNumber = uploadSuccessNumber;
	}
	public Map<String, String> getFailMessages() {
		return failMessages;
	}
	public void setFailMessages(Map<String, String> failMessages) {
		this.failMessages = failMessages;
	}
	public Map<String, String> getSuccessMessages() {
		return successMessages;
	}
	public void setSuccessMessages(Map<String, String> successMessages) {
		this.successMessages = successMessages;
	}
	
}
