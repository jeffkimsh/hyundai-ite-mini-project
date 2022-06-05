<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--작성자: 김연식 | 회원가입 페이지-->
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- 헤더 -->
<%@ include file="../header.jsp"%>
<!-- 기준 경로 설정 -->
<c:set var="root" value="${pageContext.request.contextPath}"/>
<script type="text/javascript">
   //회원가입 버튼 클릭시 필수 입력사항을 입력하지 않았을 경우 알림창을 띄워주었고, 요건이 충족 시 가입 진행
  function joinBtn(){
	  if($("#id").val() == "") {
			alert("아이디를 입력해주세요!");
			return;
		} else if($("#password").val() == "") {
			alert("비밀번호를 입력해주세요!");
			return;
		}else if($("#email").val() == "") {
			alert("이메일을 입력해주세요!");
			return;
		} else if($("#phone").val() == "") {
			alert("전화번호를 입력해주세요!");
			return;
		} else if($("#name").val() == "") {
			alert("이름을 입력해주세요!");
			return;
		} else if($("#birth").val() == "") {
			alert("생일을 입력해주세요!");
			return;
		}
		  else {
			$("#joinform").attr("action", "${root}/member/joinform").submit();
		}
  }
 
  </script>
<meta http-equiv="X-UA-Compatible" content="IE=edge"> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="No-Cache">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=1, target-densitydpi=medium-dpi">
<meta property="og:type" content="article">
        <meta property="og:title" content="더한섬닷컴 | THE HANDSOME.COM">
        <meta property="og:description" content="타임, 마인, 시스템, SJSJ 등 프리미엄 브랜드 및 트렌디한 해외·편집숍까지 가득한 스타일 플랫폼!">
        <meta property="og:image" content="http://s3.ap-northeast-2.amazonaws.com/cdn.thehandsome.com-kr/pc/210510_logo/%E3%84%B9%EB%A1%9C%EA%B3%A0.png">
        <meta property="og:url" content="http://www.thehandsome.com/ko/">
        <meta name="keywords" contents="한섬, 더한섬닷컴, 한섬몰, 한섬아울렛, 한섬닷컴, 더한섬, 한섬올라인몰, HANDSOME, thehandsome">
<title>
	회원정보입력폼 | 더한섬닷컴</title>
<link rel="shortcut icon" href="http://cdn.thehandsome.com/_ui/desktop/common/images/common/thehandsome_ic_16x16.ico">
<link rel="stylesheet" type="text/css" href="https://www.thehandsome.com/_ui/desktop/common/css/font_443.css" media="all">
    <link rel="stylesheet" type="text/css" href="https://www.thehandsome.com//_ui/desktop/common/css/common.css?20220401" media="all">
<link rel="stylesheet" type="text/css" href="https://www.thehandsome.com/_ui/desktop/common/css/layout.css?20220331" media="all">
<link rel="stylesheet" type="text/css" href="https://www.thehandsome.com/_ui/desktop/common/css/popup.css?20210225" media="all">
<link rel="stylesheet" type="text/css" href="https://www.thehandsome.com/_ui/desktop/common/css/jquery-ui.min.css" media="all">

<link rel="stylesheet" type="text/css" href="https://www.thehandsome.com/_ui/desktop/common/css/brand.css" media="all">
<link rel="stylesheet" type="text/css" href="https://www.thehandsome.com/_ui/desktop/common/css/footer.css?20220406" media="all">
<link rel="stylesheet" type="text/css" href="https://www.thehandsome.com/_ui/desktop/common/css/contents.css?20220221" media="all">
<style type="text/css" media="print">
 @IMPORT url("https://www.thehandsome.com/_ui/desktop/common/blueprint/print.css");
</style>
</head>
  <body>      
	
        <div id="bodyWrap">
            
            <h3 class="cnts_title"><span>회원가입</span></h3>
            
            <div class="sub_container">
                <div class="join_title">
                    <p class="title">고객님의 회원정보를 입력해주세요.</p>
                </div>
                    <fieldset>
                        <legend>회원정보입력</legend>
                        
                        <div class="box_type_1">
                            <div class="title_wrap clearfix">
                                <h4 class="float_left">회원정보</h4>
                                <p class="reqd_txt float_right"><strong class="reqd">*</strong> 표시는 필수항목입니다.</p>
                            </div>
                            
                                <div class="tblwrap">
                                <form role = form action="" method="post" id="joinform">
                                <table class="tbl_wtype1">
                                    <caption>회원가입 입력항목</caption>
                                    <colgroup>
                                        <col style="width:160px">
                                        <col>
                                    </colgroup>
                                    <tbody>
                                        <tr>
                                            <th scope="row"><strong class="reqd">*</strong>아이디</th>
                                            <td>
                                            <input type="text" class="form-control" style="width:150px" title="아이디" id="id" name="id" maxlength="20" onchange="validId()"/>
<!--                                             <input type="button" class="btn btn-primary" id="idCheck" value="중복확인" /> -->
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><strong class="reqd">*</strong><label for="pw">비밀번호</label></th>
                                            <td>
                                                <input type="password" class="form-control" id="password" name="password" style="width:150px" title="password">
                                                <span class="guide_comment lh_30" id="pwMsg"></span>
                                                <span class="guide_comment lh_30" id="pwcapsLockMsg"></span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><strong class="reqd">*</strong><label for="pw">이메일</label></th>
                                            <td>
                                                <input type="text" class="form-control" id="email" name="email" style="width:150px" title="email">
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><strong class="reqd">*</strong><label for="pw">전화번호</label></th>
                                            <td>
                                                <input type="text" class="form-control" id="phone" name="phone" style="width:150px" title="phone">
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><strong class="reqd">*</strong><label for="pw">이름</label></th>
                                            <td>
                                                <input type="text" class="form-control" id="name" name="name" style="width:150px" title="name">
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row"><strong class="reqd">*</strong><label for="pw">생년월일</label></th>
                                            <td>
                                                <input type="text" class="form-control" id="birth" name="birth" style="width:150px" title="birth">
                                            </td>
                                        </tr>

                                    </tbody>
                                </table>
                                </form>
                            </div>
                            
                            <!-- 버튼에 폼 제출 함수 경로 지정 -->
                            <div class="btnwrap">                               
                                <input type="button" value="회원가입" class="btn gray mr0" id="joinBtn" onclick="joinBtn();">
                            </div>
                     
                        </div>
                        </fieldset>
                   </div>
                
            </div>
            <!-- 푸터 -->
   <%@ include file="../footer.jsp"%>
</body>         
</html>