package company.member.model;

public class ForgetBean {
	String memberEmail;
	String invalidCredentials;
	
	
	public ForgetBean() {
		super();
	}

	public ForgetBean(String memberEmail, String invalidCredentials) {
		super();
		this.memberEmail = memberEmail;
		this.invalidCredentials = invalidCredentials;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public String getInvalidCredentials() {
		return invalidCredentials;
	}

	public void setInvalidCredentials(String invalidCredentials) {
		this.invalidCredentials = invalidCredentials;
	}
	
	
	
}
