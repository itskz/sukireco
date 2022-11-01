package model;

import dao.BoughtDAO;

public class CartAllDeleteLogic {
	public boolean execute(int accountId) {
		BoughtDAO dao = new BoughtDAO();
		return dao.emptyCart(accountId);
	}

}
