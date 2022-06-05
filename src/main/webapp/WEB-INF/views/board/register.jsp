<!-- 
작성자 : 차은채
기능 : 글 작성 페이지
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 최상단의 경로를 좀 더 편리하고, 수정시에도 경로가 어디인지 헷갈리지 않도록 변수 값에 저장해주었다. -->
<c:set var="root" value="${pageContext.request.contextPath}"/>

<!-- 헤더 삽입 -->


<!DOCTYPE html>
<html lang="ko">
<head>
  <title>글작성</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <!-- bootstrap을 사용하여 필요한 디자인을 가져와 쓸 수 있도록 만들었다. -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
  <script type="text/javascript">
  // 작성된 글을 보내주는 함수
  $(document).ready(function() {
	  // 글 등록 버튼 클릭시 필수 입력사항을 입력하지 않았을 경우 알림창을 띄워주었고, 모든 요건이 충족되면 등록을 해주었다.
	  $("#writeBtn").click(function() {
			if($("#title").val() == "") {
				alert("제목을 입력해주세요!");
				return;
			} else if($("#qcontent").val() == "") {
				alert("내용을 입력해주세요!");
				return;
			} else if($("#writerid").val() == "") {
				alert("아이디를 입력해주세요!");
				return;
			/* } else if($("#writerid").val() != "board.writerid") { */
				/* 잘못된 아이디로 입력했을 경우 무결성 제약조건(부모키 없음)으로 인한 500에러 막기 위해 검토 */
				/* alert("아이디를 정확하게 입력해주세요!");
				return; */
			} else {
				$("#writeform").attr("action", "${root}/board/register").submit();
			}
		});
	});
  </script>
<!-- 헤더 삽입  -->
<%@ include file="../header.jsp"%>
</head>
<body>
<div class="container" align="center">
	<div class="col-lg-6" align="center">
	<br><br><br><br><br><br><br><br>
		<h4>글 작성</h4>
		<form role="form" action="" method="post" id="writeform">
			<div class="form-group" align="left">
				<label for="title">제목:</label>
				<input type="text" class="form-control" id="title" name="title">
			</div>
			<div class="form-group" align="left">
				<label for="qcontent">내용:</label>
				<textarea class="form-control" rows="15" id="qcontent" name="qcontent"></textarea>
			</div>
			<div class="form-group" align="left">
	            <label for="writerid">아이디 확인: </label>
	            <input type="text" class="form-control" id="writerid" name="writerid">
	        </div>
	        <!--  관리자 댓글 관리를 위해 작성자는 답변을 달 수 없음으로 acontent를 null값 대신 noreply값을 hidden으로 보내주었다. -->
	        <input type='hidden' id='acontent' name='acontent' value="noreply">
			
			<!-- 버튼을 눌렀을 때 자바스크립트로 form을 넘겨주도록 만들어 주었다. -->
			<button type="button" class="btn btn-register" id="writeBtn">글 등록</button>
			<button type="reset" class="btn btn-remove">초기화</button>
			<br><br>
			<!-- 글 목록으로 돌아갈 수 있도록 경로를 바로 지정해주었다. -->
			<p><a style="color: #2E3740" href="/board/list">글 목록으로 가기</a></p>
		</form>
	</div>
</div>

</body>

<!-- 푸터 삽입 -->
<%@ include file="../footer.jsp"%>
<style>
	* {
	   font-family: 'Noto Sans KR', sans-serif;
	}
	.btn-register {
	    color: #fff;
	    background-color: #788EAB;
	    border-color: #788EAB;
	}
	button.btn.btn-register:hover {
	    color: white;
	}
	.btn-remove {
	    color: #fff;
	    background-color: #2E3740;
	    border-color: #2E3740;
	}
	button.btn.btn-remove:hover {
	    color: white;
	}
</style>

</html>