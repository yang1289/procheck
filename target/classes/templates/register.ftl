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
	</style>
</head>
<body>
	<script src="static/js/jquery-3.1.1.min.js"></script>
	<script src="static/js/bootstrap.min.js"></script>
	 <div class="container" id="container">
	 <div class="row">
	
		<div class="col-md-4 col-md-offset-4" id="Ycenter">
			 <#if message??>
	        <div class="alert alert-danger">${message!}</div>
	        </#if>
	      <form role="form" id="form" class="form-signin" method="POST" action="/regist" >
	     	 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	        <h2 class="form-signin-heading">注册</h2> 
	        <label for="username" class="sr-only">账户</label>
	        <input type="text" id="username" name="username" class="form-control" placeholder="账户" required autofocus>
	        <br/>
	        <label for="password" class="sr-only">密码</label>
	        <input type="password" id="password" name="password" class="form-control" placeholder="密码" required>
	        <br/>
	         <label for="confirmPassword" class="sr-only">确认密码</label>
	        <input type="password" id="confirmPassword"  class="form-control" placeholder="确认密码" required>
	       	<br/>
	        <button class="btn btn-lg btn-primary btn-block" type="submit">注册</button>
	      </form>
		</div>
	 </div>
    </div> <!-- /container -->
    
<script type="text/javascript">
  $(function () {
    $("#form").submit(function () {
      var username = $("#username").val();
      var password = $("#password").val();
      var confirmPassword=$("#confirmPassword").val();
   	  
      if(username.length == 0) {
        alert("用户名不能为空");
        return false;
      }
      if(password.length == 0) {
        alert("密码不能为空");
        return false;
      }
      if(password!=confirmPassword){
      	alert("用户密码不一致");
      	return false;
      }
    })
  })
</script>
    
</body>
</html>