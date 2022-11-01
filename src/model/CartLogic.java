package model;

import dao.BoughtDAO;

public class CartLogic {
	public Bought execute(Bought bought) {
		BoughtDAO dao = new BoughtDAO();
		return dao.findByBought(bought);
	}
}
