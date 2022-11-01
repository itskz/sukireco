package servlet;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Bought;
import model.BoughtInfo;
import model.BoughtLogic;
import model.CreateBoughtIdLogic;
import model.CreateBoughtInfoLogic;

@WebServlet("/PaymentServlet")
public class PaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//アカウント情報をセッションスコープから取得
		HttpSession session = request.getSession();
		Integer accountId = (Integer) session.getAttribute("accountId");

		String disp = "purchaseHistory";
		if (accountId == null) { //ログインしていない場合、ログイン画面へ遷移
			disp = "login";
		} else {

			BoughtLogic boughtLogic = new BoughtLogic();
			String errorMsg = "";
			if (boughtLogic.execute(accountId)) { //購入処理
				//購入履歴リストを作成
				Bought bought = new Bought(accountId, 0, "0"); //購入履歴
				CreateBoughtInfoLogic createBoughtInfoLogic = new CreateBoughtInfoLogic();
				List<BoughtInfo> boughtInfoList0 = createBoughtInfoLogic.execute(bought);
				if (boughtInfoList0 == null) {
					errorMsg = "購入履歴リストが取得できませんでした";
				} else {
					//購入履歴をセッションスコープに保存
					session.setAttribute("boughtInfoList0", boughtInfoList0);
					session.setAttribute("boughtNumber", boughtInfoList0.size());
				}
				bought.setCartStateFlag("1"); //カート
				List<BoughtInfo> boughtInfoList1 = createBoughtInfoLogic.execute(bought);
				if (boughtInfoList1 == null) {
					errorMsg = "購入履歴リストが取得できませんでした";
				} else {
					//カートをセッションスコープに保存
					session.setAttribute("boughtInfoList1", boughtInfoList1);
					session.setAttribute("cartNumber", boughtInfoList1.size());
				}
				CreateBoughtIdLogic createBoughtIdLogic = new CreateBoughtIdLogic();
				Map<Integer, String> boughtIdMap = createBoughtIdLogic.execute(accountId);
				if (boughtIdMap == null) {
					errorMsg = "購入履歴リストが取得できませんでした";
				} else {
					//購入履歴をセッションスコープに保存
					session.setAttribute("boughtIdMap", boughtIdMap);
				}
			} else {
				errorMsg = "購入処理でエラーが発生しました";
			}

			//エラーメッセージをリクエストスコープに保存
			request.setAttribute("errorMsg", errorMsg);
		}

		//遷移元画面をリクエストスコープに保存
		request.setAttribute("disp", disp);
		//purchaseHistory画面にフォワード
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/" + disp + ".jsp");
		dispatcher.forward(request, response);
	}
}
