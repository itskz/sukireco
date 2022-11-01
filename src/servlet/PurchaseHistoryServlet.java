package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/PurchaseHistoryServlet")
public class PurchaseHistoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//アカウント情報をセッションスコープから取得
		HttpSession session = request.getSession();
		Integer accountId = (Integer) session.getAttribute("accountId");
		Integer boughtNumber = (Integer) session.getAttribute("boughtNumber");

		//リクエストパラメータの文字コードを指定
		request.setCharacterEncoding("UTF-8");

		//リクエストパラメータの取得
		String page = request.getParameter("page");

		String disp = "purchaseHistory";
		if (accountId == null) { //ログインしていない場合、ログイン画面へ遷移
			disp = "login";
		} else if (boughtNumber == 0) { //購入履歴がない場合元の画面に戻る
			disp = page;
		}

		//遷移元画面をリクエストスコープに保存
		request.setAttribute("disp", disp);
		//purchaseHistory画面にフォワード
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/" + disp + ".jsp");
		dispatcher.forward(request, response);
	}
}
