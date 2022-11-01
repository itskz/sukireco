<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link rel="stylesheet" href="css/common.css">
<jsp:include page="/WEB-INF/jsp/navigation.jsp"></jsp:include>
</head>
<body id="login">



	<!-- ログインフォーム ここから-->
	<div class="container">
	<div class="container2">
		<form
			action="${pageContext.request.contextPath}/LoginServlet?page=login"
			method="post">
			<h1>ログイン</h1>

			<ul>
				<li><span>メールアドレス：</span></li>
				<li><input type="email" name="mailAddress" pattern="^[A-Za-z0-9@\.]+{0,100}$"  placeholder="半角英数で入力"required></li>
			</ul>
			<ul>
				<li><span>パスワード：</span></li>
				<li><input type="password" name="password" pattern="^[A-Za-z0-9]+{0,20}$"
						placeholder="半角英数で入力"required></li>
			</ul>
			<div class="set2">
				<input class="login-tab" type="submit" value="ログイン">

		<a
		href="${pageContext.request.contextPath}/CreateAccountServlet?page=login">ユーザー登録</a>
		<img class="login-img" src="images/internet_gazou_ninsyou.peg.jpg">
			</div>
		</form>
</div>
		</div>
		<!-- ログインフォーム ここまで-->
</body>
</html>