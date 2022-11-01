<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>スッキリ レコード 管理者画面</title>
</head>
<body>
	<h1>createArtist</h1>
	<a
		href="${pageContext.request.contextPath}/CreateMusicServlet?action=init">曲登録へ</a>
	<br>
	<a href="${pageContext.request.contextPath}/AdminLoginServlet">メニューへ</a>
	<br>
	<form
		action="${pageContext.request.contextPath}/CreateArtistServlet?action=done"
		method="get">
		<input type="submit" value="アーティスト登録">
	</form>
</body>
</html>