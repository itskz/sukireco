package model;

import java.util.List;

import dao.BoughtDAO;

public class CreateBoughtInfoLogic {
	public List<BoughtInfo> execute(Bought bought) {
		BoughtDAO dao = new BoughtDAO();
		List<BoughtInfo> boughtInfoList = dao.findAll(bought);
		return boughtInfoList;
	}
}
