<#include "../common/layer.ftl">
<@html page_title="账户列表">
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
		        <table class="table table-striped table-bordered responsive">
		        	<thead>
		        		<tr>
		        			<td>id</td>
		        			<td>用户名</td>
		        			<td>身份</td>
		        			<td>注册时间</td>
		        			<td>邮箱</td>
		        			<td>个人主页</td>
		        			<td></td>
		        		</tr>
		        	</thead>
		        	<tbody>
		        		<#list users as user>
		        			<tr>
		        				<td><#if user.id??>${user.id}</#if></td>
		        				<td><#if user.username??>${user.username}</#if></td>
		        				<td><#if user.roles??>
		        					<#list user.roles as role>
		        						${role.description}
		        					</#list>
		        				</#if></td>
		        				<td><#if user.registTime??>${user.registTime}</#if></td>
		        				<td><#if user.email??>${user.email}</#if></td>
		        				<td><#if user.url??>${user.url}</#if></td>
		        				<td>
		        					<a class="btn btn-primary" href="/user/role/edit?id=${user.id}">角色配置</a>
		        					<a class="btn btn-info" href="/user/edit?id=${user.id}">修改</a>
		        					<a class="btn btn-warning" href="/user/edit?id=${user.id}">删除</a>
		        				</td>
		        			</tr>
		        		</#list>
		        	</tbody>
		        </table>
		    </div>
		</div>
   <!-- content ends -->
	</div><!--/#content.col-md-0-->
</div>
 </@html>
  