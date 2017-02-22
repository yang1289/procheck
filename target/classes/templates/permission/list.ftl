<#include "../common/layer.ftl">
<@html page_title="权限列表">
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
		            <a href="/permission/list">权限列表</a>
		        </li>
		       
		    </ul>
		</div>


		<div class="row">
		    <div class="box col-md-12">
		        <table class="table table-striped table-bordered responsive">
		        	<thead>
		        		<tr>
		        			<td>id</td>
		        			<td>描述</td>
		        			<td>名字</td>
		        			<td>url</td>
		        			<td></td>
		        		</tr>
		        	</thead>
		        	<tbody>
		        		<#list allpermissions as permission>
		        			<tr>
		        				<td><#if permission.id??>${permission.id}</#if></td>
		        				<td><#if permission.description??>${permission.description}</#if></td>
		        				<td><#if permission.name??>${permission.name}</#if></td>
		        				<td><#if permission.url??>${permission.url}</#if></td>
		        				<td>
		        					<a class="btn btn-info" href="/permission/edit?id=${permission.id}">修改</a>
		        					<a class="btn btn-warning" href="/permission/delete?id=${permission.id}">删除</a>
		        				</td>
		        			</tr>
		        		</#list>
		        	</tbody>
		        </table>
		    </div>
		</div>
   	<!-- content ends -->
	</div><!--/#content.col-md-0-->
</div><!--/fluid-row-->
</@html>