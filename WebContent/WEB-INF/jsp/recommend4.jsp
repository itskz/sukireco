<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="model.MusicInfo,java.util.Map"%>
<%@ include file="/WEB-INF/jsp/common.jsp"%>
<%
MusicInfo musicInfo = (MusicInfo) request.getAttribute("musicInfo");
Map<Integer, String> boughtIdMap = (Map<Integer, String>) session.getAttribute("boughtIdMap");
%>
<!DOCTYPE html>
<html lang="ja">
<head>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Bebas+Neue&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v6.2.0/css/all.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons+Round">
<link rel="stylesheet" href="css/fav.css">
<link rel="stylesheet" href="css/common.css">
<meta charset="UTF-8">
<title>スッキリ レコード</title>
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/navigation.jsp"></jsp:include>
	<div class="mi">
		<div class="NA_article_header">

			<h1 class="NA_article_title">上原ひろみの名曲「XYZ」</h1>
			<p class="NA_article_data">
		</div>
		<div class="NA_share">
			<ul class="NA_share_btn">
				<li class="NA_article_date">2022年10月20日</li>
				<!-- 				Twitter -->
				<li class="NA_share_tw"><a
						href="https://twitter.com/share?url=https%3A%2F%2Fnatalie.mu%2Fmusic%2Fnews%2F497058&amp;text=%E8%97%A4%E4%BA%95%E9%A2%A8%E3%81%8C%E3%82%A4%E3%83%B3%E3%83%89%E3%82%92%E8%A8%AA%E3%82%8C%E3%81%9F%E3%80%8Cgrace%E3%80%8D%E3%83%9F%E3%83%A5%E3%83%BC%E3%82%B8%E3%83%83%E3%82%AF%E3%83%93%E3%83%87%E3%82%AA%E5%85%AC%E9%96%8B%EF%BC%88%E5%8B%95%E7%94%BB%E3%81%82%E3%82%8A%EF%BC%89"
						target="_blank" class="GAE_tweetBtnTop NA_share_tw_tweet"
						rel="nofollow">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
							fill="#00acee" class="bi bi-twitter" viewBox="0 0 16 16">
  <path
								d="M5.026 15c6.038 0 9.341-5.003 9.341-9.334 0-.14 0-.282-.006-.422A6.685 6.685 0 0 0 16 3.542a6.658 6.658 0 0 1-1.889.518 3.301 3.301 0 0 0 1.447-1.817 6.533 6.533 0 0 1-2.087.793A3.286 3.286 0 0 0 7.875 6.03a9.325 9.325 0 0 1-6.767-3.429 3.289 3.289 0 0 0 1.018 4.382A3.323 3.323 0 0 1 .64 6.575v.045a3.288 3.288 0 0 0 2.632 3.218 3.203 3.203 0 0 1-.865.115 3.23 3.23 0 0 1-.614-.057 3.283 3.283 0 0 0 3.067 2.277A6.588 6.588 0 0 1 .78 13.58a6.32 6.32 0 0 1-.78-.045A9.344 9.344 0 0 0 5.026 15z" />
</svg>
					</a><span class="sub">ツイート</span></li>
				<!-- 				Facebook -->
				<li class="NA_share_fb"><a
						href="http://www.facebook.com/sharer/sharer.php?u=https%3A%2F%2Fnatalie.mu%2Fmusic%2Fnews%2F497058&amp;t=%E8%97%A4%E4%BA%95%E9%A2%A8%E3%81%8C%E3%82%A4%E3%83%B3%E3%83%89%E3%82%92%E8%A8%AA%E3%82%8C%E3%81%9F%E3%80%8Cgrace%E3%80%8D%E3%83%9F%E3%83%A5%E3%83%BC%E3%82%B8%E3%83%83%E3%82%AF%E3%83%93%E3%83%87%E3%82%AA%E5%85%AC%E9%96%8B%EF%BC%88%E5%8B%95%E7%94%BB%E3%81%82%E3%82%8A%EF%BC%89"
						target="_blank" class="GAE_fbShareBtnTop" rel="nofollow">
						<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
							fill="#3b5998" class="bi bi-facebook" viewBox="0 0 16 16">
  <path
								d="M16 8.049c0-4.446-3.582-8.05-8-8.05C3.58 0-.002 3.603-.002 8.05c0 4.017 2.926 7.347 6.75 7.951v-5.625h-2.03V8.05H6.75V6.275c0-2.017 1.195-3.131 3.022-3.131.876 0 1.791.157 1.791.157v1.98h-1.009c-.993 0-1.303.621-1.303 1.258v1.51h2.218l-.354 2.326H9.25V16c3.824-.604 6.75-3.934 6.75-7.951z" />
</svg>
					</a><span class="sub">シェア</span></li>

			</ul>
		</div>

		<div class="NA_article_body">
			<p>
				<wbr>
				音で伝える”生きること”
			</p>

			<div class="GAE_mainImage NA_article_img">

				<div class="NA_article_img_thumb">
					<img
						src="https://ogre.natalie.mu/artist/1532/20210720/ueharahiromi_art202107_c_MariAmita.jpg?imwidth=400&amp;imdensity=1"
						width="&quot;400&quot;" height="&quot;536&quot;" alt="上原ひろみ">
				</div>
				<p class="NA_article_img_caption">上原ひろみ</p>


			</div>

			<div class="aboutrecommend">
				<p>あまりジャズという音楽ジャンルに詳しくない、という方であっても上原ひろみさんの名前くらいは知っている、テレビなどで目にしたことがあるという人は多いのではないでしょうか。</p>
				<p>上原さんは幼少期の頃から早熟な才能を発揮していた神童であり、ジャズのみならずクラシック音楽の素養も持ち合わせ、その突出したピアノのテクニックは世界中の著名なミュージシャンたちからも大絶賛されています。</p>
				<p>まさに天才と呼ぶにふさわしい、存在自体がジャンルを超越したクロスオーバーなミュージシャンと言える上原さんは多くの作品をリリースしており、代表作を1つ取り上げるのはなかなか難しいですが、今回は上原さんにとって記念すべき世界デビュー盤となったアルバム『アナザーマインド』を紹介しましょう。</p>
				<p>全曲が上原さんが作曲を手掛けたオリジナル曲で固められており、スタンダードナンバーのカバーなどは一切なしといった潔い構成となった本作は、2004年度の第18回日本ゴールドディスク大賞「ジャズ・アルバム・オブ・ザ・イヤー受賞」を受賞するなど高く評価されたアルバムです。</p>
				<p>当時23歳の上原さんによる天才的なプレイはもちろん、楽曲の持つダイナミズムや疾走感は、むしろロック・ファンやプログレ好きな方も楽しめるはずです！</p>
			</div>
			<p>
				<img src="<%=musicInfo.getMusicPath()%>" alt="正夢" width="300"
					height="300">
			</p>
			<p><%=musicInfo.getArtistName()%>
				-
				<%=musicInfo.getMusicName()%></p>
			<p>
				<%if (boughtIdMap != null && "0".equals(boughtIdMap.get(musicInfo.getMusicId()))) {
				%>購入済み<%
				} else if (boughtIdMap != null && "1".equals(boughtIdMap.get(musicInfo.getMusicId()))) {
				%>カート有<%
				} else {
				%><a
						href="${pageContext.request.contextPath}/CartServlet?page=<%=disp%>&action=add&musicId=<%=musicInfo.getMusicId()%>">
						<span class="material-icons-round">add_shopping_cart</span>カートへ
					</a>
				<%
				}
				%>
			</p>
			<div class="NA_article_youtube">
				<iframe width="730" height="487"
					src="https://www.youtube.com/embed/G6pgM-NVfWg"
					title="YouTube video player" frameborder="0"
					allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
					allowfullscreen></iframe>
			</div>
			<div class="NA_article_embed-twitter">
				<a class="twitter-timeline"
					href="https://twitter.com/hiromispark?ref_src=twsrc%5Etfw">Tweets
					by hiromispark</a>
				<script async src="https://platform.twitter.com/widgets.js"
					charset="utf-8"></script>

			</div>

		</div>
	</div>
	<jsp:include page="/WEB-INF/jsp/footer.jsp"></jsp:include>
</body>
</html>