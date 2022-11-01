package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {
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

		String disp = page;
		if (accountId != null) { //ログインしている場合、セッションスコープを破棄

			session.invalidate();

			switch (page) { //ログイン状態で遷移される画面の場合、home画面に遷移
			case "cart":
			case "paymentConfirm":
			case "purchaseHistory":
				disp = "home";
			}
		}

		//遷移元画面をリクエストスコープに保存
		request.setAttribute("disp", disp);
		//画面にフォワード
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/" + disp + ".jsp");
		dispatcher.forward(request, response);
	}
}
