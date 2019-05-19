<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<%=cp%>/resources/todolist.css">
<link href="https://fonts.googleapis.com/css?family=Jua|Stylish&display=swap" rel="stylesheet">
<title>TodolistRegister</title>
<script type="text/javascript">
$(document).ready(function() {

	var formObj = $("form[role='form']");

	console.log(formObj);

	$(".btn-warning").on("click", function() {
		formObj.attr("action", "/board/modify");
		formObj.attr("method", "get");
		formObj.submit();
	});

	$(".btn-danger").on("click", function() {
		formObj.attr("action", "/board/remove");
		formObj.submit();
	});

	$(".btn-primary").on("click", function() {
		self.location = "/board/listAll";
	});

});
</script>
<style>
</style>
</head>

<body>
	<div class="page-register">
		<div class="grid-container-2">
			<div class="hello">할일을 만들어요.</div>
			<div align="right">
				<button class="btn btnGray" onclick="javascript:location.href='<%=cp%>/';">메인으로 가기</button>
			</div>
		</div>
		<input type='hidden' name='bnum' value="${boardVO.bnum}">
		<div class="grid-container-2">
			<div>
				<table>
					<tr>
						<td>제목</td>
						<td>
							<input type="text" name='title' class="boxGray inputBox" value='${boardVO.title }' readonly="readonly">
						</td>
					</tr>
					<tr>
						<td valign="top">내용</td>
						<td>
							<textarea class="boxGray textBox" name="content" rows="3" readonly="readonly">${boardVO.content}</textarea>
						</td>
					</tr>
				</table>
			</div>
			<div>
				우선순위<input style="width: 100%;" type="text" name='priority' class="boxGray inputBox" value="${boardVO.priority }" readonly="readonly">
				<br>
				마감날짜 <input style="width: 100%;" type="text" name='deadline' class="boxGray inputBox"  value="${boardVO.deadline }" readonly="readonly">
				<br>
				<br>
				<button class="btn btnGreen" style="width: 28%" onclick="javascript:location.href='<%=cp%>/todolist/modify?bnum=${boardVO.bnum }';">수정</button>
				<button class="btn btnRed" style="width: 28%" onclick="javascript:location.href='<%=cp%>/todolist/remove?bnum=${boardVO.bnum }';">삭제</button>
				<button class="btn btnGray" style="width: 39%" onclick="javascript:location.href='<%=cp%>/todolist/listAll';">전체목록</button>
			</div>
		</div>
	</div>
</body>
</html>