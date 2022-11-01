package model;

import java.util.Map;

import dao.BoughtDAO;

public class CreateBoughtIdLogic {
	public Map<Integer, String> execute(int accountId) {
		BoughtDAO dao = new BoughtDAO();
		return dao.findAllId(accountId);
	}
}
