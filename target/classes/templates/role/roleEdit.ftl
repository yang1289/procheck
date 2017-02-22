<#include "../common/layer.ftl">
<@html page_title="配置权限">
<div class="row">
	<#include "../common/left_menu.ftl"/>
 	<@left_menu/>
	<div id="content" class="col-lg-10 col-sm-10">
	<!-- content starts -->
		<div>
		    <ul class="breadcrumb">
		        <li>
		            <a href="/index">主页</a>
		        </li>
		        <li>
		            <a href="/role/list">角色列表</a>
		        </li>
		        <li>
		            <a href="/role/permission/edit?id=${role.id}">配置权限</a>
		        </li>
		       
		    </ul>
		</div>


		<div class="row">
		    <div class="box col-md-12">
		        <div class="panel panel-default">
		        	<div class="panel-heading">配置权限</div>
		        	<div class="panel-body">
		        		<form role="form" action="/role/permission/edit?id=${role.id!}" method="POST" id="form">
		        			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		        			<div class="form-group">
					            <label for="name">角色名称</label>
					            <input type="text" id="name" name="name" value="${role.name!}" class="form-control"/>
		          			</div>
		          			<div class="form-group">
					            <label for="description">角色描述</label>
					            <input type="text" id="description" name="description" value="${role.description!}" class="form-control"/>
		          			</div>
		          			<div class="form-group">
					            <label for="permission">权限配置</label>
					           	<#list list as l>
					           		<h4><b>${l.permission.description!}</b></h4>
					           		<#list l.childPermissions as childPermission>
					           			<input type="checkbox" name="permissionIds" value="${childPermission.id!}"
					           			id="permission_${childPermission.id!}">
					           			<label for="permission_${childPermission.id!}">${childPermission.description!}</label>&nbsp;
					           		</#list>
					           	</#list>
					           	<script type="text/javascript">
					           		$(document).ready(function(){
					           			<#list role.permissions as permission>
					           				$("#permission_${permission.id}").attr("checked",true);
					           			</#list>
					           		});
					           	</script>
		          			</div>
		          			<button type="button" id="roleBtn" onclick="roleSubmit()" class="btn btn-lg btn-default">保存</button>
		          			<span id="error_message"></span>
		          			<script type="text/javascript">
					           	function roleSubmit(){
					           		var em=$("#error_message");
					           		var name=$("#name").val();
					           		var description=$("#description").val();
					           		
					           		if(name.length==0){
					           			em.html("角色名称不能为空！");
					           			return false;
					           		}else if(description.length==0){
					           			em.html("角色描述不能为空！");
					           			return false;
					           		}else{
					           			var form=$("#form");
					           			form.submit();
					           		}
					           	}
					         </script>
		          			
		        		</form>
		        	</div>
		        </div>
		    </div>
		</div>
   	<!-- content ends -->
	</div><!--/#content.col-md-0-->
</div><!--/fluid-row-->
</@html>>