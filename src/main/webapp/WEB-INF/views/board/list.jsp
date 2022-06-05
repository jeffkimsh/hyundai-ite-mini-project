<!-- 
작성자 : 차은채
기능 : 글 목록 페이지
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 최상단의 경로를 좀 더 편리하고, 수정시에도 경로가 어디인지 헷갈리지 않도록 변수 값에 저장해주었다. -->
<c:set var="root" value="${pageContext.request.contextPath}"/>

<!-- 로그인한 사용자가 없으면 로그인 페이지로 넘어가게 조건을 걸어주었다. url에 직접 입력해도 들어가지지 않도록 만들어주었다. -->
<c:if test="${member == null}">
	<c:redirect url="/member/login"/>
</c:if>

<!-- 로그인한 사용자가 있으면 이제 게시글 목록을 확인할 수 있다. -->
<c:if test="${member != null}">
<!DOCTYPE html>
<html lang="ko">
	<head>
		<title>글목록</title>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<!-- bootstrap을 사용하여 필요한 디자인을 가져와 쓸 수 있도록 만들었다. -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
		<script type="text/javascript">
		$(document).ready( function() {
			// 글 작성 페이지로 이동시켜준다.
	        $("#regBtn").on("click", function () {
				self.location="/board/register";				
			});
			
			var operForm = $("#operForm"); 
			  
			// 글 수정
		    $("button[data-oper='modify']").on("click", function(e){
		    
		      operForm.attr("action","/board/modify").submit();
		    
		    });
			
		    //조회페이지 이동부분 처리
			$(".move").on("click",function(e) {
				e.preventDefault(); //<a> 작동 중지
				alert("hi");
				//input 태그 추가
				actionForm.append("<input type='hidden' name='bno' value='"+$(this).attr("href") + "'>");
				actionForm.attr("action","/board/get"); //url변경
				actionForm.submit(); //form submit
			});//end click
			
		  // 글 번호 넘겨주기
		  $("#detailcolor").click(function() {
			$("#pageNumform").attr("action", "${root}/board/get").submit();
		  });
			
		 //검색버튼 이벤트 처리
		 $("#searchBtn").on("click", function(e){			     
	       	//검색 종류 선택 안했을경우
		     if( !searchForm.find("option:selected").val()){
		         alert("검색 종류를 선택하세요");
		         return false; //전송 막기
		     }//end if			 
		     //키워드 입력 안했을경우
		     if(!searchForm.find("input[name='keyword']").val()){
		         alert("키워드를 입력하세요");
		         return false; //전송 막기
		      }//end if
		      //페이지 1페이지로 이동 처리
		     searchForm.find("input[name='pageNum']").val("1");			      
		     e.preventDefault(); //	새로 실행 금지		      
		     searchForm.submit(); //form submit			      
		  });//end click
	
		});
		
		</script>
	</head>
	
	<!-- 헤더 삽입  -->
	<%@ include file="../header.jsp"%>
	<br><br><br><br><br>
	
	<body>	
		<div class="container" align="center">
		  <div class="col-lg-18" align="center">
		  <br><br>
			  <table class="table table-borderless">
			  	<tr>
			  	<td align="left">
			  		<!-- 버튼을 눌렀을 때 자바스크립트로 글쓰기 페이지로 이동할 수 있도록 만들어 주었다. -->
			  		<a href="/board/register" id="writecolor"><button type="button" class="btn btn-write" id="regBtn">글쓰기</button></a>
			  	</td>
					
				<!-- 검색 처리 form -->
			   <td align="right">
					<form id='searchForm' action="/board/list" method='get'>
						<select name='type'>
							<option value="" <c:out value="${pageMaker.cri.type == null?'selected':''}"/> />   --  </option>
							<option value="T"<c:out value="${pageMaker.cri.type eq 'T'?'selected':''}"/> /> 제목</option>
							<option value="C" <c:out value="${pageMaker.cri.type eq 'C'?'selected':''}"/> /> 내용</option>
							<option value="W" <c:out value="${pageMaker.cri.type eq 'W'?'selected':''}"/>/> 작성자</option>
							<option value="TC" <c:out value="${pageMaker.cri.type eq 'TC'?'selected':''}"/>/> 제목	or 내용</option>
							<option value="TW" <c:out value="${pageMaker.cri.type eq 'TW'?'selected':''}"/>/> 제목	or 작성자</option>
							<option value="TWC" <c:out value="${pageMaker.cri.type eq 'TWC'?'selected':''}"/>/> 제목	or 내용 or 작성자</option>
						</select> <!--end select  --> 
					<input type='text'   name='keyword' value="${pageMaker.cri.keyword}" /> 
					<input type='hidden' name='pageNum' value="${pageMaker.cri.pageNum}" /> 
					<input type='hidden' name='amount' value="${pageMaker.cri.amount}" />
					<button class='btn btn-default' id="searchBtn">검색</button>
					</form><!--end from  -->
				</td>
			   <!-- end  검색 처리 form-->
			  	</tr>
			  </table>
			  
			  <!-- 게시글이 하나라도 존재한다면 게시판 테이블이 보여지도록 만들었다. forEach문으로 게시글 갯수만큼 반복을 돌려줄 것이다. -->
			  <c:if test="${list.size() != 0}">
				  <table class="table">
					  <thead class="thead-color">
					    <tr>
					      <th scope="col">#</th>
					      <th scope="col">제목</th>
					      <th scope="col">글 내용</th>
					      <th scope="col">ID</th>
					      <th scope="col">작성날짜</th>
					      <th scope="col"></th>
					    </tr>
					  </thead>
					  <!-- forEach문을 사용해서 데이터베이스에 있는 게시글 리스트에서 한 글씩  -->
				  	  <c:forEach var="board" items="${list}">
					      <tbody>
					        <!-- tr 한 줄씩 게시글 리스트를 받아와서 테이블을 만들어줄 것이다. posts 안에 담아둔 BoardVO 값을 변수 post에 담아서 원하는 결괏값을 출력해주었다. -->
						    <tr id="tr-color">
						      <th scope="row">${board.postno}</th>
						      <!-- 글 보여지는 칸 조정 css를 지정해주기 위해 titletd id 값을 지정해주었다. -->
						      <td id="titletd">${board.title}</td>
						      <td>${board.qcontent}</td>
						      <td>${board.writerid}</td>
						      <td>${board.writedate}</td>
						      <td>
                                <a href="/board/get?bno=${board.postno}" id="detailcolor">상세보기</a>
                                <form role="form" action="" method="post" id="pageNumform">
							       <input type='hidden' id='bno' name='bno' value="${board.postno}">
							       <input type='hidden' name='pageNum' value="${cri.pageNum}">
							  	   <input type='hidden' name='amount' value="${cri.amount}">
							    </form> 
                                <%-- <a class='move' href='"/board/get?bno=" + <c:out value="${board.postno}"/>' id="detailcolor">상세보기</a> --%>
                              </td>
						    </tr>
					    </tbody>
				  	</c:forEach>
				  </table>
				  <br>
				  <!--페이지 번호 처리  -->   
			      <div class='pull-right'>
			          <ul class="pagination">
			 
			            <c:if test="${pageMaker.prev}"> <!-- 이전 버튼 -->
			              <li class="paginate_button previous">
			              	<a href="list?pageNum=${pageMaker.startPage - 1}">이전</a>&nbsp;&nbsp;&nbsp;&nbsp;
			              </li>
			            </c:if>
			            
			             <!-- 1~10 버튼 -->
			            <c:forEach var="num" begin="${pageMaker.startPage}" 
			            	end="${pageMaker.endPage}">
			              <li class="paginate_button">
			              	<a href="list?pageNum=${num}">${num}</a>&nbsp;&nbsp;&nbsp;&nbsp;
			              </li>
			            </c:forEach>
			 
			            <c:if test="${pageMaker.next}"> <!-- 다음 버튼 -->
			              <li class="paginate_button next">
			              	<a href="list?pageNum=${pageMaker.endPage +1}">다음</a>
			              </li>
			            </c:if>
			            
			          </ul> <!--end ul  -->          
			      </div><!--  end Pagination -->  
				  <br><br><br>
			  </c:if>
			  
			  <!-- 만약에 게시글이 하나도 없다면 작성된 글이 없다고 표시해주었다. -->
			  <c:if test="${list.size() == 0}">
				  <table class="table table-active">
				    <tbody>
				      <tr class="table-info" align="center">
				        <td>작성된 글이 없습니다.</td>
				      </tr>
				    </tbody>
				  </table>
			  </c:if>
		  </div>
		</div>
	</body>
	
	<!-- 푸터 삽입 -->
	<%@ include file="../footer.jsp"%>
	<style>
		* {
		   font-family: 'Noto Sans KR', sans-serif;
		}
		#boardimg{
			width: 20px;
		}
		td#imgtd {
		    width: 100px;
		}
		td#titletd {
	    	width: 200px;
		}
		thead.thead-color {
	    	background-color: #EBECEF;
		}
		.btn-write {
		    color: #fff;
		    background-color: #788EAB;
		    border-color: #788EAB;
		}
		button.btn.btn-write:hover {
		    color: white;
		}
		.btn-search {
		    color: #fff;
		    background-color: #2E3740;
		    border-color: #2E3740;
		}
		.btn-search:hover {
		    color: #fff;
		}
		/* tr#tr-color {
		    background-color: #EBECEF;
		} */
		.table-info, .table-info>td, .table-info>th {
		    background-color: #EBECEF;
		}
		.table-info td{
		    border-color: #EBECEF;
		}
		a#detailcolor {
		  color: #788EAB;
		}
		a#modifycolor {
		  color: #DDAE09;
		}
		a#deletecolor {
		  color: #DD5509;
		}
		a#writecolor {
		  color: #fff;
		}
		a:hover{
		  text-decoration: none;
		}
		/* a:hover {
		  border: 1px solid #788EAB;
  		  border-radius: 10px;
		  text-decoration: none;
		} */
		.pull-right {
	    background: #EBECEF;
	    border-radius: 7px;
	    padding: 4px;
	    padding-right: 10px;
		}
	</style>
</html>
</c:if>