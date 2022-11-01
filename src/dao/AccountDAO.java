package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.Account;
import model.Login;

public class AccountDAO {

	private final String JDBC_URL = "jdbc:mysql://localhost:3306/"
			+ "sukkirirecord?characterEncoding=UTF-8&serverTimezone=Asia/Tokyo";
	private final String DB_USER = "root";
	private final String DB_PASS = "root";

	public Account findByLogin(Login login) {
		Account account = null;

		try (Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)) {

			String sql = "SELECT * FROM ACCOUNT WHERE MAIL_ADDRESS =? AND PASSWORD=? ";
			PreparedStatement pSt = conn.prepareStatement(sql);
			pSt.setString(1, login.getMailAddress());
			pSt.setString(2, login.getPassword());

			ResultSet rs = pSt.executeQuery();

			while (rs.next()) {
				int accountId = rs.getInt("ACCOUNT_ID");
				String accountName = rs.getString("ACCOUNT_NAME");
				String mailAddress = rs.getString("MAIL_ADDRESS");
				String password = rs.getString("PASSWORD");
				String creditNumber = rs.getString("CREDIT_NUMBER");

				account = new Account(accountId, accountName, mailAddress, password, creditNumber);
			}

		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		return account;
	}

	public boolean createAccount(Account account) {
		try (Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)) {
			String sql = "INSERT INTO ACCOUNT(ACCOUNT_NAME,MAIL_ADDRESS,PASSWORD,CREDIT_NUMBER) VALUE(?,?,?,?)";
			PreparedStatement pSt = conn.prepareStatement(sql);

			pSt.setString(1, account.getAccountName());
			pSt.setString(2, account.getMailAddress());
			pSt.setString(3, account.getPassword());
			pSt.setString(4, account.getCreditNumber());

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

	public boolean findByAccount(String mailAddress) {

		try (Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS)) {

			String sql = "SELECT ACCOUNT_ID FROM ACCOUNT WHERE MAIL_ADDRESS =? ";
			PreparedStatement pSt = conn.prepareStatement(sql);
			pSt.setString(1, mailAddress);

			ResultSet rs = pSt.executeQuery();

			if (rs.next()) {
				return true;
			}

		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
		return false;
	}
}
