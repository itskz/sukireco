package model;

import dao.BoughtDAO;

public class BoughtLogic {
	public boolean execute(int accountId) {
		BoughtDAO dao = new BoughtDAO();
		return dao.updateBought(accountId);

	}

}
