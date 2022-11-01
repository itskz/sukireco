package model;

import java.util.List;

import dao.MusicDAO;

public class CreateMusicInfoLogic {
	public List<MusicInfo> execute() {
		MusicDAO dao = new MusicDAO();
		List<MusicInfo> musicInfoList = dao.findAll();
		return musicInfoList;
	}
}
