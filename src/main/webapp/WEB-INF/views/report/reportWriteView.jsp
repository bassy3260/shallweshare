<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고 작성</title>
<style>
@import
'../resources/css/table.css'
</style>
</head>
<body>
	<form method="post" name="rpt_frm" action="write_process">
		<input type="hidden" name="u_id" value="${sessionScope.u_id}"> 

        	<h3>신고 사유</h3>
		<table width="500 " border="1">
			<tr>
				<td>
					<select name="report_category" id="report_category">
						<option value="--" selected>선택</option>
						<option value="먹튀">먹튀</option>
						<option value="입금지연">입금지연</option>
						<option value="파삭요청">파티삭제요청</option>
						<option value="기타">기타</option>
					</select>
				</td>
			</tr>
		</table>
        	<h3>신고 파티</h3>
	    <table width="500" border="1">
			<tr>
				<c:choose>
					<c:when test="${empty param.p_id}" >
						<td><input type="number" name="report_p_id"></td>
					</c:when>
					<c:otherwise>
						<input type="hidden" name="p_id" value="${param.p_id}"> 
						<td>${party.p_title}</td>
					</c:otherwise>
				</c:choose>
			</tr>
		</table>
			<h3>신고 할 유저</h3>
	    <table width="500" border="1">
			<tr>
				<c:choose>
					<c:when test="${empty param.report_u_id}" >
						<td><input type="number" name="report_u_id"></td>
					</c:when>
					
					<c:otherwise>
						<input type="hidden" name="report_u_id" value="${param.report_u_id}"> 
						<td>${param.report_u_id}</td>
					</c:otherwise>
				</c:choose>
			</tr>
		</table>
			<h3>신고 제목</h3>
		<table width="500" border="1">
			<tr>
				<td><input type="text" name="report_title"></td>
			</tr>
		</table>
			<h3>신고 내용</h3>
		<table width="500" border="1">
			<tr>
				<td><textarea name="report_content"></textarea></td>
			</tr>
			<caption align="bottom">
					<br>
					<button type="button" onclick="reportCheck()">
						<span>접수하기</span>
					</button>
					<button type="button" onclick="history.back()">
						<span>취소</span>
					</button>
			</caption>
		</form>
</body>
<script type="text/javascript">
	function reportCheck() {

		if (rpt_frm.report_category.value == "--") {
			alert("신고사유를 선택해주세요");
			return;
		}

		if (rpt_frm.report_title.value.length == 0) {
			alert("제목을 입력해야 합니다.");
			rpt_frm.report_title.focus();
			return;
		}

		if (rpt_frm.report_content.value.length == 0) {
			alert("내용을 써주세요.");
			rpt_frm.report_content.focus();
			return;
		}
		document.rpt_frm.submit();
	}
</script>
</html>