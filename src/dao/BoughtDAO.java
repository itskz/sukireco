package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import model.Bought;
import model.BoughtInfo;

public class BoughtDAO {

	private final String JDBC_URL = "jdbc:mysql://localhost:3306/"
			+ "sukkirirecord?characterEncoding=UTF-8&serverTimezone=Asia/Tokyo";
	private final String DB_USER = "root";
	private final String DB_PASS = "root";

	public Bought findByBought(Bought bought) {

		try (Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)) {

			String sql = "SELECT * FROM BOUGHT WHERE ACCOUNT_ID=? AND MUSIC_ID =? ";
			PreparedStatement pSt = conn.prepareStatement(sql);
			pSt.setInt(1, bought.getAccountId());
			pSt.setInt(2, bought.getMusicId());

			ResultSet rs = pSt.executeQuery();

			if (rs.next()) {
				String cartStateFlag = rs.getString("CART_STATE_FLAG");
				bought.setCartStateFlag(cartStateFlag);
				return bought;
			}

		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		return null;
	}

	public List<BoughtInfo> findAll(Bought bought) {
		List<BoughtInfo> boughtList = new ArrayList<>();

		try (Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)) {
			String sql = "SELECT * FROM BOUGHT INNER JOIN MUSIC ON BOUGHT.MUSIC_ID=MUSIC.MUSIC_ID INNER JOIN ARTIST ON MUSIC.ARTIST_ID=ARTIST.ARTIST_ID WHERE ACCOUNT_ID=? AND CART_STATE_FLAG=? ORDER BY ARTIST_NAME,MUSIC_NAME";

			PreparedStatement pSt = conn.prepareStatement(sql);

			pSt.setInt(1, bought.getAccountId());
			pSt.setString(2, bought.getCartStateFlag());

			ResultSet rs = pSt.executeQuery();

			while (rs.next()) {
				int musicId = rs.getInt("MUSIC_ID");
				String cartStateFlag = rs.getString("CART_STATE_FLAG");
				String musicName = rs.getString("MUSIC_NAME");
				int artistId = rs.getInt("ARTIST_ID");
				String artistName = rs.getString("ARTIST_NAME");
				int price = rs.getInt("PRICE");
				String musicLink = rs.getString("MUSIC_LINK");
				String comment = rs.getString("COMMENT");
				String musicPath = rs.getString("MUSIC_PATH");

				BoughtInfo boughtInfo = new BoughtInfo(bought.getAccountId(), musicId, cartStateFlag, musicName,
						artistId, artistName, price, musicLink, comment, musicPath);
				boughtList.add(boughtInfo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		return boughtList;
	}

	public boolean removeBought(Bought bought) {
		try (Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)) {
			String sql = "DELETE FROM BOUGHT WHERE MUSIC_ID =? AND ACCOUNT_ID=?";
			PreparedStatement pSt = conn.prepareStatement(sql);
			pSt.setInt(1, bought.getMusicId());
			pSt.setInt(2, bought.getAccountId());
			int result = pSt.executeUpdate();
			return (result == 1);

		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	public boolean emptyCart(int accountId) {
		try (Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)) {
			String sql = "DELETE FROM BOUGHT WHERE ACCOUNT_ID=? AND CART_STATE_FLAG=1 ";
			PreparedStatement pSt = conn.prepareStatement(sql);
			pSt.setInt(1, accountId);
			int result = pSt.executeUpdate();
			return (result >= 1);

		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	public boolean createBought(Bought bought) {

		try (Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)) {
			String sql = "INSERT INTO BOUGHT(ACCOUNT_ID,MUSIC_ID,CART_STATE_FLAG) VALUE(?,?,1)";
			PreparedStatement pSt = conn.prepareStatement(sql);

			pSt.setInt(1, bought.getAccountId());
			pSt.setInt(2, bought.getMusicId());

			int result = pSt.executeUpdate();
			return (result == 1);

		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	public boolean updateBought(int accountId) {
		try (Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)) {
			String sql = "UPDATE BOUGHT SET CART_STATE_FLAG=0 WHERE ACCOUNT_ID=?";
			PreparedStatement pSt = conn.prepareStatement(sql);

			pSt.setInt(1, accountId);

			int result = pSt.executeUpdate();
			return (result >= 1);

		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

	public Map<Integer, String> findAllId(int accountId) {
		Map<Integer, String> boughtIdMap = new HashMap<>();

		try (Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)) {
			String sql = "SELECT MUSIC_ID, CART_STATE_FLAG FROM BOUGHT WHERE ACCOUNT_ID=?";

			PreparedStatement pSt = conn.prepareStatement(sql);
			pSt.setInt(1, accountId);
			ResultSet rs = pSt.executeQuery();

			while (rs.next()) {
				boughtIdMap.put(rs.getInt("MUSIC_ID"), rs.getString("CART_STATE_FLAG"));
				System.out.println(rs.getInt("MUSIC_ID") + rs.getString("CART_STATE_FLAG"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		return boughtIdMap;
	}
}
