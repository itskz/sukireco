package model;

import java.io.Serializable;

public class Music implements Serializable {
	private int musicId;
	private String musicName;
	private int artistId;
	private int price;
	private String musicLink;
	private String comment;
	private String musicPath;

	public Music() {
	}

	public Music(int musicId, String musicName, int artistId, int price, String musicLink, String comment, String musicPath) {
		this.musicId = musicId;
		this.musicName = musicName;
		this.artistId = artistId;
		this.price = price;
		this.musicLink = musicLink;
		this.comment = comment;
		this.musicPath = musicPath;
	}

	public int getMusicId() {
		return musicId;
	}

	public String getMusicName() {
		return musicName;
	}

	public int getArtistId() {
		return artistId;
	}

	public int getPrice() {
		return price;
	}

	public String getMusicLink() {
		return musicLink;
	}

	public String getComment() {
		return comment;
	}

	public String getMusicPath() {
		return musicPath;
	}
}
