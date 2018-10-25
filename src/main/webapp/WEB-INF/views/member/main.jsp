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
	<style>
	body{
	height:auto;
	}
	</style>
<title>Main</title>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="#">LemonTree</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarText" aria-controls="navbarText"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarText">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link" href="#">인재<span
						class="sr-only">(current)</span></a></li>
				<li class="nav-item"><a class="nav-link" href="#">고객</a></li>
				<li class="nav-item"><a class="nav-link" href="#">프로젝트</a></li>
			
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


<div class="jumbotron" style="height:50vh;margin-bottom:0;text-align:center">
  <h1 class="display-4">EchoIT</h1>
  <p class="lead">게시판 등록, 수정, 삭제 </p>
  <hr class="my-4">
  <p>검색, 댓글 구현 예정입니다.</p> 
  <p class="lead">
    <a class="btn btn-primary btn-lg" href="goBoardList.bo" role="button">게시판</a>
  </p>
</div>

<!-- Footer -->
<footer class="page-footer font-small special-color-dark pt-4" style="background-color:#5d5e60;height:42.5vh">

    <!-- Footer Elements -->
    <div class="container">

      <!-- Social buttons -->
      <ul class="list-unstyled list-inline text-center">
        <li class="list-inline-item">
          <a class="btn-floating btn-fb mx-1">
            <i class="fa fa-facebook"> </i>
          </a>
        </li>
        <li class="list-inline-item">
          <a class="btn-floating btn-tw mx-1">
            <i class="fa fa-twitter"> </i>
          </a>
        </li>
        <li class="list-inline-item">
          <a class="btn-floating btn-gplus mx-1">
            <i class="fa fa-google-plus"> </i>
          </a>
        </li>
        <li class="list-inline-item">
          <a class="btn-floating btn-li mx-1">
            <i class="fa fa-linkedin"> </i>
          </a>
        </li>
        <li class="list-inline-item">
          <a class="btn-floating btn-dribbble mx-1">
            <i class="fa fa-dribbble"> </i>
          </a>
        </li>
      </ul>
      <!-- Social buttons -->

    </div>
    <!-- Footer Elements -->

    <!-- Copyright -->
    <div class="footer-copyright text-center py-3">© 2018 Copyright:
      <a href="http://www.echoit.co.kr/"> EchoIT</a>
    </div>
    <!-- Copyright -->

  </footer>
  <!-- Footer -->
</body>
</html>