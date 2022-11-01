package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.MusicInfo;

public class MusicDAO {
	private final String JDBC_URL = "jdbc:mysql://localhost:3306/"
			+ "sukkirirecord?characterEncoding=UTF-8&serverTimezone=Asia/Tokyo";
	private final String DB_USER = "root";
	private final String DB_PASS = "root";

	public MusicInfo findMusic(int musicId) {
		MusicInfo mI = new MusicInfo();

		try (Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)) {
			String sql = "SELECT * FROM MUSIC INNER JOIN ARTIST ON MUSIC.ARTIST_ID=ARTIST.ARTIST_ID WHERE MUSIC_ID=?";

			PreparedStatement pSt = conn.prepareStatement(sql);
			pSt.setInt(1, musicId);
			ResultSet rs = pSt.executeQuery();

			while (rs.next()) {
				String musicName = rs.getString("MUSIC_NAME");
				int artistId = rs.getInt("ARTIST_ID");
				String artistName = rs.getString("ARTIST_NAME");
				int price = rs.getInt("PRICE");
				String musicLink = rs.getString("MUSIC_LINK");
				String comment = rs.getString("COMMENT");
				String musicPath = rs.getString("MUSIC_PATH");
				mI = new MusicInfo(musicId, musicName, artistId, artistName, price, musicLink, comment, musicPath);

			}
		} catch (SQLException e) {
			// TODO 自動生成された catch ブロック
			e.printStackTrace();
			return null;
		}
		return mI;

	}

	public List<MusicInfo> findAll() {
		List<MusicInfo> musicInfoList = new ArrayList<>();

		try (Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)) {
			String sql = "SELECT * FROM MUSIC INNER JOIN ARTIST ON MUSIC.ARTIST_ID=ARTIST.ARTIST_ID ORDER BY ARTIST.ARTIST_NAME,MUSIC_NAME";
			PreparedStatement pSt = conn.prepareStatement(sql);

			ResultSet rs = pSt.executeQuery();

			while (rs.next()) {
				int musicId = rs.getInt("MUSIC_ID");
				String musicName = rs.getString("MUSIC_NAME");
				int artistId = rs.getInt("ARTIST_ID");
				String artistName = rs.getString("ARTIST_NAME");
				int price = rs.getInt("PRICE");
				String musicLink = rs.getString("MUSIC_LINK");
				String comment = rs.getString("COMMENT");
				String musicPath = rs.getString("MUSIC_PATH");
				MusicInfo musicInfo = new MusicInfo(musicId, musicName, artistId, artistName, price, musicLink, comment,
						musicPath);
				musicInfoList.add(musicInfo);

			}

		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}

		return musicInfoList;

	}

	public boolean remove(int musicId) {
		try (Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)) {
			String sql = "DELETE FROM MUSIC WHERE MUSIC_ID=?";
			PreparedStatement pSt = conn.prepareStatement(sql);
			pSt.setInt(1, musicId);
			int result = pSt.executeUpdate();
			return (result == 1);

		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}

	}

	public boolean createMusic(int musicId, String musicName, int artistId, int price, String musicLink, String comment,
			String musicPath) {
		try (Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)) {
			String sql = "INSERT INTO MUSIC(MUSIC_ID,MUSIC_NAME,ARTIST_ID,PRICE,MUSIC_LINK,COMMENT,MUSIC_PATH) VALUE(?,?,?,?,?,?,?)";
			PreparedStatement pSt = conn.prepareStatement(sql);

			pSt.setInt(1, musicId);
			pSt.setString(2, musicName);
			pSt.setInt(3, artistId);
			pSt.setInt(4, price);
			pSt.setString(5, musicLink);
			pSt.setString(6, comment);
			pSt.setString(7, musicPath);

			int result = pSt.executeUpdate();
			if (result == 1) {
				return true;
			}

		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		return false;
	}

}
