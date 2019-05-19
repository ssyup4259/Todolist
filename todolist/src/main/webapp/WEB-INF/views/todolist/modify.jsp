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
<script src="/resources/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var formObj = $("form[role='form']");
		console.log(formObj);
		$(".btnGreen").on("click", function() {
			formObj.submit();
		});
	});
</script>
<script type="text/javascript">
	function chkword(obj, maxByte) {

		var strValue = obj.value;
		var strLen = strValue.length;
		var totalByte = 0;
		var len = 0;
		var oneChar = "";
		var str2 = "";

		for (var i = 0; i < strLen; i++) {
			oneChar = strValue.charAt(i);
			if (escape(oneChar).length > 4) {
				totalByte += 2;
			} else {
				totalByte++;
			}

			// 입력한 문자 길이보다 넘치면 잘라내기 위해 저장
			if (totalByte <= maxByte) {
				len = i + 1;
			}
		}

		// 넘어가는 글자는 자른다.
		if (totalByte > maxByte) {
			alert(maxByte + "자를 초과 입력 할 수 없습니다.");
			str2 = strValue.substr(0, len);
			obj.value = str2;
			chkword(obj, 4000);
		}
	}
</script>
<style>
</style>
</head>

<body>
	<div class="page-register">
		<div class="grid-container-2">
			<div class="hello">할일을 만들어요.</div>
			<div align="right">
				<button type="submit" class="btn btnGreen" style="width: 28%">수정</button>
				<button class="btn btnRed" style="width: 28%;" onclick="javascript:history.back();">취소</button>
				<button class="btn btnGray" onclick="javascript:location.href='<%=cp%>/todolist/listAll';" style="width: 38%">전체 할일 보기</button>
			</div>
		</div>
		<form role="form" method="post">
			<div class="grid-container-2">
				<input type="hidden" name='bnum' class="form-control" value="${boardVO.bnum}" readonly="readonly">

				<div>
					<table>
						<tr>
							<td>제목</td>
							<td>
								<input type="text" name='title' class="boxGray inputBox" onkeyup="chkword(this, 30)" value="${boardVO.title}">
							</td>
						</tr>
						<tr>
							<td valign="top">내용</td>
							<td>
								<textarea class="boxGray textBox" name="content" rows="3" onkeyup="chkword(this, 300)">${boardVO.content}</textarea>
							</td>
						</tr>
					</table>
				</div>
				<div align="left">
					우선순위를 정해주세요
					<br>
					(1이 가장 급한 할일이에요)
					<br>
					<select class="boxGray selectBox" name="priority">
						<option value="1">1. 우선적으로 해야되요</option>
						<option value="2">2. 급한거 먼저 하세요</option>
						<option value="3" selected="selected">3. 여유를 가지고 하세요</option>
						<option value="4">4. 언제가 하면 되요</option>
						<option value="5">5. 솔직히 안할꺼죠?</option>
					</select>
					<br>
					<br>
					마감날짜를 입력해주세요
					<br>
					(ex. 2019/05/18)
					<br>
					<input style="width: 100%;" type="text" name='deadline' class="boxGray inputBox" value="${boardVO.deadline }">
				</div>
			</div>
		</form>
	</div>
</body>
</html>