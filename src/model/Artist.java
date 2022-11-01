package model;

import java.io.Serializable;

public class Artist implements Serializable {
	private int artistId;
	private String artistName;

	public Artist() {
	}

	public Artist(int artistId, String artistName) {
		this.artistId = artistId;
		this.artistName = artistName;
	}

	public int getArtistId() {
		return artistId;
	}

	public String getArtistName() {
		return artistName;
	}
}
