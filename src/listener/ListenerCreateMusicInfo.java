package listener;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import model.CreateMusicInfoLogic;
import model.MusicInfo;

@WebListener
public class ListenerCreateMusicInfo implements ServletContextListener {

	@Override
	public void contextInitialized(ServletContextEvent sce) {

		System.out.println("contextInitialized()が実行されました");

		CreateMusicInfoLogic createMusicInfoLogic = new CreateMusicInfoLogic();
		ServletContext context = sce.getServletContext();

		//曲リストの作成
		List<MusicInfo> musicInfoList = createMusicInfoLogic.execute();
		if (musicInfoList == null) {
			System.out.println("曲リストの取得時にエラーが発生しました");
		} else {
			context.setAttribute("musicInfoList", musicInfoList);
			System.out.println("曲リストがアプリケーションスコープに保存されました 曲数＝" + musicInfoList.size() + "曲");
		}

		//おすすめのmusicIdの一覧(recommend1～4　→ Map(0～3))
		Map<Integer, Integer> recommendMap = new HashMap<>() {
			{
				put(0, 10);
				put(1, 23);
				put(2, 24);
				put(3, 25);
			}
		};
		context.setAttribute("recommendMap", recommendMap);

		//おすすめ曲リストの作成(recommend1～4　→ recommendList(0～3))
		List<MusicInfo> recommendList = new ArrayList<MusicInfo>();
		for (int i = 0; i <= 3; i++) {
			for (MusicInfo mi : musicInfoList) {
				if (recommendMap.get(i) == mi.getMusicId()) {
					recommendList.add(mi);
					break;
				}
			}
		}
		context.setAttribute("recommendList", recommendList);
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
	}
}
