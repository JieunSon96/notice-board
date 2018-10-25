<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- JQuery -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<!-- Bootstrap tooltips -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.4/umd/popper.min.js"></script>
<!-- Bootstrap core JavaScript -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/js/bootstrap.min.js"></script>
<!-- MDB core JavaScript -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.12/js/mdb.min.js"></script>


<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- Bootstrap core CSS -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.1.3/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Material Design Bootstrap -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.12/css/mdb.min.css" rel="stylesheet">
<title>Board</title>

<style type="text/css">
</style>

<script type="text/javascript">
//페이지 이동
function fn_movePage(val){
    $("input[name=pageNo]").val(val);
    $("form[name=frm]").attr("method", "post");
    $("form[name=frm]").attr("action","").submit();
}
//검색 버튼
function fn_search(){
    if( $("#selBox").val() == "" ){
        return;
    }else{
        $("input[name=searchCondition]").val(jQuery("#selBox").val());
    }
    var searchValue = $("#searchTxt").val();
    $("input[name=searchValue]").val(searchValue);

    $("input[name=pageNo]").val("1");
    $("form[name=frm]").attr("method", "post");
    $("form[name=frm]").attr("action","").submit();
}

$(document).ready(function(){
	$('#writeBt').click(function(){
		$(location).attr('href','write.bo');
	})
    
})
</script>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="goBoardList.bo">JieunSon</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarText">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="#">게시판<span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    멤버
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          <a class="dropdown-item" href="logOut.do">로그아웃</a>
        
        </div>
      </li>
    </ul>
    
    <span class="navbar-text">
      ${username}님 반갑습니다!
    </span>
    
  </div>
</nav>
	
	 <form class="form-inline" id="frm" name="frm" action="goBoardList.bo">
	        <input type="hidden" name="pageNo"> <!--페이징 번호  -->
        <!--     <input type="hidden" id="startPage" name="startPage" value="">페이징을 위한 hidden타입 추가
            <input type="hidden" id="visiblePages" name="visiblePages" value="">페이징을 위한 hidden타입 추가 -->
             <input type="hidden" id="searchCondition" name="searchCondition" value="${PageDTO.searchCondition}">
        <input type="hidden" id="searchValue" name="searchValue" value="${PageDTO.searchValue}">
	<table class="table table-striped" style="width:70%;height:60%;position:relative;left:15vw;top:14vh;">
  <thead>
  <tr>

    <tr>
      <th colspan="1" style="text-align:center;">번호</th>
      <th colspan="1" style="text-align:center;">제목</th>
      <th colspan="1" style="text-align:center;">글쓴이</th>
      <th colspan="1" style="text-align:center;">작성 일자</th>

    </tr>
  </thead>
  <tbody>
  <c:choose>
  <c:when test="${fn:length(boardList) == 0}">
  <tr>
                                <td colspan="4" align="center">
                                    조회결과가 없습니다.
                                </td>
                            </tr>
  
  </c:when>
  <c:otherwise>
  <c:forEach var="k" items="${boardList}">
    <tr>
      <th scope="row" style="text-align:center;">${k.seq}</th>
    
     
      
      <td style="text-align:left;">
      
      <c:if test="${k.groupLayer>0}">
      <c:forEach begin="1" end="${k.groupLayer}">
      &nbsp;&nbsp;
      </c:forEach>
      RE :
      </c:if>
      <c:choose>
       <c:when test="${k.available==0}">
       [삭제된 게시물입니다]
      </c:when>
       <c:otherwise>
       <a href="articleView.bo?seq=${k.seq}">${k.title}</a>
      </c:otherwise>
      </c:choose>
     </td>
      <td align=center>${k.writer}</td>
      <td align=center>${k.writeDate}</td>
    </tr>
   </c:forEach>
  
  </c:otherwise>
  </c:choose>
  
     <tr>
     
    <td colspan=5>
    <button type="button" id="writeBt" class="btn btn-blue-grey pull-right" style="" >글 작성</button>
    </td>
    </tr>
  </tbody>
<tr style="text-align:center;">

<td colspan=5><!-- <div id="pagination" ></div> -->
<div id="page">
<c:if test="${PageDTO.pageNo!=0}">
<c:if test="${PageDTO.pageNo > PageDTO.pageBlock}">
            <a href="javascript:fn_movePage(${PageDTO.firstPageNo})" style="text-decoration: none;">[첫 페이지]</a>
       </c:if>

<c:if test="${PageDTO.pageNo!=1}">
<a href="javascript:fn_movePage(${PageDTO.prevPageNo})" style="text-decoration: none;">[이전]</a>
</c:if>

<span>
            <c:forEach var="i" begin="${PageDTO.startPageNo}" end="${PageDTO.endPageNo}" step="1">
                <c:choose>
                    <c:when test="${i eq PageDTO.pageNo}">
                        <a href="javascript:fn_movePage(${i})" style="text-decoration: none;">

                            <font style="font-weight: bold;">${i}</font>

                        </a>
                    </c:when>
                    <c:otherwise>
                        <a href="javascript:fn_movePage(${i})" style="text-decoration: none;">${i}</a>
                    </c:otherwise>
                </c:choose>
            </c:forEach>
        </span>
       <c:if test="${PageDTO.pageNo != PageDTO.finalPageNo }">
            <a href="javascript:fn_movePage(${PageDTO.nextPageNo})" style="text-decoration: none;">[다음]</a>
        </c:if>
        <c:if test="${PageDTO.endPageNo < PageDTO.finalPageNo }">
            <a href="javascript:fn_movePage(${PageDTO.finalPageNo})" style="text-decoration: none;">[마지막 페이지]</a>
        </c:if>
 
</c:if>

</div>

</td></tr>
</table>
</form>


<!-- 검색 기능 구현 -->
 <div class="row" style="position:relative;top:20vh;left:33vw;width:40vw;margin-bottom:25vh;">
          <form method="get" id="searchForm" action="goBoardList.bo">
        <div class="input-group">
        <select name="selBox" id="selBox" class="form-control" style="text-align:center;width:24%;">
         <option value="choose" selected="selected" >선택</option>
        <option value="title">제목검색</option>
        <option value="contents">내용검색</option>
        <option value="writer">작성자검색</option>
        </select>
       
      <input type="text" class="form-control" name="search" id="searchTxt" style="width:55%;" id="search" placeholder="검색어를 입력해주세요" >
      <span class="input-group-btn">
        <button class="btn btn-default" style="position:relative;left:28vw;top:-6.5vh;" type="button" id="searchBt" onclick="fn_search();">검색</button>
      </span>
      
      </div>
   </form>
  </div>
 




</body>
</html>