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
import model.CartAddLogic;
import model.CartAllDeleteLogic;
import model.CartDeleteLogic;
import model.CartLogic;
import model.CreateBoughtIdLogic;
import model.CreateBoughtInfoLogic;

@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//アカウント情報をセッションスコープから取得
		HttpSession session = request.getSession();
		Integer accountId = (Integer) session.getAttribute("accountId");

		//リクエストパラメータの文字コードを指定
		request.setCharacterEncoding("UTF-8");

		//リクエストパラメータの取得
		String page = request.getParameter("page");
		String action = request.getParameter("action");
		String musicId = request.getParameter("musicId");

		String disp = page;
		//ログインしていない場合、ログイン画面へ遷移
		if (accountId == null) {
			disp = "login";
		} else {

			//引数用クラス準備
			//BoughtInfoを再作成する際、この変数を再使用します。
			//購入履歴から再作成するためcartStateFlagに0をセットしています。
			Bought bought = new Bought(accountId, musicId == null ? 0 : Integer.parseInt(musicId), "0");

			//actionにより各処理
			String errorMsg = "";
			boolean isRecreateBoughtInfo = false; //false=再作成しない、true=再作成する
			switch (action) {
			case "show":
				//カートに商品がある場合、page画面へ遷移
				Integer cartNumber = (Integer) session.getAttribute("cartNumber");
				if (cartNumber != 0) {
					disp = "cart";
				}
				break;

			case "add":
				CartLogic cartLogic = new CartLogic();
				Bought findByBought = cartLogic.execute(bought);
				if (findByBought == null) { //登録がなければOK
					CartAddLogic cartAddLogic = new CartAddLogic();
					if (cartAddLogic.execute(bought)) { //カートに追加する
						isRecreateBoughtInfo = true; //BoughtInfoを再作成する
					} else {
						errorMsg = "カート追加時にエラーが発生しました";
					}
				} else { //登録があればエラー
					disp = page; //元の画面に遷移する
					if (findByBought.getCartStateFlag() == "0") {
						errorMsg = "既に購入済みの商品です";
					} else {
						errorMsg = "既にカートに入っている商品です";
					}
				}
				break;

			case "empty":
				CartAllDeleteLogic cartAllDeleteLogic = new CartAllDeleteLogic();
				if (cartAllDeleteLogic.execute(accountId)) { //カートを空にする
					isRecreateBoughtInfo = true; //BoughtInfoを再作成する
				} else {
					errorMsg = "カート作業時にエラーが発生しました";
				}
				break;

			case "delete":
				CartDeleteLogic cartDeleteLogic = new CartDeleteLogic();
				if (cartDeleteLogic.execute(bought)) {
					isRecreateBoughtInfo = true; //BoughtInfoを再作成する
				} else {
					errorMsg = "カート削除時にエラーが発生しました";
				}
				break;
			}

			//BoughtInfoListを再作成する
			if (isRecreateBoughtInfo) {
				CreateBoughtInfoLogic createBoughtInfoLogic = new CreateBoughtInfoLogic();
				List<BoughtInfo> boughtInfoList0 = createBoughtInfoLogic.execute(bought); //購入履歴
				if (boughtInfoList0 == null) {
					errorMsg = "購入履歴リスト（購入履歴)が取得できませんでした";
				} else {
					//購入履歴をセッションスコープに保存
					session.setAttribute("boughtInfoList0", boughtInfoList0);
					session.setAttribute("boughtNumber", boughtInfoList0.size());
				}
				bought.setCartStateFlag("1"); //カート
				List<BoughtInfo> boughtInfoList1 = createBoughtInfoLogic.execute(bought);
				if (boughtInfoList1 == null) {
					errorMsg = "購入履歴リスト（カート)が取得できませんでした";
				} else {
					//購入履歴をセッションスコープに保存
					session.setAttribute("boughtInfoList1", boughtInfoList1);
					session.setAttribute("cartNumber", boughtInfoList1.size());

					if (boughtInfoList1.size() == 0) { //カートが0件ならhomeへ遷移
						disp = "home";
					}
				}
				CreateBoughtIdLogic createBoughtIdLogic = new CreateBoughtIdLogic();
				Map<Integer, String> boughtIdMap = createBoughtIdLogic.execute(accountId);
				if (boughtIdMap == null) {
					errorMsg = "購入履歴リストが取得できませんでした";
				} else {
					//購入履歴をセッションスコープに保存
					session.setAttribute("boughtIdMap", boughtIdMap);
				}
			}
			//エラーメッセージをリクエストスコープに保存
			request.setAttribute("errorMsg", errorMsg);
		}

		//遷移元画面をリクエストスコープに保存
		request.setAttribute("disp", disp);
		//画面のフォワード
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/" + disp + ".jsp");
		dispatcher.forward(request, response);
	}
}
