<!-- 
작성자 : 차은채
기능 : 글 수정 페이지
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 최상단의 경로를 좀 더 편리하고, 수정시에도 경로가 어디인지 헷갈리지 않도록 변수 값에 저장해주었다. -->
<c:set var="root" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
	<title>글 수정</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- bootstrap을 사용하여 필요한 디자인을 가져와 쓸 수 있도록 만들었다. -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
	
	<!-- 헤더 삽입  -->
	<%@ include file="../header.jsp"%>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<br><br><br><br><br><br>
	
	<script type="text/javascript">
	$(document).ready(function() {
	  // 글 삭제 버튼 클릭시 remove 호출
	  var operForm = $("#operForm"); 
	  
	  $("button[data-oper='remove']").on("click", function(e){
	    
	    operForm.attr("action","/board/remove").submit();
	    
	  });

	});

	</script>
</head>
<body>

<div class="container" align="center">
	<div class="col-lg-6" align="center">
	<br><br>
		<h4>게시글 수정</h4>
		<form role="form" action="/board/modify" method="post" id="writeform"> 
	        <div class="form-group" align="left">
				<label for="postno">글 번호:</label>
				<input type="text" class="form-control" id="postno" name="postno" value="${board.postno}" readonly="readonly">
			</div>
			<div class="form-group" align="left">
				<label for="title">제목:</label>
				<input type="text" class="form-control" id="title" name="title" value="${board.title}">
			</div>
			<div class="form-group" align="left">
				<label for="qcontent">내용:</label>
				<textarea class="form-control" rows="15" id="qcontent" name="qcontent">${board.qcontent}</textarea>
			</div>
			<input type='hidden' id='acontent' name='acontent' value="${board.acontent}">
	        <button data-oper='modify' class="btn btn-modify">글 수정</button>
		</form>
		<button data-oper='remove' class="btn btn-danger">삭제</button>
		<!-- 글 삭제 시 글 번호를 가져가도록 hidden으로 값을 보내주었다. -->
		<form id='operForm' action="/board/remove" method="post">
	       	<input type='hidden' id='bno' name='bno' value="${board.postno}">
		</form> 
		<br><br>
		<!-- 글 목록으로 돌아갈 수 있도록 경로를 바로 지정해주었다. -->
		<p><a style="color: #2E3740" href="/board/list">글 목록으로 가기</a></p>
	</div>
</div>
</body>
<br><br><br>
<style>
	* {
	   font-family: 'Noto Sans KR', sans-serif;
	}
	.btn-modify {
	    color: #fff;
	    background-color: #788EAB;
	    border-color: #788EAB;
	}
	button.btn.btn-modify:hover {
	    color: white;
	}
	form{
		display:inline
	}
</style>
</html>