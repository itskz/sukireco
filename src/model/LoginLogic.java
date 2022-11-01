package model;

import dao.AccountDAO;

public class LoginLogic {
	public Account execute(Login login) {
		AccountDAO dao = new AccountDAO();
		return dao.findByLogin(login);
	}
}
