package model;

import java.io.Serializable;

public class Login implements Serializable {

	private String mailAddress;
	private String password;

	public Login(String mailAddress, String password) {
		this.mailAddress = mailAddress;
		this.password = password;
	}

	public String getMailAddress() {
		return mailAddress;
	}

	public String getPassword() {
		return password;
	}

}
