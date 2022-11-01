package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/PaymentConfirmServlet")
public class PaymentConfirmServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//アカウント情報をセッションスコープから取得
		HttpSession session = request.getSession();
		Integer accountId = (Integer) session.getAttribute("accountId");
		Integer cartNumber = (Integer) session.getAttribute("cartNumber");

		String disp = "paymentConfirm";
		if (accountId == null) { //ログインしていない場合、ログイン画面へ遷移
			disp = "login";
		} else if (cartNumber == 0) { //カートに商品がない場合home画面に戻る
			disp = "home";
		}

		//遷移元画面をリクエストスコープに保存
		request.setAttribute("disp", disp);
		//画面にフォワード
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/" + disp + ".jsp");
		dispatcher.forward(request, response);
	}
}
