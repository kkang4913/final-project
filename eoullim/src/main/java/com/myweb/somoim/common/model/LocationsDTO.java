package com.myweb.somoim.common.model;

public class LocationsDTO {
	private int locationId;
	private String locationName;
	
	public int getLocationId() {
		return locationId;
	}
	
	public void setLocationId(int locationId) {
		this.locationId = locationId;
	}
	
	public String getLocationName() {
		return locationName;
	}
	
	public void setLocationName(String locationName) {
		this.locationName = locationName;
	}
	
	@Override
	public String toString() {
		return "LocationsDTO [locationId=" + locationId + ", locationName=" + locationName + "]";
	}
}
