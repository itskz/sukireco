<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>スッキリ レコード 管理者画面</title>
</head>
<body>
	<h1>adminMenu</h1>
	<a
		href="${pageContext.request.contextPath}/CreateArtistServlet?action=init">アーティスト登録</a>
	<br>
	<a
		href="${pageContext.request.contextPath}/CreateMusicServlet?action=init">曲登録</a>
</body>
</html>