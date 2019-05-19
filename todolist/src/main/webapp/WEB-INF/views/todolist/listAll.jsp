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
<title>todolistMain</title>
<script type="text/javascript">
</script>
<style>
</style>
</head>
<body>
	<div class="page">
		<div class="grid-container-2">
			<div class="hello">
				전체 할일이에요 <font size="25px;">마감기간, 우선순위, 생성날짜 순으로 정렬되어 있습니다</font>
			</div>
			<div align="right" style="vertical-align: top;">
				<button class="btn btnGray" onclick="javascript:location.href='<%=cp%>/';">메인으로 가기</button>
				<button class="btn btnGreen" onclick="javascript:location.href='<%=cp%>/todolist/register';">새로운 할일 추가</button>
			</div>
		</div>
		<div>
			<table class="todolist">
				<tr>
					<th>제목</th>
					<th width="30%">내용</th>
					<th>생성날짜</th>
					<th>마감기간</th>
					<th>할일을 다했나요</th>
					<th>삭제</th>
				</tr>
				<c:forEach items="${list}" var="boardVO">
					<c:choose>
						<c:when test="${boardVO.finish == 'yes' }">
							<tr align="center" style="background-color: #edf4d7; border-radius: 12px;">
								<td>
									<a href='/todolist/read?bnum=${boardVO.bnum}' style="text-decoration: none;">${boardVO.title}</a>
								</td>
								<td>${boardVO.content}</td>
								<td>${boardVO.createdate}</td>
								<td>${boardVO.deadline}</td>
								<td>이미 완료했어요</td>
								<td>
									<button class="btn btnRed" onclick="javascript:location.href='<%=cp%>/todolist/remove?bnum=${boardVO.bnum }';">삭제</button>
								</td>
							</tr>
						</c:when>
						<c:when test="${boardVO.finish == 'no' }">
							<tr align="center">
								<td>
									<a href='/todolist/read?bnum=${boardVO.bnum}' style="text-decoration: none;">${boardVO.title}</a>
								</td>
								<td>${boardVO.content}</td>
								<td>${boardVO.createdate}</td>
								<td>${boardVO.deadline}</td>
								<td>
									<button class="btn btnGray" onclick="javascript:location.href='<%=cp%>/todolist/modifyFinish?bnum=${boardVO.bnum }';">다했어요</button>
								</td>
								<td>
									<button class="btn btnRed" onclick="javascript:location.href='<%=cp%>/todolist/remove?bnum=${boardVO.bnum }';">삭제</button>
								</td>
							</tr>
						</c:when>
					</c:choose>
				</c:forEach>
			</table>

		</div>
	</div>
</body>
</html>