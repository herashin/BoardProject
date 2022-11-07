<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
<body>
	<h1>학생 상세 조회</h1>
	<div>
		<form action="${contextPath}/modify.do"  method="post"  id="frm_detail">
			
			<div>
				<label for="freeNo">게시글번호</label>
				<input type="text" id="freeNo" name="freeNo" value="${free.freeNo}" readonly>
			</div>
			<div>
				<label for="writer">작성자</label>
				<input type="text" id="writer" name="writer" value="${free.writer}">
			</div>
			
			
			<div>
				<label for="ip">작성IP</label>
				<input type="text" id="ip" name="ip" value="${free.ip}">
			</div>
			
			<div>
				<label for="hit">조회수</label>
				<input type="text" id="hit" name="hit" value="${free.hit}">
			</div>
			
			<div>
				<label for="title">제목</label>
				<input type="text" id="title" name="title" value="${free.title}">
			</div>
			<div>				
				<textarea rows="30" cols="30"   name="content"   id="content"> ${free.content}  </textarea>
			
			</div>			
		
			
			<div>
				<input type="submit" value="수정" >				
				
				<input type="button"  value="목록"  id="btn_list">
				
			</div>
			
			
		</form>
	</div>
</body>
</html>