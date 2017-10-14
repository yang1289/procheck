<#include "../common/layer.ftl">
<@head page_title="添加权限"/>
<@css></@css>
<@js></@js>
<@body>
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
		            <a href="/permission/add">添加权限</a>
		        </li>
		       
		    </ul>
		</div>


		<div class="row">
		    <div class="box col-md-12">
		        <div class="panel panel-default">
		        	<div class="panel-heading">配置权限</div>
		        	<div class="panel-body">
		        		<form role="form" action="/permission/add" method="POST" id="form">
		        			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
		        			<div class="form-group">
					            <label for="name">权限描述</label>
					            <input type="text" id="description" name="description" value="" class="form-control"/>
		          			</div>
		          			<div class="form-group">
					            <label for="description">权限名称</label>
					            <input type="text" id="name" name="name" value="" class="form-control"/>
		          			</div>
		          			<div class="form-group">
					            <label for="_isParent">是否是父级</label>
					            <br/>
					            <input type="radio" value="true" name="isParent" id="isParent1" onclick="radioCheck(true)" class="isParent" checked/>
					            <label for="isParent1">是</label>&nbsp;
					            <input type="radio" value="false" name="isParent" id="isParent2" onclick="radioCheck(false)" class="isParent"/>
					            <label for="isParent2">否</label>
		          			</div>
		          			<div class="form-group">
					            <label for="parentPermission">父级权限名称</label>
					            <br/>
					            <div>
						            <select id="select" name="prePermission" class="form-control" disabled>
						            	<#list prePermissions as prePermission>
						            		<option value="${prePermission.id!}">${prePermission.description!}|${prePermission.name}</option>
						            	</#list>
						            </select>
					            </div>
		          			</div>
		          			
		          			<div class="form-group">
					            <label for="url">权限链接</label>
					            <input type="text" name="url" id="url" value="" class="form-control" disabled/>
		          			</div>
		          			
		          			<button type="button" id="roleBtn" onclick="roleSubmit()" class="btn btn-lg btn-default">保存</button>
		          			<span id="error_message"></span>
		          			<script type="text/javascript">
		          				function radioCheck(bool){
		          					var isParent1=$("#isParent1").val();
		          					var isParent2=$("#isParent2").val();
		          					
		          					
		          					if(bool!=true){
		          						$("#select").attr("disabled",false);
		          						$("#url").attr("disabled",false);
		          					}else{
		          						$("#select").attr("disabled",true);
		          						$("#url").attr("disabled",true);
		          					}
		          				}
		          			
					           	function roleSubmit(){
					           		var submit=0;
					           		var em=$("#error_message");
					           		var name=$("#name").val();
					           		var description=$("#description").val();
					           		var isParent=$("#isParent2");
					           		var select=$("#select").val();
					           		var url=$("#url").val();
					           		var bool=isParent.prop("checked");
					           		
					           		if(bool){
					           			if(select.length==0){
					           				submit++;
					           				em.html("父级不能为空！");
					           				return false;
					           			}
					           			
					           			if(url.length==0){
					           				submit++;
					           				em.html("权限地址不能为空！");
					           				return false;
					           			}
					           		}
					           		if(description.length==0){
					           			submit++;
					           			em.html("权限描述不能为空！");
					           			return false;
					           		}
					           		if(name.length==0){
					           			submit++;
					           			em.html("权限名称不能为空！");
					           			return false;
					           		}
					           		if(submit==0){
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
</@head>