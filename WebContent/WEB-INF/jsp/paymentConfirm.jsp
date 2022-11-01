<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="model.BoughtInfo,java.util.List"%>

<%
List<BoughtInfo> boughtInfoList1 = (List<BoughtInfo>) session.getAttribute("boughtInfoList1");
%>
<%@ include file="/WEB-INF/jsp/common.jsp"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>スッキリ レコード</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Bebas+Neue&display=swap">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v6.2.0/css/all.css">
<link rel="stylesheet" href="css/common.css">
</head>
<body id="cart">
	<div class="second-container">
		<jsp:include page="/WEB-INF/jsp/navigation.jsp"></jsp:include>
		<div class="area-box2">
			<div class="container-music-info">
				<h1>ご注文内容の確認</h1>
				<h2>まだご注文は完了しておりません</h2>
				<h3>ご注文内容をご確認の上、ページ一番下の「ご注文を確定する」ボタンを押してください。</h3>

				<%
				int sum = 0;

				for (BoughtInfo boughtInfo : boughtInfoList1) {
				%>
				<div class="music-info-element">
					<div class="music-info-img">
						<img src="<%=boughtInfo.getMusicPath()%>"
							alt="<%=boughtInfo.getMusicName()%>">
					</div>
					<div class="music-name"><%=boughtInfo.getMusicName()%></div>
					<div class="artist-name"><%=boughtInfo.getArtistName()%></div>
					<div class="CD-price"><%=boughtInfo.getPrice()%>円
					</div>

					<div class="youtube-link">
						<a href="<%=boughtInfo.getMusicLink()%>" target="_blank"
							rel="noopener noreferrer">
							<span class="playbutton"> <i class="fa-solid fa-play"></i>
							</span>
						</a>
					</div><!-- .youtube-link -->

				</div><!-- .music-info-element -->

				<%
				sum = sum + boughtInfo.getPrice();
				}

				int taxIncluded = sum * 110 / 100;
				%>



				</div><!-- .total-price -->

			</div><!-- .container-music-info -->

		</div><!-- .area-box2 -->
<div class="total-price">
					合計:<span class="num3"><%=taxIncluded%></span>円 （内消費税：<span
						class="num3"><%=(taxIncluded - sum)%></span>円)

					<form
						action="${pageContext.request.contextPath}/PaymentServlet?page=<%=disp%>"
						method="get">
						<input class="regi-tab" type="submit" value="ご注文を確定する">
						<a class="fix" href="${pageContext.request.contextPath}/CartServlet?page=<%=disp%>&action=show">カートを修正</a>
						<!-- fix:修正 -->
					</form>
	</div><!-- second-container -->

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
	<script type="text/javascript" src="js/jquery-3.6.0.min.js"></script>
	<script type="text/javascript" src="js/comma3.js"></script>
	<script type="text/javascript">
		$(function() {
			$(".num3").comma3();
		});
	</script>
</body>
</html>