package model;

import dao.BoughtDAO;

public class CartAddLogic {
	public boolean execute(Bought bought) {
		BoughtDAO dao = new BoughtDAO();
		return dao.createBought(bought);
	}

}
