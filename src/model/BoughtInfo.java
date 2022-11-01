package model;

import java.io.Serializable;

public class BoughtInfo extends MusicInfo implements Serializable {

	private int accountId;
	private String cartStateFlag;

	public BoughtInfo() {
	}

	public BoughtInfo(int accountId, int musicId, String cartStateFlag, String musicName, int artistId,
			String artistName, int price, String musicLink, String comment, String musicPath) {
		super(musicId, musicName, artistId, artistName, price, musicLink, comment, musicPath);
		this.accountId = accountId;
		this.cartStateFlag = cartStateFlag;
	}

	public int getAccountId() {
		return accountId;
	}

	public String getCartStateFlag() {
		return cartStateFlag;
	}
}
