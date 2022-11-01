package model;

import dao.AccountDAO;

public class FindAccountLogic {
	public boolean execute(String mailAddress) {
		AccountDAO dao = new AccountDAO();
		return dao.findByAccount(mailAddress);
	}
}
