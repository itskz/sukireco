package model;

import java.io.Serializable;

public class Bought implements Serializable {
	private int accountId;
	private int musicId;
	private String cartStateFlag;

	public Bought() {
	}

	public Bought(int accountId, int musicId, String cartStateFlag) {
		this.accountId = accountId;
		this.musicId = musicId;
		this.cartStateFlag = cartStateFlag;
	}

	public int getAccountId() {
		return accountId;
	}

	public int getMusicId() {
		return musicId;
	}

	public String getCartStateFlag() {
		return cartStateFlag;
	}

	public void setCartStateFlag(String cartStateFlag) {
		this.cartStateFlag = cartStateFlag;
	}
}
