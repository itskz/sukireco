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

import model.Account;
import model.Bought;
import model.BoughtInfo;
import model.CreateBoughtIdLogic;
import model.CreateBoughtInfoLogic;
import model.Login;
import model.LoginLogic;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//遷移元画面をリクエストスコープに保存
		request.setAttribute("disp", "login");

		//login画面にフォワード
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/login.jsp");
		dispatcher.forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//リクエストパラメータの取得
		String mailAddress = request.getParameter("mailAddress");
		String password = request.getParameter("password");

		//ログイン処理
		Login login = new Login(mailAddress, password);
		LoginLogic loginLogic = new LoginLogic();
		Account account = loginLogic.execute(login);

		String disp = "login";
		String errorMsg = "";
		if (account == null) {
			//ログインに失敗
			errorMsg = "メールアドレスまたは、パスワードが間違っています。";
			request.setAttribute("errorMsg", errorMsg);

		} else {
			int accountId = account.getAccountId();
			disp = "home";

			//アカウント情報をセッションスコープに保存
			HttpSession session = request.getSession();
			session.setAttribute("accountId", accountId);
			session.setAttribute("accountName", account.getAccountName());

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
			System.out.println(boughtIdMap.size());
		}

		//エラーメッセージをリクエストスコープに保存
		request.setAttribute("errorMsg", errorMsg);

		//遷移元画面をリクエストスコープに保存
		request.setAttribute("disp", disp);
		//画面にフォワード
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/" + disp + ".jsp");
		dispatcher.forward(request, response);
	}
}
