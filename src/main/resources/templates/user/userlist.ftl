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
                    <h4>过滤选项：</h4>
                    <div class="col-md-1">
                        <label><h5>角色</h5></label>
                    </div>

                    <div class="col-md-4">
                        <select class="form-control" id="filter">
                            <option value="">全部</option>
                           <#list roles as role>
                               <option value="${role.id}">${role.description}</option>
                           </#list>
                        </select>
                    </div>
                    <div class="col-md-4">
                       <button type="button" class="btn btn-primary" onclick="filter()">确定</button>
                    </div>
                </div>
                <#--<div class="col-md-12">-->
                    <#--<h4>搜索：</h4>-->
                    <#--<div class="col-md-4">-->
                        <#--<select class="form-control">-->
                            <#--<option>1</option>-->
                            <#--<option>2</option>-->
                            <#--<option>3</option>-->
                            <#--<option>4</option>-->
                            <#--<option>5</option>-->
                        <#--</select>-->
                    <#--</div>-->
                    <#--<div class="col-md-4">-->
                        <#--<input type="text" class="form-control" value=""/>-->
                    <#--</div>-->
                    <#--<div class="col-md-4">-->
                        <#--<button type="button" class="btn btn-primary">搜索</button>-->
                    <#--</div>-->
                <#--</div>-->
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
                            <#--<form method="post" action="/dataManage/importData">-->
                                <div class="file-loading">
                                    <input id="file" type="file" class="form-control" />
                                </div>
                            <#--</form>-->
                            <div id="file_error"></div>
                            <div id="error_message"></div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal" >关闭</button>
                            <button type="button" class="btn btn-primary" onclick="importData()">准备导入</button>
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
				    checkbox:true
                },{
                    field:'no',
					title:"序号"
				},{
                    field:'username',
                    title:"用户账号"
                },{
				    field:'chineseName',
                    title:'姓名'
                },{
				    field:"academy",
                    title:"隶属学院"
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
				    field:"operateId",
					title:"操作",
                    align:"center",
                    formatter:operateformatter
				}]
			})

            function operateformatter(value,row,index){
			    return ["<a class='btn btn-primary' href='/user/role/edit?id="+value+"'>修改角色</a>"].join('');
            }

            function filter(){
                var roleid=$("#filter").val();
                $.ajax({
                    url:"/user/data",
                    data:{
                        roleid:roleid
                    },
                    dataType:"json",
                    type:"get",
                    error:function(){
                        alert("出现错误");
                    },
                    success:function(data){
                        console.log(data);
                        $("#table").bootstrapTable("load",data);
                        //alert("成功");
                    }

                })
            }
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
                $("#error_message").html("");
               var importFile=$("#file")[0].files[0];
               if(importFile==null){
                   $("#error_message").html("<div class='alert alert-info'>文件为空</div>");
                   return;
               }
               var formdata=new FormData();
               var csrf="${_csrf.parameterName}";
               var csrf_value="${_csrf.token}";
               formdata.append(csrf,csrf_value);
               formdata.append("userData",importFile);
               console.log(importFile);
               $.ajax({
                   url:"/dataManage/importData",
                   type:"post",
                   dataType:"json",
                   data:formdata,
                   processData:false,
                   contentType:false,
                   error:function(){
                       alert("系统错误");
                   },
                   success:function(data){

                       if(data.status=="error"){

                           $("#error_message").html("<div class='alert alert-info'>"+data.message+"</div>");
                       }
                       if(data.status=="success"){
                           window.location.href=data.message;
                       }
                   }
               })

            }
        </script>
	</div><!--/#content.col-md-0-->
</div>
 </@body>
  