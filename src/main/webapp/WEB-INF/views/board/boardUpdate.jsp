<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/mdbootstrap/4.5.12/css/mdb.min.css"
	rel="stylesheet">

<title>글 보기</title>


</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="goBoardList.bo">LemonTree</a>
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
      ${user_id}님 반갑습니다!
    </span>
    
  </div>
</nav>



<div class="container" style="margin-top:8vh;">
		<form method="POST" id="updateForm" action="updateConfirm.bo">
			<table class="table table-striped" style="border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="3"
							style="background-color: #eeeeee; text-align: center">게시판 글
							보기</th>
					</tr>

				</thead>

				<tbody>
					<tr>
						<td style="width: 20%">글 제목</td>
						<td colspan="2">
						<input type="text" class="form-control" placeholder="글 제목" id="title"
								name="title" maxlength="500" value="${info.title}"></td>
					</tr>

					<tr>
						<td>작성자</td>
						<td colspan="2">${info.writer}</td>
					</tr>

					<tr>
						<td>작성일자</td>
						<td colspan="2">${info.writeDate}</td>
					</tr>

					<tr>
						<td>내용</td>
						<td colspan="2" style="min_height: 200px; text-align: left;"><textarea rows=10 class="form-control" 
									maxlength="1000" style="height:500px" placeholder="글 내용"
									name="contents" id="content">
                                ${info.contents}</textarea></td>
					</tr>
					
					<tr>
					<td colspan=3>
					<input type=button class="btn btn-default" style="margin-right:0.4vw;" id=listBt
				value="목록" onclick="location.href='goBoardList.bo'">
			
              
            <input type="hidden" name="seq" value="${seq}">
			<input type=submit class="btn btn-primary pull-right" id="editBt" value="확인"/> 
		   
			</td>
					</tr>
					
<%-- 첨부파일 시간나면 하기!
					<tr>
						<td id=real>첨부파일</td><c:forEach var="fileprintResult" items="${fileprintResult}">
					 <td colspan="2" style="min_height: 200px; text-align: left;"><a
							href="fileDownload?fileName=${fileprintResult.getOriginal_file_name()}">${fileprintResult.getOriginal_file_name()}</a></td></c:forEach>
					</tr>
			 --%>
					
				</tbody>
			
			</table>
           </form>

			<br> 


		
	</div>
</body>
</html>