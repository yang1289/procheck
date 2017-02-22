<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>登录</title>
	<link href="static/css/bootstrap.min.css" rel="stylesheet">
   <!--[if lt IE 9]>
		<script src="static/js/html5shiv.min.js"></script>
		<script src="static/js/respond.min.js"></script>
	<![endif]-->
	
	<style>
		#Ycenter{
			position: relative;
			top: 50%;
			-webkit-transform: translateY(100%);
			-moz-transform:  translateY(100%);
			-ms-transform:  translateY(100%);
			-o-transform:  translateY(100%);
			transform:  translateY(100%);	  
		}
		
	</style>
</head>
<body>
	 <div class="container" id="container">
	
	<div class="col-md-9"></div>
	<div class="col-md-3" id="Ycenter">
		<#if SPRING_SECURITY_LAST_EXCEPTION??>
          <div class="alert alert-danger">用户名或密码错误</div>
        </#if>
      <form class="form-signin" method="POST" action="/login" >
     	 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <h2 class="form-signin-heading">请登录</h2> 
        <label for="inputEmail" class="sr-only">账户</label>
        <input type="text" id="inputEmail" name="username" class="form-control" placeholder="账户" required autofocus>
        <br/>
        <label for="inputPassword" class="sr-only">密码</label>
        <input type="password" id="inputPassword" name="password" class="form-control" placeholder="密码" required>
        <div class="checkbox">
          <label>
            <input type="checkbox" value="remember-me"> 记住我
          </label>
        </div>
        <button class="btn btn-lg btn-primary" type="submit">登录</button>
        <button class="btn btn-lg btn-default" type="button"><a href="/regist">注册</a></button>
      </form>
	</div>
    </div> <!-- /container -->
    
    <script src="static/js/jquery-3.1.1.min.js"></script>
	<script src="static/js/bootstrap.min.js"></script>
</body>
</html>