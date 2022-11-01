package model;

import dao.AccountDAO;

public class CreateAccountLogic {
	public boolean execute(Account account) {
		AccountDAO dao = new AccountDAO();
		dao.createAccount(account);
		return account != null;
	}
}
