<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Droid+Sans:400,700">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<link rel="stylesheet"
  href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/3.5.2/animate.min.css"> 
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>

<title>Login</title>


<style type="text/css">

*
{
    box-sizing:         border-box;
    -moz-box-sizing:    border-box;
    -webkit-box-sizing: border-box;
}

body
{
  margin: 0;
  padding: 0;
  background:#ededed;
  font-family: arial, sans-serif;
}

a
{
  text-decoration: none
}

header{
  width: 100%;
  height: 80px;
  background: #474747;
  text-align: center
}

h1
{
  color: #ddd;
  padding: 20px 20px;
  font: 10px 40px;
  margin: 0;
  display: inline-block
}

header a
{
  color: #03b3b5;
  font-size: 22px;
  margin: 28px 10px;
  display: inline-block
}

header a:hover
{
  text-decoration: underline
}

.user-card
{
	width: 350px;
	height: 350px;
	margin: 50px auto;
  position: relative;
	background: #fff;
	overflow: hidden;
	box-shadow:         0 1px 3px 0 rgba(0,0,0,0.08);
	-moz-box-shadow:    0 1px 3px 0 rgba(0,0,0,0.08);
	-webkit-box-shadow: 0 1px 3px 0 rgba(0,0,0,0.08);
  border-radius:         5px;
  -moz-border-radius:    5px;
  -webkit-border-radius: 5px;
}

input
{
	width: 100%;
	height: 40px;
	border-radius:         3px;
	-moz-border-radius:    3px;
	-webkit-border-radius: 3px;
	border: 1px solid #dee3e4;
	padding: 3px 12px;
	margin: 6px 0;
}

input:focus
{
	outline: none;
	border: 1px solid #03b3b5;
	transition:         all .5s ease-in-out;
	-o-transition:      all .5s ease-in-out;
	-moz-transition:    all .5s ease-in-out;
	-webkit-transition: all .5s ease-in-out;
}

.login-box,
.signup-box
{
	position: absolute;
	top: 0;
	right: 0;
	width: 100%;
	height: calc(100% - 25px);
	background: #fff;
  border-radius:         5px;
  -moz-border-radius:    5px;
  -webkit-border-radius: 5px;
}

.login-box{
	padding: 20px 40px;
	right: 0px;
}

.signup-box{
	padding: 40px;
	right: -350px;
}

.login, .signup
{
	text-align: center;
	color: #fff;
	background: #03b3b5;
	line-height: 30px;
	opacity: 0.95;
  cursor: pointer
}

.login:hover{opacity: 1}

.or
{
	display: block;
	width: 100%;
	height: 1px;
	border-bottom: 1px solid #dee3e4;
	position: relative;
	margin: 20px 0;
}

.or:before
{
	content: 'or';
	width: 40px;
	height: 18px;
	position: absolute;
	top: -5px;
	right: calc(50% - 20px);
	background-color: #fff;
	text-align: center;
	line-height: 10px;
	color: #555
}

.login-with-fb,
.login-with-google
{
	width: 100%;
	height: 40px;
	display: block;
	margin: 15px 0;
	color: #fff;
	text-align: center;
	line-height: 40px;
	font-size: 14px;
	opacity: .95;
  border-radius:         3px;
  -moz-border-radius:    3px;
  -webkit-border-radius: 3px;
}

.login-with-fb:hover,
.login-with-google:hover
{
	opacity: 1;
}

.login-with-fb
{
	background: #527EBF
}

.login-with-google
{
	background: #DB4A37;
}

.login-with-fb .icon,
.login-with-google .icon
{
	float: left;
	font-size: 21px;
	width: 50px;
	height: 26px;
	margin: 7px;
	padding: 2px;
	text-align: center;
	border-right: 1px solid #fff;
}


/**** footer *****/

.user-card .footer
{
	position: absolute;
	bottom: 0;
	right: 0;
	width: 100%;
	height: 25px;
	text-align: center;
	color: #666;
	font-size: 13px;
	font-family: sans-serif;
}

.footer a
{
	color: #03b3b5;
}

@keyframes heart{
  0%{
    transform:         scale(1, 1);
    -ms-transform:     scale(1, 1);
    -webkit-transform: scale(1, 1);
  }
  50%{
    transform:         scale(1.5, 1.5);
    -ms-transform:     scale(1.5, 1.5);
    -webkit-transform: scale(1.5, 1.5);
  }
  100%{
    transform:         scale(1, 1);
    -ms-transform:     scale(1, 1);
    -webkit-transform: scale(1, 1);
  }
}
</style>
<script>


$(document).ready(function(){

	/* Login & Signup Toggle */

	var cardToggle = 0;

	
//Login , Sign up cardToggle
$('.toggle-link').on('click', function(event){
    event.preventDefault();
		if(cardToggle == 0 ){
			$(this).text('Login');
			$('.login-box').animate({
				right: '350px'
			});
			$('.signup-box').animate({
				right: '0'
			});	

			cardToggle = 1;

		}else{
			$(this).text('Signup');
			$('.login-box').animate({
				right: '0'
			});
			$('.signup-box').animate({
				right: '-350px'
			});

			cardToggle = 0;
		}
	})
	
	
	//Sign up Process
	
	$('#signupBt').click(function(){
		
	
		if(!$('#signUpemail').val()){
			alert("이메일을 입력해주세요");
	        	
	        	return false;
				
		}
		if(!$('#username').val()){
		   alert("이름을 입력해주세요")
        	
        	return false;
			
		}
		if(!$('#password').val()){
			alert("비밀번호를 입력해주세요");
        	
        	return false;
			
		}
		
		
		$.ajax({
			type:"POST",
			url:"signUp.do",
			data:"user_id="+$('#signUpemail').val()+"&user_name="+$('#username').val()+"&password="+$('#password').val(),
			success:function(resp){
				
				if(resp=="success"){
					$('#username').val("");
					$('#email').val("");
					$('#password').val("");
                  alert("회원가입에 성공하셨습니다!")
                  window.location.href=window.location.href
				
				}
			}
			
		});
		
	})
	
})
</script>
</head>
<body>
<header>
  <h1>Practice</h1>
  <a href="#">JieunSon</a>
</header>

<c:if test="${incorrect eq 'incorrect'}">
	<script>
	alert("로그인 정보가 없거나 비밀번호가 틀렸습니다."+ 
			"확인 후 입력 부탁드립니다.")
	</script>
</c:if>
<div class="user-card round5">
	<div class="login-box">
	<input type="hidden" id="inCoInput" value="${incorrect}">
	
		<form class="login-form" name="login" method="post" action="loginCheck.do">
			<input type="username" name="user_id" class="username" placeholder="username (ex> member@gmail.com)" />
			<input type="password" name="password" class="password" placeholder="password" />
			<input type="submit" name="login" value="Login" class="login" />
		</form>

		<div class="or"></div>

		<a href="#" class="login-with-fb">
			<span class="icon fa fa-facebook"></span>
			 <i class="fa fa-facebook"></i>Login with facebook
		</a>
		<a href="#" class="login-with-google">
			<span class="icon fa fa-google-plus"></span>
			Login with google
		</a>
	</div>
	
	
	<div class="signup-box">
			<input type="username" id="username" name="username" class="username" placeholder="username" />
			<input type="email" id="signUpemail" name="email" class="email" placeholder="email" />
			<input type="password" id="password" name="password" class="password" placeholder="password" />
			<input type="submit" id="signupBt" name="signup" value="Signup" class="signup" />
	</div>

	<!-- Card Footer -->

	<div class="footer">
		<span>or </span><a class="toggle-link" href="#">Sign Up</a>
	</div>
</div>

</body>
</html>