package com.myweb.somoim.moim.model;

import java.sql.Date;

public class BoardsDTO {
	private int moimId;
	private int boardId;
	private String memberId;
	private String boardTitle;
	private String content;
	private Date boardCreateDate;
	private int like;
	private String memberName; //추가
	private String jobName; //추가
	private String moimTitle;
	private String memberImagePath;
	private int commentCount; //추가

	public String getMemberImagePath() {
		return memberImagePath;
	}

	public void setMemberImagePath(String memberImagePath) {
		this.memberImagePath = memberImagePath;
	}

	public Date getBoardCreateDate() {
		return boardCreateDate;
	}

	public void setBoardCreateDate(Date boardCreateDate) {
		this.boardCreateDate = boardCreateDate;
	}

	public String getMoimTitle() {
		return moimTitle;
	}

	public void setMoimTitle(String moimTitle) {
		this.moimTitle = moimTitle;
	}

	public int getMoimId() {
		return moimId;
	}
	
	public void setMoimId(int moimId) {
		this.moimId = moimId;
	}
	
	public int getBoardId() {
		return boardId;
	}
	
	public void setBoardId(int boardId) {
		this.boardId = boardId;
	}
	
	public String getMemberId() {
		return memberId;
	}
	
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	
	public String getBoardTitle() {
		return boardTitle;
	}
	
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	
	public String getContent() {
		return content;
	}
	
	public void setContent(String content) {
		this.content = content;
	}

	public int getLike() {
		return like;
	}
	
	public void setLike(int like) {
		this.like = like;
	}
	
	
	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getJobName() {
		return jobName;
	}

	public void setJobName(String jobName) {
		this.jobName = jobName;
	}
	
	
	public int getCommentCount() {
		return commentCount;
	}

	public void setCommentCount(int commentCount) {
		this.commentCount = commentCount;
	}

	@Override
	public String toString() {
		return "BoardsDTO [moimId=" + moimId + ", boardId=" + boardId + ", memberId=" + memberId + ", boardTitle="
				+ boardTitle + ", content=" + content + ", boardCreateDate=" + boardCreateDate + ", like=" + like
				+ ", memberName=" + memberName + ", jobName=" + jobName + ", moimTitle=" + moimTitle
				+ ", memberImagePath=" + memberImagePath + ", commentCount=" + commentCount + "]";
	}


}
