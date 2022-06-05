<!-- 
작성자 : 차은채
기능 : 글 상세 페이지
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 최상단의 경로를 좀 더 편리하고, 수정시에도 경로가 어디인지 헷갈리지 않도록 변수 값에 저장해주었다. -->
<c:set var="root" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
	<title>글 상세</title>
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
		  
		  // 글 수정하기
		  var operForm = $("#operForm"); 
		  
		  $("button[data-oper='modify']").on("click", function(e){
		    
		    operForm.attr("action","/board/modify").submit();
		    
		  });//end modify
		  
		  // 관리자 답변 보내주기
		  $("#answerBtn").click(function() {
				if($("#acontent").val() == "") {
					alert("답변을 입력해주세요!");
					return;
				} else {
					$("#answerform").attr("action", "${root}/board/modify").submit();
				}
			});
		  
		  // 답변 삭제하기
		  $("#deletereplyBtn").click(function() {
			alert("답변을 삭제하겠습니다.");
			$("#deletereplyform").attr("action", "${root}/board/modify").submit();
		  });
		  
		  // 답변 수정하기
		  $("#modifyreplyBtn").click(function() {
			alert("답변을 수정하겠습니다.");
			$("#modifyreplyform").attr("action", "${root}/board/modify").submit();
		  });
		 
		});//end ready
	</script>
</head>
<body>

<div class="container" align="center">
	<div class="col-lg-6" align="center">
	<br><br>
		<h4>게시글 상세</h4>
		<div class="form-group" align="left">
			<label for="postno">글 번호:</label>
			<input type="text" class="form-control" id="postno" name="postno" value="${board.postno}" readonly="readonly">
		</div>
		<div class="form-group" align="left">
			<label for="title">제목:</label>
			<input type="text" class="form-control" id="title" name="title" value="${board.title}" readonly="readonly">
		</div>
		<div class="form-group" align="left">
			<label for="qcontent">내용:</label>
			<textarea class="form-control" rows="8" id="qcontent" name="qcontent" readonly="readonly">${board.qcontent}</textarea>
		</div>
		<div class="form-group" align="left">
			<label for="writerid">작성자:</label>
			<input type="text" class="form-control" id="writerid" name="writerid" value="${board.writerid}" readonly="readonly">
		</div>
		<!-- 답변이 존재하는 경우 (처음에 글을 등록할 때 답변에 null값이 들어가지 않도록 'noreply'값을 넣어주었고 그 값으로 답변 존재여부를 판단하였다.) -->
		<c:if test="${'noreply' != board.acontent}">
			<%-- <c:if test="${'admin' != board.writerid}"> --%>
			<!-- 로그인한 사용자가 관리자가 아닐 경우 관리자가 작성된 글을 볼 수 있도록 readonly로 막아주었다. -->
			<c:if test="${member.id != 'admin'}">
				<div class="form-group" align="left">
					<label for="writerid">관리자 답변:</label>
					<input type="text" class="form-control" id="acontent" name="acontent" value="${board.acontent}" readonly="readonly">
				</div>
			</c:if>
			
			<%-- <c:if test="${'admin' == board.writerid}"> --%>
			<!-- 로그인한 사용자가 관리자라면 답변을 수정할 수 있는 입력창과 수정,삭제를 할 수 있는 버튼을 보여주도록 만들었다. -->
			<c:if test="${member.id == 'admin'}">
				<div class="form-group" align="left">
					<label for="writerid">관리자 답변:</label>
					<input type="text" class="form-control" id="acontent" name="acontent" value="${board.acontent}" readonly="readonly">
				</div>
	
				<!-- 답변 수정을 눌렀을 때 기존 Board 테이블의 값을 update해주는 형식으로 acontent 외의 다른 부분들은 null값이 들어가지 않도록 form에 hidden으로 값을 넘겨주었다. -->
				<form role="form" action="" method="post" id="modifyreplyform">
			       	<div class="form-group" align="left">
						<label for="writerid">답변 수정:</label>
						<input type="text" class="form-control" id="acontent" name="acontent" value="${board.acontent}">
					</div>
			       	<input type='hidden' id='writerid' name='writerid' value="${board.writerid}">
					<input type='hidden' id='title' name='title' value="${board.title}">
					<input type='hidden' id='qcontent' name='qcontent' value="${board.qcontent}">
					<input type='hidden' id='writedate' name='writedate' value="${board.writedate}">
					<input type='hidden' id='postno' name='postno' value="${board.postno}">
				</form>
				<button id="modifyreplyBtn" class="btn btn-warning location">답변 수정</button>
				
				<!-- 답변 삭제를 눌렀을 때 acontent의 값을 존재하지 않는다는 의미인 noreply값으로 update 해주었다. -->
				<button id="deletereplyBtn" class="btn btn-danger location">답변 삭제</button>
				<form role="form" action="" method="post" id="deletereplyform">
			       	<input type='hidden' id='acontent' name='acontent' value="noreply">
			       	<input type='hidden' id='writerid' name='writerid' value="${board.writerid}">
					<input type='hidden' id='title' name='title' value="${board.title}">
					<input type='hidden' id='qcontent' name='qcontent' value="${board.qcontent}">
					<input type='hidden' id='writedate' name='writedate' value="${board.writedate}">
					<input type='hidden' id='postno' name='postno' value="${board.postno}">
				</form>
			</c:if>
		</c:if>
		<!-- 답변이 존재하지 않는 경우 (관리자가 로그인 했을 때 답변을 등록할 수 있는 폼을 만들었다.) -->
		<c:if test="${'noreply' == board.acontent}">
			<%-- <c:if test="${'admin' == board.writerid}"> --%>
			<!-- 관리자가 로그인했을 때 보여야하니까 아래 주석으로 바꿔주기 -->
			<c:if test="${member.id == 'admin'}">
			<!-- 답변 등록을 눌렀을 때 기존 Board 테이블의 값을 update해주는 형식으로 acontent 외의 다른 부분들은 null값이 들어가지 않도록 form에 hidden으로 값을 넘겨주었다. -->
				<form role="form" action="" method="post" id="answerform">
					<div class="form-group" align="left">
						<label for="adminanswer">답변:</label>
						<input type="text" class="form-control" id="acontent" name="acontent">
					</div>
					<input type='hidden' id='writerid' name='writerid' value="${board.writerid}">
					<input type='hidden' id='title' name='title' value="${board.title}">
					<input type='hidden' id='qcontent' name='qcontent' value="${board.qcontent}">
					<input type='hidden' id='writedate' name='writedate' value="${board.writedate}">
					<input type='hidden' id='postno' name='postno' value="${board.postno}">
					<button type="button" class="btn btn-register" id="answerBtn">답변 등록</button>
				</form>
			</c:if>
		</c:if>

		<!-- 관리자가 아닌 사용자가 작성한 글일 경우 본인의 글을 수정할 수 있도록 수정하러 가기 버튼을 보여주었다. 작성자가 아닌경우는 보여지지 않는다. -->
       <c:if test="${member.id == board.writerid}">
       <%-- <c:if test="${'hdfive' == board.writerid}"> --%>
       <button data-oper='modify' class="btn btn-modify">수정하러 가기</button>
       <form id='operForm' action="/boad/modify" method="get">
	       <input type='hidden' id='bno' name='bno' value="${board.postno}">
	       <input type='hidden' name='pageNum' value="${cri.pageNum}">
	  	   <input type='hidden' name='amount' value="${cri.amount}">
	   </form>    
	   </c:if>     	       
		<br><br>
		<!-- 글 목록으로 돌아갈 수 있도록 경로를 바로 지정해주었다. -->
		<p><a style="color: #2E3740" href="list?pageNum=${cri.pageNum}">글 목록으로 가기</a></p>

	</div>
</div>
</body>
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
	button#answerBtn {
    color: #fff;
    background: #2E3740;
	}
	button.location{
		display:inline;
		float: center;
	}
</style>
</html>