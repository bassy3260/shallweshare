<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>��û �Ϸ�~</h1>
	<p>��û ��Ƽ: ${party.p_title}</p>
	<p>�Ա� ����: ${master.u_bank_account}</p>
	�Ա����ּ���
	<p><input type="button" value="��Ƽ �󼼷� �̵�" onclick="javascript:window.location='party_page_joined?p_id=${party.p_id}'"></p>
</body>
</html>