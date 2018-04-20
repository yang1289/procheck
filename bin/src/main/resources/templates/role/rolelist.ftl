<#include "../common/layer.ftl">
<@head page_title="角色列表"/>
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
		            <a href="/role/list">角色列表</a>
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
		        			<td>名称</td>
		        			<td></td>
		        		</tr>
		        	</thead>
		        	<tbody>
		        		<#list roles as role>
		        			<tr>
		        				<td><#if role.id??>${role.id}</#if></td>
		        				<td><#if role.description??>${role.description}</#if></td>
		        				<td><#if role.name??>${role.name}</#if></td>
		        				<td>
		        					<a class="btn btn-info" href="/role/permission/edit?id=${role.id}">权限配置</a>
		        					<a class="btn btn-warning" href="/role/delete?id=${role.id}">删除</a>
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
</@body>
