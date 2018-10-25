<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<title>답변글 작성</title>
<script>
$(document).ready(function() {
	 count=0;
    $("#plusBt").click(function() {
    	count++;
        $("#here").append("<div id=filegroup><input class=form-control type=file name=file"+count+" id=BSbtninfo class=upload-hidden></div>");
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
      ${user_id}님 반갑습니다!
    </span>
    
  </div>
</nav>

<div class="container" style="margin-top:3vh;margin-bottom:10vh;">
	
			<form method="POST" action="replyConfirm.bo">
			<input type="hidden" id="parentSeq" name="parentSeq" value="${seq}">
				<table class="table table-striped table-hover"
					style="text-align: center;border:1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="2"
								style="background-color: #eeeeee; text-align: center">답글 쓰기</th>
						</tr>
					</thead>
					<tbody id="tbody">
						<tr>
							<td><input type="text" class="form-control" placeholder="글 제목" id="title"
								name="title" maxlength="500"></td>
						</tr>


						<tr>
							<td><textarea rows=10 class="form-control" 
									maxlength="1000" style="height:500px" placeholder="글 내용"
									name="contents" id="content">
                                </textarea></td>
						</tr>

						 <tr>
							<td id=here>
							
					
						</tr> 
						
						
					</tbody>
				</table>
				
				<input type="button"  class="btn btn-default" id="plusBt" value="파일추가하기">
				<input type="submit" class="btn btn-primary pull-right" id=writeBt
					value="저장">
			</form>
		
	</div>
</body>
</html>