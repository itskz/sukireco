package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import model.Artist;

public class ArtistDAO {
	private final String JDBC_URL = "jdbc:mysql://localhost:3306/"
			+ "sukkirirecord?characterEncoding=UTF-8&serverTimezone=Asia/Tokyo";
	private final String DB_USER = "root";
	private final String DB_PASS = "root";

	public List<Artist> findAll() {
		List<Artist> artistList = new ArrayList<>();

		try (Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)) {
			String sql = "SELECT ARTIST_ID,ARTIST_NAME FROM ARTIST ORDER BY ARTIST_NAME";
			PreparedStatement pSt = conn.prepareStatement(sql);

			ResultSet rs = pSt.executeQuery();

			while (rs.next()) {
				int artistId = rs.getInt("ARTIST_ID");
				String artistName = rs.getString("ARTIST_NAME");

				Artist artist = new Artist(artistId,artistName);
				artistList.add(artist);

			}

		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}

		return artistList;

	}

	public boolean remove(int artistId) {
		try (Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)) {
			String sql = "DELETE FROM ARTIST WHERE ARTIST_ID =?";
			PreparedStatement pSt = conn.prepareStatement(sql);
			pSt.setInt(1, artistId);
			int result = pSt.executeUpdate();
			return (result == 1);

		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}

	}

	public boolean create(int artistId, String artistName) {
		try (Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)) {
			String sql = "INSERT INTO (ARTIST_ID,ARTIST_NAME) VALUE(?,?)";
			PreparedStatement pSt = conn.prepareStatement(sql);

			pSt.setInt(1, artistId);
			pSt.setString(2, artistName);

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