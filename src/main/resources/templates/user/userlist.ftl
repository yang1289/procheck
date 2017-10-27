<#include "../common/layer.ftl">
<@head page_title="用户列表"/>
<@css>

<link rel="stylesheet" href="/static/bootstrapTable/bootstrap-table.min.css">

</@css>
<@js>
<script src="/static/bootstrapTable/bootstrap-table.min.js"></script>
<script src="/static/bootstrapTable/extensions/filter/bootstrap-table-filter.min.js"></script>
<script src="/static/bootstrapTable/locale/bootstrap-table-zh-CN.min.js"></script>
</@js>
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
		            <a href="/user/list">用户列表</a>
		        </li>
		       
		    </ul>
		</div>


		<div class="row">
		    <div class="box col-md-12">
		        <#--<table class="table table-striped table-bordered responsive" data-toggle="table">-->
		        	<#--<thead>-->
		        		<#--<tr>-->
		        			<#--<td>id</td>-->
		        			<#--<td>用户名</td>-->
		        			<#--<td>身份</td>-->
		        			<#--<td>注册时间</td>-->
		        			<#--<td>邮箱</td>-->
		        			<#--<td>个人主页</td>-->
		        			<#--<td></td>-->
		        		<#--</tr>-->
		        	<#--</thead>-->
		        	<#--<tbody>-->
		        		<#--<#list users as user>-->
		        			<#--<tr>-->
		        				<#--<td><#if user.id??>${user.id}</#if></td>-->
		        				<#--<td><#if user.username??>${user.username}</#if></td>-->
		        				<#--<td><#if user.roles??>-->
		        					<#--<#list user.roles as role>-->
		        						<#--${role.description}-->
		        					<#--</#list>-->
		        				<#--</#if></td>-->
		        				<#--<td><#if user.registTime??>${user.registTime}</#if></td>-->
		        				<#--<td><#if user.email??>${user.email}</#if></td>-->
		        				<#--<td><#if user.url??>${user.url}</#if></td>-->
		        				<#--<td>-->
		        					<#--<a class="btn btn-primary" href="/user/role/edit?id=${user.id}">角色配置</a>-->

		        				<#--</td>-->
		        			<#--</tr>-->
		        		<#--</#list>-->
		        	<#--</tbody>-->
		        <#--</table>-->

				<table id="table" data-toggle="table">

				</table>
		    </div>
		</div>
   <!-- content ends -->
		<script>
			$("#table").bootstrapTable({
				url:"/user/data",
				columns:[{
                    field:'no',
					title:"序号"
				},{
                    field:'username',
                    title:"用户姓名"
                },{
                    field:'rolename',
                    title:"角色"
                },{
                    field:"registTime",
                    title:"注册时间"
                },{
                    field:"email",
                    title:"邮箱"
                },{
                    field:"homepage",
                    title:"个人主页"
                }],
				search:true
			})
		</script>
	</div><!--/#content.col-md-0-->
</div>
 </@body>
  