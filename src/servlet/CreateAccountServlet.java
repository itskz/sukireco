package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Account;
import model.CreateAccountLogic;
import model.FindAccountLogic;

@WebServlet("/CreateAccountServlet")
public class CreateAccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//createAccount画面にフォワード
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/createAccount.jsp");
		dispatcher.forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//リクエストパラメータの取得
		request.setCharacterEncoding("UTF-8");
		String accountName = request.getParameter("accountName");
		String mailAddress = request.getParameter("mailAddress");
		String password = request.getParameter("password");
		String creditNumber = request.getParameter("creditNumber");

		//既にに存在するメールアドレスかチェック
		FindAccountLogic findAccountLogic = new FindAccountLogic();

		String disp = "login";
		String errorMsg = "";
		if (findAccountLogic.execute(mailAddress)) {
			errorMsg = "登録済みのメールアドレスです";
			disp = "createAccount";
		} else {

			//Accountクラスの生成
			Account account = new Account(0, accountName, mailAddress, password, creditNumber);

			CreateAccountLogic createAccouontLogic = new CreateAccountLogic();
			if (!createAccouontLogic.execute(account)) {
				errorMsg = "アカウントの登録時にエラーが発生しました";
			}
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