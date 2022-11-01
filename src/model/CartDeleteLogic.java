package model;

import dao.BoughtDAO;

public class CartDeleteLogic {
	public boolean execute(Bought bought) {
		BoughtDAO dao = new BoughtDAO();
		return dao.removeBought(bought);
	}

}
