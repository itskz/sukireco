package model;

import java.io.Serializable;

public class MusicInfo extends Music implements Serializable {

	private String artistName;

	public MusicInfo() {
	}

	public MusicInfo(int musicId, String musicName, int artistId, String artistName, int price, String musicLink,
			String comment, String musicPath) {
		super(musicId, musicName, artistId, price, musicLink, comment, musicPath);
		this.artistName = artistName;
	}

	public String getArtistName() {
		return artistName;
	}
}
