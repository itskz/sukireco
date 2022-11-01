package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.FindMusicLogic;
import model.MusicInfo;

@WebServlet("/AboutMusicServlet")
public class AboutMusicServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//リクエストパラメータの取得
		//		String page = request.getParameter("page");
		String musicId = request.getParameter("musicId");

		//曲情報を取得
		FindMusicLogic findMusicLogic = new FindMusicLogic();
		MusicInfo musicInfo = findMusicLogic.execute(Integer.parseInt(musicId));

		if (musicInfo == null) {
			//曲情報が得られない場合、エラーメッセージをリクエストスコープに保存
			request.setAttribute("errorMsg", "曲情報が取得できませんでした");
		} else {
			//曲情報をリクエストスコープに保存
			request.setAttribute("musicInfo", musicInfo);
		}

		//遷移元画面をリクエストスコープに保存
		request.setAttribute("disp", "aboutMusic");
		//aboutMusic画面にフォワード
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/aboutMusic.jsp");
		dispatcher.forward(request, response);
	}
}
