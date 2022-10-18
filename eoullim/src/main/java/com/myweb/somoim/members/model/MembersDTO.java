package com.myweb.somoim.members.model;


public class MembersDTO {
	private String memberId;
	private String memberName;
	private String password;
	private String gender;
	private String birth;
	private String phone;
	private int LocationId;
	private String LocationName;
	private String category;
	private String bookmark;
	private String memberImagePath;
	private String infoImagePath;
	private String loginType;
		
	
	
	
	public String getLoginType() {
		return loginType;
	}
	public void setLoginType(String loginType) {
		this.loginType = loginType;
	}
	public String getLocationName() {
		return LocationName;
	}
	public void setLocationName(String locationName) {
		LocationName = locationName;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public int getLocationId() {
		return LocationId;
	}
	public void setLocationId(int locationId) {
		LocationId = locationId;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getBookmark() {
		return bookmark;
	}
	public void setBookmark(String bookmark) {
		this.bookmark = bookmark;
	}
	public String getMemberImagePath() {
		return memberImagePath;
	}
	public void setMemberImagePath(String memberImagePath) {
		this.memberImagePath = memberImagePath;
	}
	public String getInfoImagePath() {
		return infoImagePath;
	}
	public void setInfoImagePath(String infoImagePath) {
		this.infoImagePath = infoImagePath;
	}
	@Override
	public String toString() {
		return "MembersDTO [memberId=" + memberId + ", memberName=" + memberName + ", password=" + password
				+ ", gender=" + gender + ", birth=" + birth + ", phone=" + phone + ", LocationId=" + LocationId
				+ ", LocationName=" + LocationName + ", category=" + category + ", bookmark=" + bookmark
				+ ", memberImagePath=" + memberImagePath + ", infoImagePath=" + infoImagePath + ", loginType="
				+ loginType + "]";
	}

	
}
