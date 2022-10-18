package com.myweb.somoim.participants.model;

public class MoimParticipantsDTO {
	private String memberId;
	private int jobId;
	private int moimId;
	private String memberName;
	private String JobName;
	private String memberImagePath;
	private String locationName;
	private int currentMemberCount;
	private int memberJoinMoimCount;

	public String getLocationName() {
		return locationName;
	}

	public void setLocationName(String locationName) {
		this.locationName = locationName;
	}

	public String getMemberId() {
		return memberId;
	}
	
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	
	public int getJobId() {
		return jobId;
	}
	
	public void setJobId(int jobId) {
		this.jobId = jobId;
	}
	
	public int getMoimId() {
		return moimId;
	}
	
	public void setMoimId(int moimId) {
		this.moimId = moimId;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getJobName() {
		return JobName;
	}

	public void setJobName(String jobName) {
		JobName = jobName;
	}

	public String getMemberImagePath() {
		return memberImagePath;
	}

	public void setMemberImagePath(String memberImagePath) {
		this.memberImagePath = memberImagePath;
	}
	
	public int getCurrentMemberCount() {
		return currentMemberCount;
	}

	public void setCurrentMemberCount(int currentMemberCount) {
		this.currentMemberCount = currentMemberCount;
		
	}
	
	public int getMemberJoinMoimCount() {
		return memberJoinMoimCount;
	}

	public void setMemberJoinMoimCount(int memberJoinMoimCount) {
		this.memberJoinMoimCount = memberJoinMoimCount;
		
	}

	@Override
	public String toString() {
		return "MoimParticipantsDTO [memberId=" + memberId + ", jobId=" + jobId + ", moimId=" + moimId + ", memberName="
				+ memberName + ", JobName=" + JobName + ", memberImagePath=" + memberImagePath + ", currentMemberCount="
				+ currentMemberCount + "]";
	}


}
