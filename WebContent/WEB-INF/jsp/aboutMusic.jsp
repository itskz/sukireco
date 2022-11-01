<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="model.MusicInfo,java.util.List,java.util.Map"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/jsp/common.jsp"%>
<%
//リクエストスコープに保存された曲情報を取得
MusicInfo musicInfo = (MusicInfo) request.getAttribute("musicInfo");
//セッションスコープに保存された曲リストを取得
@SuppressWarnings("unchecked")
Map<Integer, String> boughtIdMap = (Map<Integer, String>) session.getAttribute("boughtIdMap");
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
<link rel="stylesheet" href="css/common.css">
<jsp:include page="/WEB-INF/jsp/navigation.jsp"></jsp:include>
</head>
<body>
	<h1>aboutMusic</h1>
	<p>
		<a href="<%=musicInfo.getMusicLink()%>" target="_blank"
			rel="noopener noreferrer">
			<img src="<%=musicInfo.getMusicPath()%>">
		</a>
	</p>
	<p><%=musicInfo.getArtistName()%></p>
	<p><%=musicInfo.getComment()%></p>
	<p>
		<%
		if (boughtIdMap != null) {
			if ("0".equals(boughtIdMap.get(musicInfo.getMusicId()))) {
		%>購入済み<%
		} else if ("1".equals(boughtIdMap.get(musicInfo.getMusicId()))) {
		%>
		カートにあります
		<%
		} else if (!boughtIdMap.containsKey(musicInfo.getMusicId())) {
		%>
		<a
			href="${pageContext.request.contextPath}/CartServlet?page=<%=disp%>&action=add&musicId=<%=musicInfo.getMusicId()%>">
			<img src="img/cart.png" alt="カゴ" width="20" height="20">
		</a>
		<%
		}
		}
		%>
	</p>
	<jsp:include page="/WEB-INF/jsp/footer.jsp"></jsp:include>
</body>
</html>