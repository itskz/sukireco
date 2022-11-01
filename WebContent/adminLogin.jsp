<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>スッキリ レコード 管理者画面</title>
</head>
<body>
	<h1>adminLogin</h1>
	<form action="${pageContext.request.contextPath}/AdminLoginServlet"
		method="post">
		<input type="submit" value="ログイン">
	</form>
</body>
</html>