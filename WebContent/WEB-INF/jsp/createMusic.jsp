<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>スッキリ レコード 管理者画面</title>
</head>
<body>
	<h1>createMusic</h1>
	<a
		href="${pageContext.request.contextPath}/CreateArtistServlet?action=init">アーティスト登録へ</a>
	<br>
	<a href="${pageContext.request.contextPath}/AdminLoginServlet">メニューへ</a>
	<br>
	<form
		action="${pageContext.request.contextPath}/CreateMusicServlet?action=done"
		method="get">
		<input type="submit" value="曲登録">
	</form>
</body>
</html>