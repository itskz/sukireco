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
<meta charset="UTF-8">
<title>スッキリ レコード</title>
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
</head>
<body>
	<jsp:include page="/WEB-INF/jsp/navigation.jsp"></jsp:include>
	<div class="mi">
		<div class="NA_article_header">

			<h1 class="NA_article_title">宇多田ヒカルのデビュー作「Automatic」</h1>
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
				宇多田ヒカル、衝撃のデビュー作「First Love」。 日本の音楽シーンの新 世紀はここから始まった！
			</p>

			<div class="GAE_mainImage NA_article_img">

				<div class="NA_article_img_thumb">
					<img
						src="https://s3-ap-northeast-1.amazonaws.com/s.okmusic.jp/news_items/images/129242/original.jpg?1496905529"
						style="max-height: 511px;">
				</div>
				<p class="NA_article_img_caption">宇多田ヒカル</p>


			</div>

			<div class="aboutrecommend">
				<p>宇多田ヒカルは、美空ひばり、山口百恵らと並んで日本の芸能史にその名を残す女性シンガーである。何しろ、99年に発表した1stアルバム『First
					Love』が765万枚以上のセールスを記録して日本歴代1位なのである（870万枚以上との説もある）。音楽ソフトと有料音楽配信の売上は07年をピークに下落し続け、現在では全盛期の半分となった市場規模を鑑みれば、今後、少なくとも1作品のCD・レコードのセールスがにわかに突出することは考えづらい。この記録が抜かれることはないだろうし、その名は未来永劫まで語り継がれることは間違いない。無論、彼女のすごさはそうした数字的な因果だけではない。小室哲哉が「ヒカルちゃんが僕を終わらせたって感じ」と言ったとか、つんく♂が宇多田ヒカルを聴いて「これは敵わないと思った」と言ったという話もある通り、大袈裟に言うと、宇多田ヒカルの出現以前と以後ではシーンは様変わりし、多様性（寛容性？）がグッとアップしたような印象がある。具体的に言えば、今や当たり前となり、シーンになくてはならないと言ってよい“日本のR&B”は、彼女が居たからこそ隆盛を誇っているジャンルなのではないかとすら思う。本稿執筆のために『First
					Love』を聴き直してみて、ここに収録されているサウンドは今やスタンダードとなっているが、それ以前は所謂クラブカルチャーにおいてはポピュラーではあったものの、一般大衆に深く根差していたかというと未だ微妙な頃ではあったことを思い出した。まぁ、800万枚も売れればどんなものでも大衆的になるわけで、宇多田が売れたから日本のR&Bが確立されたのか、日本のR&Bが確立されたから宇多田が売れたのか、“卵が先か鶏が先か”みたいな話ではあるが、いずれにせよ、宇多田ヒカルの出現時期が芸能史の転換点であったことは否定できないであろう。</p>
				<p>宇多田ヒカルがシングル「Automatic／time will
					tell」でデビューしたのは98年12月。そろそろ20年が経つ。「Automatic」の歌詞《七回目のベルで受話器を取った君／名前を言わなくても声ですぐ分かってくれる》にある“七回目のベル”や“受話器”、あるいは“声ですぐ分かってくれる”の意味が分からない世代も少なくないという記事をどこかで読んだ。確かに、今は電話のベルも鳴らないし、受話器なんて言い方をしないし、そもそもどこからかかってきたか分からない電話に出る人もほとんどいない。20年間という歳月はそういうものであることを激しく認識させられる。しかし、約20年経つが、宇多田ヒカルがデビューした時の衝撃は昨日のことのように覚えている。個人的には彼女からの直接的な衝撃を受けたというよりも、あらゆるメディアがこぞって取り上げ続けた、狼狽にも似た狂騒は今も忘れられない。ラジオではある時期まで毎日「Automatic」がかかっていたし、もしかすると1番組1回くらい流れていたかもしれない。つぶさにワイドショーや週刊誌をチェックしていたわけではないが、ものすごい頻度で彼女の名前が取り上げられていたことも思い出す。16歳のバイリンガルの帰国子女が作詞作曲を手がけて、かつてない楽曲を作り出し、しかもその子は往年の演歌歌手、藤圭子の娘だったということで、宇多田ヒカルは当時、この上ないトピックになったのだろう。デビュー時のプロモーションはラジオ出演に限定していたということで、これが偶然だったか演出だったかは定かではないが、そのミステリアスさも話題に拍車をかけたとも思われる。</p>
			</div>
			<p>
				<img src="<%=musicInfo.getMusicPath()%>" alt="First Love"
					width="300" height="300">
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
					src="https://www.youtube.com/embed/o1sUaVJUeB0"
					title="YouTube video player" frameborder="0"
					allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
					allowfullscreen></iframe>
			</div>
			<div class="NA_article_embed-twitter">
				<a class="twitter-timeline"
					href="https://twitter.com/utadahikaru?ref_src=twsrc%5Etfw">Tweets
					by utadahikaru</a>
				<script async src="https://platform.twitter.com/widgets.js"
					charset="utf-8"></script>

			</div>

		</div>
	</div>
	<jsp:include page="/WEB-INF/jsp/footer.jsp"></jsp:include>
</body>
</html>