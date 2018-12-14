package great.entity;

import org.springframework.stereotype.Component;

@Component
public class Transfer {
	
	int transId;
	String transName;
	String uploadTime;
	String transUser;
	int transScore;
	String transType;
	String transUrl;
	int transNo;
	int startIndex;
	int endIndex;
	public Transfer() {
		super();
	}
	public Transfer(int transId, String transName, String uploadTime, String transUser, int transScore,
			String transType, String transUrl, int transNo, int startIndex, int endIndex) {
		super();
		this.transId = transId;
		this.transName = transName;
		this.uploadTime = uploadTime;
		this.transUser = transUser;
		this.transScore = transScore;
		this.transType = transType;
		this.transUrl = transUrl;
		this.transNo = transNo;
		this.startIndex = startIndex;
		this.endIndex = endIndex;
	}
	public int getTransId() {
		return transId;
	}
	public void setTransId(int transId) {
		this.transId = transId;
	}
	public String getTransName() {
		return transName;
	}
	public void setTransName(String transName) {
		this.transName = transName;
	}
	public String getUploadTime() {
		return uploadTime;
	}
	public void setUploadTime(String uploadTime) {
		this.uploadTime = uploadTime;
	}
	public String getTransUser() {
		return transUser;
	}
	public void setTransUser(String transUser) {
		this.transUser = transUser;
	}
	public int getTransScore() {
		return transScore;
	}
	public void setTransScore(int transScore) {
		this.transScore = transScore;
	}
	public String getTransType() {
		return transType;
	}
	public void setTransType(String transType) {
		this.transType = transType;
	}
	public String getTransUrl() {
		return transUrl;
	}
	public void setTransUrl(String transUrl) {
		this.transUrl = transUrl;
	}
	public int getTransNo() {
		return transNo;
	}
	public void setTransNo(int transNo) {
		this.transNo = transNo;
	}
	public int getStartIndex() {
		return startIndex;
	}
	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}
	public int getEndIndex() {
		return endIndex;
	}
	public void setEndIndex(int endIndex) {
		this.endIndex = endIndex;
	}
	@Override
	public String toString() {
		return "Transfer [transId=" + transId + ", transName=" + transName + ", uploadTime=" + uploadTime
				+ ", transUser=" + transUser + ", transScore=" + transScore + ", transType=" + transType + ", transUrl="
				+ transUrl + ", transNo=" + transNo + ", startIndex=" + startIndex + ", endIndex=" + endIndex + "]";
	}
	
}
