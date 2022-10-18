package com.myweb.somoim.common.model;

public class JobsDTO {
	private int jobId;
	private String jobName;
	
	public int getJobId() {
		return jobId;
	}
	
	public void setJobId(int jobId) {
		this.jobId = jobId;
	}
	
	public String getJobName() {
		return jobName;
	}
	
	public void setJobName(String jobName) {
		this.jobName = jobName;
	}
	
	@Override
	public String toString() {
		return "JobsDTO [jobId=" + jobId + ", jobName=" + jobName + "]";
	}
}
