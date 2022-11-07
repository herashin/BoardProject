<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>

	$(document).ready(function(){
		
	
		
		
		
		
		$('#btn_list').click(function(){
			
			location.href= '${contextPath}/list.do';
			
			
		});
		
		
	});

</script>
</head>
<body>
	<h1>자유게시판 게시글 작성화면</h1>
	<div>
		<form action="${contextPath}/add.do"  method="post"  id="frm_write">
			
			<div>
				<label for="writer">작성자</label>
				<input type="text" id="writer" name="writer" >
			</div>
			
			
			<div>
				<label for="title">제목</label>
				<input type="text" id="title" name="title" >
			</div>
			
			<div>
				<label for="content">내용</label>
				<textarea rows="30" cols="50" id="content" name="content"></textarea>
			</div>			
			
			<div>
				<input type="hidden" id="ip"  name="ip">
				<input type="hidden" id="hit"  name="hit">
			</div>
			
			<div>
				<input type="submit" value="작성완료" >
				
				<input type="reset" value="다시작성" >				
				
				<input type="button"  value="목록"  id="btn_list">
				
			</div>
			
			
		</form>
	</div>
</body>
</html>