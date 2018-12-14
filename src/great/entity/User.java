package great.entity;

import org.springframework.stereotype.Component;

@Component
public class User {
	int userId;
	String userStatus;
	String userName;
	String userPwd;
	String userSex;
	String userMajor;
	String userJob;
	String userPhone;
	String userEmail;
	int userScore;
	String transName;
	public User() {
		super();
	}
	public User(int userId, String userStatus, String userName, String userPwd, String userSex, String userMajor,
			String userJob, String userPhone, String userEmail, int userScore) {
		super();
		this.userId = userId;
		this.userStatus = userStatus;
		this.userName = userName;
		this.userPwd = userPwd;
		this.userSex = userSex;
		this.userMajor = userMajor;
		this.userJob = userJob;
		this.userPhone = userPhone;
		this.userEmail = userEmail;
		this.userScore = userScore;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getUserStatus() {
		return userStatus;
	}
	public void setUserStatus(String userStatus) {
		this.userStatus = userStatus;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
	public String getUserSex() {
		return userSex;
	}
	public void setUserSex(String userSex) {
		this.userSex = userSex;
	}
	public String getUserMajor() {
		return userMajor;
	}
	public void setUserMajor(String userMajor) {
		this.userMajor = userMajor;
	}
	public String getUserJob() {
		return userJob;
	}
	public void setUserJob(String userJob) {
		this.userJob = userJob;
	}
	public String getUserPhone() {
		return userPhone;
	}
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public int getUserScore() {
		return userScore;
	}
	public void setUserScore(int userScore) {
		this.userScore = userScore;
	}
	@Override
	public String toString() {
		return "User [userId=" + userId + ", userStatus=" + userStatus + ", userName=" + userName + ", userPwd="
				+ userPwd + ", userSex=" + userSex + ", userMajor=" + userMajor + ", userJob=" + userJob
				+ ", userPhone=" + userPhone + ", userEmail=" + userEmail + ", userScore=" + userScore + "]";
	}

}
