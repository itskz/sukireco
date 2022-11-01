<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="model.BoughtInfo,model.Bought,java.util.List"%>
<%@ include file="/WEB-INF/jsp/common.jsp"%>
<%
List<BoughtInfo> boughtInfoList1 = (List<BoughtInfo>) session.getAttribute("boughtInfoList1");
%>

<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>スッキリ レコード</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Bebas+Neue&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v6.2.0/css/all.css">
<link rel="stylesheet" href="css/common.css">
</head>
<body id="cart">
	<div class="second-container">
		<jsp:include page="/WEB-INF/jsp/navigation.jsp"></jsp:include>
		<div class="container-music-info">
			<div class="area-box">
				<h2>カートリスト</h2>


				<%
				int sum = 0; // }

				if (boughtInfoList1 == null) {
				%>
				<p>カートに入っていません</p>
				<%
				} else {
				%>


					<%
					for (BoughtInfo boughtInfo : boughtInfoList1) {
					%>
					<div class="music-info-element">
						<div class="music-info-img">
							<img src="<%=boughtInfo.getMusicPath()%>"
								alt="<%=boughtInfo.getMusicName()%>">
						</div>
						<div class="music-name"><%=boughtInfo.getMusicName()%></div>
						<div class="artist-name"><%=boughtInfo.getArtistName()%></div>
						<div class="CD-price"><%=boughtInfo.getPrice()%>円</div>
						<div class="youtube-trush-icon">
							<div class="youtube-link">
								<a href="<%=boughtInfo.getMusicLink()%>" target="_blank"
									rel="noopener noreferrer">
									<span class="playbutton">
										<i class="fa-solid fa-play"></i>
									</span>
								</a>
							</div>
							<a class="trush-box"
								href="${pageContext.request.contextPath}/CartServlet?page=<%=disp%>&action=delete&musicId=<%=boughtInfo.getMusicId()%>">
								<span class="trush-box-button"><i
									class="fa-solid fa-trash-can"></i></span>

							</a>
						</div>
					</div>



				<%
				sum = sum + boughtInfo.getPrice();
					}// forの閉じ
				}// elseの閉じ
				%>
			</div>
			<%
			int taxIncluded = sum * 110 / 100;
			%>
			<div class="total-price">
				合計:<span class="num3"><%=taxIncluded%></span>円 （内消費税：<span
					class="num3"><%=(taxIncluded - sum)%></span>円)

				<form action="/SukkiriRecord/PaymentConfirmServlet" method="get">

					<input class="regi-tab" type="submit" value="レジへ進む">

					<a class="empty-cart"
						href="${pageContext.request.contextPath}/CartServlet?page=<%=disp%>&action=empty&accountId=<%=accountId%>">カートを空にする</a>
				</form>
			</div>
			<!-- .total-price -->
		</div>
		<!-- .container-music-info -->
	</div>
	<!-- .container -->


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