<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form>
		<h1>guest</h1>

		<h2>guest 리스트</h2>
		<p>guest 리스트입니다.</p>

		<c:forEach items="${requestScope.gList}" var="guestVO">
			<table border="1" width="540px">
				<tr>
					<td>식별번호</td>
					<td>${guest.no}</td>

					<td>이름</td>
					<td>${guest.name}</td>

					<td>비밀번호</td>
					<td>${guest.password}</td>
				</tr>
				<tr>
					<td colspan="4"><textarea cols="72" rows="5"></textarea></td>
				</tr>
				<tr>
					<td colspan="4"><button type="">등록</button></td>
				</tr>
			</table>
	</form>
	<br>

	<table border="1" width="540px">
		<tr>
			<td>[1]</td>
			<td>이효리</td>
			<td>2022-01-01</td>
			<td><a href="">삭제</a></td>
		</tr>
		<tr>
			<td colspan="4">방문하고 갑니다.</td>
		</tr>
	</table>
	<br>

	<table border="1" width="540px">
		<tr>
			<td>[2]</td>
			<td>유재석</td>
			<td>2022-02-02</td>
			<td><a href="">삭제</a></td>
		</tr>
		<tr>
			<td colspan="4">방문하고 갑니다.</td>
		</tr>
	</table>
	<br>

	<table border="1" width="540px">
		<tr>
			<td>[3]</td>
			<td>강호동</td>
			<td>2021-11-10</td>
			<td><a href="">삭제</a></td>
		</tr>
		<tr>
			<td colspan="4">방문하고 갑니다.</td>
		</tr>
		<tr>
			<td><a
				href="">
					[수정폼으로 이동] </a></td>

			<%
			System.out.println("여기는 수정폼입니다");
			%>

			<td><a href="">
					[삭제] 
				</a></td>
			<!-- 원래 버튼으로 해야된다 js필요 안배워서 a태그로 구현 -->
			<a href="http://localhost:8080/guestbook/gbc?action=delete"></a>
		<tr>
		</tbody>
	</table>
	<br>

	</c:forEach>

	<a href="">등록폼 이동</a>

	<%
	System.out.println("여기는 등록폼입니다");
	%>

</body>
</html>