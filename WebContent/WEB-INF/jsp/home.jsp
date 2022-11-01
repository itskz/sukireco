<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="model.MusicInfo,java.util.List,java.util.Map"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common.jsp"%>
<%
//アプリケーションスコープに保存された曲リストを取得
List<MusicInfo> musicInfoList = (List<MusicInfo>) application.getAttribute("musicInfoList");
//アプリケーションスコープに保存されたおすすめ曲マップ、リストを取得
Map<Integer, Integer> recommendMap = (Map<Integer, Integer>) application.getAttribute("recommendMap");
List<MusicInfo> recommendList = (List<MusicInfo>) application.getAttribute("recommendList");
//セッションスコープに保存された曲リストを取得
Map<Integer, String> boughtIdMap = (Map<Integer, String>) session.getAttribute("boughtIdMap");
%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>スッキリ レコード</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Bebas+Neue&display=swap">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.2.0/css/all.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons+Round">
<link rel="stylesheet" href="css/common.css">
</head>
<body id="home">
<jsp:include page="/WEB-INF/jsp/navigation.jsp"></jsp:include>
	<div class="wrapper">
		<div class="music-list-recomend">
		<h1>オススメ</h1>
		<div class="music-list-wrapper">
			<% for (int i = 0; i < 4; i++) { %>
				<div class="music-list">
					<div class="music-list-img">
						<a
							href="${pageContext.request.contextPath}/RecommendServlet?page=<%=disp%>&number=<%=i%>">
							<img
								src="<%=recommendList.get(i).getMusicPath()%>?impolicy=hq&amp;imwidth=730&amp;imdensity=1"
								alt="オススメ<%=i + 1%>">
						</a>
					</div>
					<div class="music-list-name">
						<a
							href="${pageContext.request.contextPath}/RecommendServlet?page=<%=disp%>&number=<%=i%>"><%=recommendList.get(i).getArtistName()%>
							-
							<%=recommendList.get(i).getMusicName()%></a>
					</div>
					<div class="music-list-price">
						&yen;<%=recommendList.get(i).getPrice()%></div>
					<div class="music-list-cart">
						<% if (boughtIdMap != null && "0".equals(boughtIdMap.get(recommendMap.get(i)))) { %>
							<div class="bought">購入済み</div>
						<% } else if (boughtIdMap != null && "1".equals(boughtIdMap.get(recommendMap.get(i)))) { %>
							<div class="bought">カート有</div>
						<% } else { %>
							<a class="tooltip" title="カートへ" tabindex="0"
								href="${pageContext.request.contextPath}/CartServlet?page=<%=disp%>&action=add&musicId=<%=recommendMap.get(i)%>">
								<span class="material-icons-round">add_shopping_cart</span>
							</a>
						<% } %> <!-- if の閉じ -->
					</div><!-- .music-list-cart -->
			</div><!-- .music-list -->
			<% } %> <!-- forの閉じ -->
			</div><!-- .music-list-wrapper -->
		</div><!-- .music-list-recomend -->

<div class="area-box-home">
	<%
	if (musicInfoList == null || musicInfoList.size() == 0) {
	%><p>曲リストがありません。</p>
	<%
	} else {
	%>

		<%
		for (MusicInfo musicInfo : musicInfoList) {
		%>
		<div class="music-info-element">
			<div class="music-info-img">
				<img src="<%=musicInfo.getMusicPath()%>"
					alt="<%=musicInfo.getMusicName()%>">
			</div>
			<div class="tooltip" title="<%=musicInfo.getComment()%>" tabindex="0">
					<div class="material-icons-round">info</div>
			</div>
			<div class="music-name"><%=musicInfo.getMusicName()%></div>
			<div class="artist-name"><%=musicInfo.getArtistName()%></div>
			<div class="CD-price">&yen;<%=musicInfo.getPrice()%></div>
			<div class="youtube-trush-icon">
				<div class="youtube-link">
					<a href="<%=musicInfo.getMusicLink()%>" target="_blank"
						rel="noopener noreferrer">
						<span class="playbutton"> <i class="fa-solid fa-play"></i></span>
					</a>
				</div>
			</div>
			<div class="cart-icon">
				<% if (boughtIdMap != null && "0".equals(boughtIdMap.get(musicInfo.getMusicId()))) { %>
					<div class="bought">購入済み</div>
				<% } else if (boughtIdMap != null && "1".equals(boughtIdMap.get(musicInfo.getMusicId()))) { %>
					<div class="bought">カート有</div>
				<% } else { %>
					<a class="tooltip" title="カートへ" tabindex="0"
						href="${pageContext.request.contextPath}/CartServlet?page=<%=disp%>&action=add&musicId=<%=musicInfo.getMusicId()%>">
						<span class="material-icons-round">add_shopping_cart</span>
					</a>
				<% } %> <!-- if の閉じ -->
			</div>
		</div><!-- .music-info-element -->
	<%
		} // forの閉じ
	} // elseの閉じ
	%>

	</div><!-- .area-box-home -->
		</div><!-- .wrapper -->

<div class="img-box">
<img class="CD-Jacket1" src="images/011.jpg"> <img
class="CD-Jacket2" src="images/016.jpg"> <img
class="CD-Jacket3" src="images/023.jpg"> <img
class="CD-Jacket4" src="images/024.jpg"> <img
class="CD-Jacket5" src="images/001.jpg"> <img
class="CD-Jacket6" src="images/025.jpg"> <img
class="CD-Jacket7" src="images/026.jpg"> <img
class="CD-Jacket8" src="images/027.jpg"> <img
class="CD-Jacket9" src="images/028.jpg"> <img
class="CD-Jacket10" src="images/029.jpg"> <img
class="CD-Jacket11" src="images/015.jpg"> <img
class="CD-Jacket12" src="images/006.jpg"> <img
class="CD-Jacket13" src="images/013.jpg">
</div>
	<jsp:include page="/WEB-INF/jsp/footer.jsp"></jsp:include>
</body>
</html>