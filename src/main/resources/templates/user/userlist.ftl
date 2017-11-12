<#include "../common/layer.ftl">
<@head page_title="用户列表"/>
<@css>

<link rel="stylesheet" href="/static/bootstrapTable/bootstrap-table.min.css">
<!--fileinput-->
<link href="/static/fileinput/css/fileinput.min.css" media="all" rel="stylesheet" type="text/css" />


</@css>
<@js>
<script src="/static/bootstrapTable/bootstrap-table.min.js"></script>
<script src="/static/bootstrapTable/extensions/filter/bootstrap-table-filter.min.js"></script>
<script src="/static/bootstrapTable/locale/bootstrap-table-zh-CN.min.js"></script>
<!--fileinput-->
<script src="/static/fileinput/js/plugins/piexif.min.js" type="text/javascript"></script>
<script src="/static/fileinput/js/plugins/sortable.min.js" type="text/javascript"></script>
<script src="/static/fileinput/js/plugins/purify.min.js" type="text/javascript"></script>
<script src="/static/fileinput/js/fileinput.min.js" type="text/javascript"></script>
<script src="/static/fileinput/themes/fa/theme.min.js" type="text/javascript"></script>
<script src="/static/fileinput/js/locales/zh.js" type="text/javascript"></script>
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
			<div class="col-md-12">
                <div class="col-md-12">
                    <button class="btn btn-primary" data-toggle="modal" data-target="#myModal">导入教师信息</button>
                </div>
				<div class="col-md-12">
					<br/>
				</div>
				<div class="col-md-12">
					<table id="table" data-toggle="table"></table>
				</div>

			</div>

            <!-- Modal -->
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="myModalLabel">添加教师信息</h4>
                        </div>
                        <div class="modal-body">
                            <div class="file-loading">
                                <input id="file" type="file" class="form-control" />
                            </div>
                            <div id="file_error"></div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal" >关闭</button>
                            <button type="button" class="btn btn-primary" onclick="importData()">导入</button>
                        </div>
                    </div>
                </div>
            </div>

		    <#--<div class="box col-md-12">-->
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
		    <#--</div>-->

		</div>
   <!-- content ends -->
        <!--bootstrap table-->
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
                },{
				    field:"operate",
					title:"操作"
				}]
			})
		</script>

        <!--bootstrap table-->

        <script>
           var fin= $("#file").fileinput({
                language:"zh",
                showPreview:false,
                showUpload:false,
                elErrorContainer:"#file_error",
                allowedFileExtensions:["xls","xlsx"]
            })
            function importData(){
               var importFile=$("#file")[0].files[0];
               var formdata=new FormData();
               var csrf="${_csrf.parameterName}";
               var csrf_value="${_csrf.token}";
               formdata.append(csrf,csrf_value);
               formdata.append("userData",importFile);
               console.log(importFile);
               $.ajax({
                   url:"/dataManage/importData",
                   type:"post",
                   data:formdata,
                   processData:false,
                   contentType:false,
                   error:function(){
                       alert("系统错误");
                   },
                   success:function(){
                       alert("成功");
                   }
               })

            }
        </script>
	</div><!--/#content.col-md-0-->
</div>
 </@body>
  