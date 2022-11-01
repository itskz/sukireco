package model;

import dao.MusicDAO;

public class FindMusicLogic {
	public MusicInfo execute(int musicId) {
		MusicDAO dao = new MusicDAO();
		MusicInfo mI = dao.findMusic(musicId);
		return mI;
	}
}
