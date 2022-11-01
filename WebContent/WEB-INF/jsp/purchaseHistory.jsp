<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="model.BoughtInfo,java.util.List" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common.jsp"%>
<%
//セッションスコープに保存された購入履歴リストを取得
@SuppressWarnings("unchecked")
List<BoughtInfo> boughtInfoList0 = (List<BoughtInfo>) session.getAttribute("boughtInfoList0");
%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>スッキリ レコード</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Bebas+Neue&display=swap">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v6.2.0/css/all.css">
<link rel="stylesheet" href="css/common.css">
</head>
<body id="cart">
	<div class="second-container">
		<jsp:include page="/WEB-INF/jsp/navigation.jsp"></jsp:include>
		<div class="container-music-info">
			<div class="area-box area-box3">
				<h1>購入履歴</h1>

				<%
				for (BoughtInfo boughtInfo : boughtInfoList0) {
				%>
				<div class="music-info-element">
					<div class="music-info-img">
						<img src="<%=boughtInfo.getMusicPath()%>"
							alt="<%=boughtInfo.getMusicName()%>">
					</div>
					<div class="music-name"><%=boughtInfo.getMusicName()%></div>
					<div class="artist-name"><%=boughtInfo.getArtistName()%></div>
					<div class="CD-price"><%=boughtInfo.getPrice()%>円</div>

						<div class="youtube-link">
							<a href="<%=boughtInfo.getMusicLink()%>" target="_blank"
								rel="noopener noreferrer">
								<span class="playbutton"> <i class="fa-solid fa-play"></i>
								</span>
							</a>
						</div><!-- .youtube-link -->
				</div><!-- .music-info-element -->
		<%
		} // forの閉じ
		%>

			</div><!-- .area-box3 -->
		</div><!-- .container-music-info -->

	</div>
	<!-- .second-container -->

	<div class="img-box">
		<img class="CD-Jacket1" src="images/011.jpg">
		<img class="CD-Jacket2" src="images/016.jpg">
		<img class="CD-Jacket3" src="images/023.jpg">
		<img class="CD-Jacket4" src="images/024.jpg">
		<img class="CD-Jacket5" src="images/001.jpg">
		<img class="CD-Jacket6" src="images/025.jpg">
		<img class="CD-Jacket7" src="images/026.jpg">
		<img class="CD-Jacket8" src="images/027.jpg">
		<img class="CD-Jacket9" src="images/028.jpg">
		<img class="CD-Jacket10" src="images/029.jpg">
		<img class="CD-Jacket11" src="images/015.jpg">
		<img class="CD-Jacket12" src="images/006.jpg">
		<img class="CD-Jacket13" src="images/013.jpg">
	</div>
	<jsp:include page="/WEB-INF/jsp/footer.jsp"></jsp:include>
	<script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript" src="js/comma3.js"></script>
	<script type="text/javascript">
		$(function() {
			$(".num3").comma3();
		});
	</script>
</body>
</html>