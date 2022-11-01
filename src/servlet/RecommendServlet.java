package servlet;

import java.io.IOException;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.FindMusicLogic;
import model.MusicInfo;

@WebServlet("/RecommendServlet")
public class RecommendServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//リクエストパラメータの文字コードを指定
		request.setCharacterEncoding("UTF-8");

		//リクエストパラメータの取得
		//		String page = request.getParameter("page");
		String strNumber = request.getParameter("number");
		int number = Integer.parseInt(strNumber);

		//アプリケーションスコープに保存されたおすすめ曲リストを取得
		ServletContext application = getServletContext();
		@SuppressWarnings("unchecked")
		Map<Integer, Integer> recommendMap = (Map<Integer, Integer>) application.getAttribute("recommendMap");

		//曲情報を取得
		FindMusicLogic findMusicLogic = new FindMusicLogic();
		MusicInfo musicInfo = findMusicLogic.execute(recommendMap.get(number));

		if (musicInfo == null) {
			//曲情報が得られない場合、エラーメッセージをリクエストスコープに保存
			request.setAttribute("errorMsg", "曲情報が取得できませんでした");
		} else {
			//曲情報をリクエストスコープに保存
			request.setAttribute("musicInfo", musicInfo);
		}

		//遷移元画面をリクエストスコープに保存
		request.setAttribute("disp", "recommend" + (number + 1));
		//Recommend画面にフォワード
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/recommend" + (number + 1) + ".jsp");
		dispatcher.forward(request, response);
	}
}
