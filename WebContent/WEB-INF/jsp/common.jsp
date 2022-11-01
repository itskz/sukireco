<%@ page pageEncoding="UTF-8"%>
<%
// セッションスコープに保存されたアカウント（id）を取得
Integer accountId = (Integer) session.getAttribute("accountId");
//セッションスコープに保存されたアカウント(名前)を取得
String accountName = (String) session.getAttribute("accountName");
// リクエストスコープに保存されたエラーメッセージを取得
String errorMsg = (String) request.getAttribute("errorMsg");
// リクエストスコープに保存された繊維元画面を取得
String disp = (String) request.getAttribute("disp");
%>
