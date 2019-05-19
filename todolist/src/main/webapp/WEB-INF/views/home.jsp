<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page session="false"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<%=cp%>/resources/todolist.css">
<link href="https://fonts.googleapis.com/css?family=Jua|Stylish|GyeonggiBatang&display=swap" rel="stylesheet">
<title>todolistMain</title>
<script type="text/javascript">
	
</script>
<style>
</style>
</head>

<body>
	<div class="page">
		<div class="grid-container-4">
			<div class="hello">
				안녕하세요<br> ${fn:length(listToday)}개의 할일이 남아있습니다.
			</div>
			<div align="right">
				<button class="btn btnGray" onclick="javascript:location.href='<%=cp%>/todolist/listAll';">전체 할일 보기</button>
				<button class="btn btnGreen" onclick="javascript:location.href='<%=cp%>/todolist/register';">새로운 할일 추가</button>
			</div>
			<div style="border: 3px solid pink; border-radius: 12px;">
				<table class="todolist" style="text-align: center;">
					<tr>
						<th>제목</th>
						<th>내용</th>
						<th>마감기간</th>
						<th>생성날짜</th>
					</tr>
					<c:forEach items="${listToday}" var="boardVO">
						<tr>
							<td align="center">
								<a href='/todolist/read?bnum=${boardVO.bnum}'>${boardVO.title}</a>
							</td>
							<td>${boardVO.content}</td>
							<td>
								${boardVO.deadline}
							</td>
							<td>
								${boardVO.createdate }
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div style="border: 3px solid pink; border-radius: 12px;">
				<div class="hello" style="font-size: 25px; padding-left: 10px;">
					${fn:length(listOver)}개를 기간안에 못했어요ㅠㅠ<br> <br>
				</div>
				<table class="todolist">
					<tr>
						<th>제목</th>
						<th>마감기간</th>
						<th>삭제</th>
					</tr>
					<c:forEach items="${listOver}" var="boardVO">
						<tr>
							<td>
								<a href='/todolist/read?bnum=${boardVO.bnum}'>${boardVO.title}</a>
							</td>
							<td align="center">
								${boardVO.deadline}
							</td>
							<td align="center">
								<button class="btn btnRed" style="height: 30px;" onclick="javascript:location.href='<%=cp%>/todolist/remove?bnum=${boardVO.bnum }';">삭제</button>
							</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
</body>
</html>