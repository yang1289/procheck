<#include "../common/layer.ftl">
<@html page_title="角色配置">
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
		            <a href="/user/list">用户列表</a>
		        </li>
		        <li>
		            <a href="/user/role/edit?id=${user.id}">角色配置</a>
		        </li>
		       
		    </ul>
		</div>


		<div class="row">
		    <div class="box col-md-12">
		        <div class="panel panel-default">
		        	<div class="panel-heading">角色配置</div>
		        	<div class="panel-body">
		        		<form role="form" action="/user/role/edit?id=${user.id}" method="POST" id="form">
		        			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		        			<div class="form-group">
		        				<label for="name">用户名</label>
		        				<input type="text" class="form-control" id="name" value="${user.username}" disabled/>
		        			</div>
		        			<div class="form-group">
		        				<label form="role">角色配置</label>
		        				<div>
		        					<#list roles as role>
		        						<input type="radio" name="roleId" class="roleIds" value="${role.id}" id="roleId_${role.id}"/>
		        						<label for="roleId_${role.id}" id="label_${role.id}">${role.description}</label>&nbsp;
		        					</#list>
		        				</div>
		        			</div>
		        			<button type="button" id="roleBtn" onclick="clickmodal()" class="btn btn-lg btn-default"  data-target="#save_modal">保存</button>
		        			<div id="error"></div>
		        			<div class="modal fade" id="save_modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
								<div class="modal-dialog modal-lg" role="document">
								    <div class="modal-content">
								    	<div class="modal-header">
		       								<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        							<h4 class="modal-title" id="myModalLabel">注意</h4>
		      							</div>
		      							<div class="modal-body">
		      								<div class="alert alert-info" id="alert" role="alert"></div>
		      								
		      							</div>
									    <div class="modal-footer">
									        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
									        <button type="submit" id="save"  class="btn btn-primary">保存</button>
									        
									    </div>
		    						</div>
		  						</div>
							</div>
		
	        				<script type="text/javascript">
				           		$(document).ready(function(){
				           			<#list user.roles as role1>
				           				$("#roleId_${role1.id}").attr("checked",true);
				           			</#list>
				           		});
				           		function clickmodal(){
				           			var username=$("#name").val();
				           			var roleId=$(".roleIds:checked").val();
				           			var rolename=$("#label_"+roleId).html();
				           			var em=0;
				           			var form=$("form");
				           			var error=$("#error");
				           			
				           			if(username.length==0){
				           				em++;
				           				error.html('<div class="alert alert-info" role="alert">用户名不能为空</div>');
				           			}
				           			if(roleId==null){
				           				em++;
				           				error.html('<div class="alert alert-info" role="alert">角色配置不能为空</div>');
				           			}
				           			if(em==0){
				           				$("#alert").html("是否保存用户："+username+" 角色："+rolename);
				           				$("#save_modal").modal('show');
				           			}else{
				           				$("#save_modal").modal('hide');
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
</@html>