<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>スッキリ レコード</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Bebas+Neue&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="css/common.css">
<jsp:include page="/WEB-INF/jsp/navigation.jsp"></jsp:include>
<jsp:include page="/WEB-INF/jsp/footer.jsp"></jsp:include>

</head>
<body id="createAccount">


	<!-- 新規登録フォーム ここから-->
	<div class="container">
		<form
			action="${pageContext.request.contextPath}/CreateAccountServlet?page=createAccount"
			method="post">
			<h1>新規登録</h1>
			<ul>
				<li><span>氏名：</span></li>
				<li><input type="text" name="accountName"
					pattern="^[0-9a-zA-Zぁ-んァ-ヶｱ-ﾝﾞﾟ一-龠 　]{0,30}$" placeholder="例）大阪　太郎"
					required></li>
			</ul>
			<ul>
				<li><span>メールアドレス：</span></li>
				<li><input type="email" name="mailAddress"
					pattern="^[A-Za-z0-9@\.]{0,100}$"
					placeholder="example@sukkirirecord.com" required></li>
			</ul>
			<ul>
				<li><span>パスワード：</span></li>
				<li><input type="password" name="password"
					pattern="^[A-Za-z0-9]{0,20}$" placeholder="半角英数で入力" required></li>
			</ul>
			<ul>
				<li><span>クレジットカード番号：</span></li>
				<li><input type="text" name="creditNumber"
					pattern="^[0-9]{16}$" placeholder="半角数字で16文字で入力" required></li>
			</ul>
			<div class="set">
				<input type="submit" value="アカウント登録">
			</div>
		</form>
	</div>
	<img class="A" src="images/entertainment_music.jpg" alt="CD">
	<img class="B" src="images/kaden_CD_DVD.jpg" alt="CD">
	<img class="C" src="images/gassyou_onpu.jpg" alt="CD">
	<img class="D" src="images/music_headphone_man.jpg" alt="CD">


	<!-- 新規登録フォーム ここまで-->
	<jsp:include page="/WEB-INF/jsp/footer.jsp"></jsp:include>
</body>
</html>