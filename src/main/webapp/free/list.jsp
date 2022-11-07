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
<style type="text/css">
.delete_btn{
	text-decoration: underline;
	color:blue;
	cursor:pointer;
}
</style>
</head>
<body>
	
	 <a href="${contextPath}/insert.do">게시글 작성하러 가기</a>
	<hr>
	
	
	<table border="1">	
		<thead>
			<tr>
				<td>게시글번호</td>
				<td>제목</td>
				<td>작성자</td>
				<td>조회수</td>
				<td>삭제</td>				
			</tr>
		</thead>
		<tbody>
			<c:if test="${count eq 0}">
				<tr>
					<td colspan="8">등록된 글이 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${count ne 0}">
				<c:forEach items="${frees}" var="f">
					<tr>
						<td>${f.freeNo}</td>
						<td class="delete_btn" onclick="fn_detail(${f.freeNo})">${f.title}</td>
						<td>${f.writer}</td>
						<td>${f.hit}</td>	
						<td class="delete_btn" onclick="fn_remove(${f.freeNo})">X</td>										
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
	
	</table>
	<script>
	
	function fn_detail(freeNo){
	
			location.href= '${contextPath}/detail.do?freeNo='+freeNo;
		
	}
	
	function fn_remove(freeNo){
		if(confirm('게시글을 삭제할까요?')){
			location.href= '${contextPath}/remove.do?freeNo='+freeNo; 
		}
	}
	
	</script>
</body>
</html>