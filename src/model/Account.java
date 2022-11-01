package model;

import java.io.Serializable;

public class Account implements Serializable {
	private int accountId;
	private String accountName;
	private String mailAddress;
	private String password;
	private String creditNumber;

	public Account() {
	}

	public Account(String mailAddress, String password) {
		this.accountId = 0;
		this.accountName = "";
		this.mailAddress = mailAddress;
		this.password = password;
		this.creditNumber = "";
	}

	public Account(int accountId, String accountName, String mailAddress, String password, String creditNumber) {
		this.accountId = accountId;
		this.accountName = accountName;
		this.mailAddress = mailAddress;
		this.password = password;
		this.creditNumber = creditNumber;
	}

	public int getAccountId() {
		return accountId;
	}

	public String getAccountName() {
		return accountName;
	}

	public String getMailAddress() {
		return mailAddress;
	}

	public String getPassword() {
		return password;
	}

	public String getCreditNumber() {
		return creditNumber;
	}
}
