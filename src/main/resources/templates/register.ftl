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
	        <label for="username" class="sr-only">学号</label>
	        <input type="text" id="username" name="username" class="form-control" placeholder="学号" required autofocus>
	        <br/>
	        <label for="password" class="sr-only">密码</label>
	        <input type="password" id="password" name="password" class="form-control" placeholder="密码" required>
	        <br/>
              <label for="confirmPassword" class="sr-only">确认密码</label>
              <input type="password" id="confirmPassword"  class="form-control" placeholder="确认密码" required>
              <br/>
			  <label for="name" class="sr-only">姓名</label>
			  <input type="text" id="name" name="chineseName" class="form-control" placeholder="姓名" required>
			  <br/>
              <label for="academy">学院</label>
              <select id="academy" name="academy" class="form-control">
				  <option value="0">无</option>
				  <#list academies as academy>
				      <option value="${academy.id}">${academy.name}</option>
				  </#list>
			  </select>
              <br/>
			  <label for="major">专业</label>
			  <select id="major" name="major" class="form-control">
				  <option value="0">无</option>
			  </select>
			  <br/>
              <label for="grade">班级</label>
              <select id="grade" name="grade" class="form-control">
                  <option value="0">无</option>
              </select>
              <br/>
			  <div id="errMessage"></div>
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
<script type="text/javascript">
	$("#academy").change(function(){
	    var id=$("#academy").val();
	    if(id!=0){
	        getAjax(id,$("#major"),"academy");
		}else{
	        $("#major").html('<option value="0">无</option>');
            $("#grade").html('<option value="0">无</option>')
		}
	});
	$("#major").change(function(){
	    var id=$("#major").val();
	    if(id!=0){
	        getAjax(id,$("#grade"),"major");
		}else{
            $("#grade").html('<option value="0">无</option>')
		}
	});
	var em=$("#errMessage");
    function getAjax(id,selecting,levelname){
        var data={
            id:id,
            levelname:levelname,
			${_csrf.parameterName}:"${_csrf.token}",
		};
        if(id!=0){
            $.ajax({
                url:"/academy/findChild",
                dataType:"JSON",
                data:data,
                method:"post",
                error:function(){
                    em.html('<div class="alert alert-info role="alert"> 系统问题</div>')
                },
                success:function(data){
                    selecting.html('<option value="0">无</option>');
                    for(i=0;i<data.length;i++){
                        selecting.append("<option value='"+data[i].id+"'>"+data[i].name+"</option>");
                    }
                }
            });
        }else{
            selecting.html('<option value="">无</option>');
        }
    }
</script>
    
</body>
</html>