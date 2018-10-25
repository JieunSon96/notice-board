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

<script>
	$(document).ready(function() {

		$('#deleteBt').click(function() {
			alert("게시글을 삭제하였습니다!");
		})
		
		$('#commentWriteBt').click(function(){
			$.ajax({
				type:"POST",
				url:"writeComment.bo",
				data:"boardNo="+$('#boardNo').val()+"&boardComTxt="+$('#commentTxt').val(),
				success:function(resp){
					var output="";
					
					output+="<tr><td width=\"100px\">";
					output+="<div>"+resp.boardComWriter+"<br><font size=\"2\" color=\"lightgray\">"+resp.boardComRegDate+"</font></div></td>";
					output+="<td><div class=\"text_wrapper\">"+resp.boardComTxt+"</div></td>";
					if("${user_id}"==resp.boardComWriter){
						output+="<td width=\"200px\">";	
						output+="<div style=\"text-align:center\">";
					   /*  output+="<a href=\"boardCommentRemove.jsp?comment_seq=${comment.boardComNo}&article_no=${resultseq}\">[수정]</a>"; */
					    output+="<a onclick=\"alert('댓글이 삭제되었습니다!')\" href=\"boardCommentRemove.bo?boardComNo="+resp.boardComNo+"&boardNo="+"${boardNo}"+"\">[삭제]</a>";
					    output+="</div></td>";
					}
					    output+="</tr>";
					$('#coTable tr:last').after(output);
				
				}
			})
			
			  $('#commentTxt').val("");
			
			
		})
		

	})
</script>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="goBoardList.bo">JieunSon</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarText" aria-controls="navbarText"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarText">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="#">게시판<span
						class="sr-only">(current)</span></a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#"
					id="navbarDropdownMenuLink" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false"> 멤버 </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
						<a class="dropdown-item" href="logOut.do">로그아웃</a>

					</div></li>
			</ul>

			<span class="navbar-text"> ${user_id}님 반갑습니다! </span>

		</div>
	</nav>



	<div class="container" style="margin-top: 8vh;">
		<div class="row">
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
						<td colspan="2">${read.title}</td>
					</tr>

					<tr>
						<td>작성자</td>
						<td colspan="2">${username}</td>
					</tr>

					<tr>
						<td>작성일자</td>
						<td colspan="2">${read.writeDate}</td>
					</tr>

					<tr>
						<td>내용</td>
						<td colspan="2"
							style="min_height: 200px; max-width: 3.5em; text-align: left; word-break: break-all">${read.contents}</td>
					</tr>



					<c:if test="${not empty fileName}">
						<tr>
							<td id=real>첨부파일</td>
							<%-- <c:forEach var="file" items="${fileName}"> --%>
							<td colspan="2"><a href="fileDownload.bo?fName=${fileSystemName}">
							${fileName}</a></td>

							<%-- </c:forEach> --%>
						</tr>
					</c:if>
					<tr>


						<td colspan=1><input type=button class="btn btn-default"
							style="margin-right: 0.4vw;" id=listBt value="목록"
							onclick="location.href='goBoardList.bo'"></td>
						<td colspan=2><c:if test="${user_id eq read.writer}">
								<input style="margin-right: 0.2vw;" type=button
									class="btn btn-primary pull-right" id="editBt" value="수정"
									onclick="location.href='update.bo?seq=${read.seq}'" />
								<input style="margin-right: 0.2vw;" type=button
									onclick="location.href='removeConfirm.bo?seq=${read.seq}'"
									class="btn btn-primary pull-right" id="deleteBt" value="삭제" />
							</c:if> <input style="margin-right: 0.2vw;" type=button
							class="btn btn-secondary pull-right" id=listBt value="답글"
							onclick="location.href='reply.bo?seq=${read.seq}'">
					</tr>
				</tbody>
			</table>


           <div class="container">
			<table class="table table-bordered" style="border:0px solid white;" id="coTable">
				<tr><th colspan=3>댓글</tr>
               
				
					<c:forEach var="comment" items="${commentList}">
					<tr>
						<td width="100px">
						<div>
						${comment.boardComWriter} <br>
						<font size="2" color="lightgray">${comment.boardComRegDate}</font>
						</div>
						</td>
						
						<td>
						<div class="text_wrapper">
						${comment.boardComTxt}
						</div>
						</td>
                       
                      
						<c:if test="${user_id eq comment.boardComWriter}">
						 <td width="200px">
                       <div style="text-align:center">
						
						<%-- 	<a href='boardCommentRemove.jsp?comment_seq=${comment.boardComNo}&article_no=${resultseq}'>[수정]</a> --%>
							<a href='boardCommentRemove.bo?boardComNo=${comment.boardComNo}&boardNo=${boardNo}' onclick="alert('댓글이 삭제되었습니다!')">[삭제]</a>
						
						 </div>
                       </td>
						</c:if>
							</tr> 
					</c:forEach>
			
                   </table>
                   <table>
                 <tr>
					<th>댓글 쓰기</th>
				</tr>
				<tr>
					<td><br>
					
					
					
						<%-- <form
							action="boardCommentAction.jsp?seq=${resultseq}&writer=${id}&ip=${ip}"
							method=post> --%>
                         <div class="here"></div>
							<input type=text class="form-control" name="commentTxt" id="commentTxt"
								style="height: 70px; width: 1030px;"
								placeholder="댓글을 입력해주세요">
								<input type="hidden" value="${boardNo}" id="boardNo">
							<td><input type=button id="commentWriteBt" class="btn btn-primary pull-right"
								style="height: 70px; width: 100px; position: relative;  top: 1.2vh; font-weight:700"
								value="등록">
						<!-- </form> -->
				</tr>
			</table>
			<br>
</div>



		</div>
	</div>
</body>
</html>