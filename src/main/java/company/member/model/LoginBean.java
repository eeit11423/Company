package company.member.model;

public class LoginBean {
	String userId;
	String password;
	boolean rememberMe;
	
	public LoginBean() {
		super();
	}

	public LoginBean(String userId, String password, boolean rememberMe) {
		super();
		this.userId = userId;
		this.password = password;
		this.rememberMe = rememberMe;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public boolean isRememberMe() {
		return rememberMe;
	}

	public void setRememberMe(boolean rememberMe) {
		this.rememberMe = rememberMe;
	}
	
	
}
