<%@ page pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common.jsp"%>
<!-- <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Bebas+Neue&display=swap"
	rel="stylesheet"> -->
<!-- <link rel="stylesheet" href="css/common.css"> -->
<header>
	<h1 class="logo">
		<a
			href="${pageContext.request.contextPath}/HomeServlet?page=<%=disp%>">
			SUKKIRI RECORDS<span class="logo-subtitle">ONLINE</span>
		</a>
	</h1>

	<nav>
		<a
			href="${pageContext.request.contextPath}/CartServlet?page=<%=disp%>&action=show">カートを見る</a>
		<%
		//セッションスコープに保存されたカート数情報を取得
		Integer cartNumber = (Integer) session.getAttribute("cartNumber");

		if (cartNumber != null) {
		%>
		<span class="cart-number">(<%=cartNumber%>)
		</span>
		<%
		}
		%>
		<a
			href="${pageContext.request.contextPath}/PurchaseHistoryServlet?page=<%=disp%>">購入履歴</a>
		<a
			href="${pageContext.request.contextPath}/LoginServlet?page=<%=disp%>">ログイン</a>
		<a
			href="${pageContext.request.contextPath}/LogoutServlet?page=<%=disp%>">ログアウト</a>
		<%
		//ログインしている場合アカウント名を表示
		if (accountId != null) {
		%>
		<span class="account-name"><%=accountName%>様</span>
		<%
		}
		%>
	</nav>
	<%
	if (errorMsg != null && errorMsg.length() != 0) {
	%>
	<script>window.alert('<%=errorMsg%>');</script>
	<%
	}
	%>
</header>