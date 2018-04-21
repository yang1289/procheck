<#include "../common/layer.ftl">
<@head page_title="项目审核"/>
<@css></@css>
<@js></@js>
<@body>
<div class="row">
    <#include "../common/left_menu.ftl"/>
    <@left_menu/>
    <div id="content" class="col-lg-10 col-sm-10">
        <div>
            <ul class="breadcrumb">
                <li>
                    <a href="/index">主页</a>
                </li>
                <li>
                    <a href="/project/check?id=${project.id}">审核项目</a>
                </li>


            </ul>
        </div>


        <div class="row">
            <div class="box col-md-12">
                <#if message??>
                    <div class="alert alert-info" role="alert">${message!}</div>
                </#if>
                <div class="panel panel-default">
                    <div class="panel-heading">项目名称</div>
                    <div class="panel-body">
                        <div class="form-group">
                            <input type="text" class="form-control" name="projectname" id="projectname" value="${project.projectName!}" disabled/>
                        </div>
                   	</div>
               	</div>
                 <div class="panel panel-default">
                       <div class="panel-heading">项目详情</div>
                       		<div class="panel-body">
		                        <div class="row">
		                            <div class="col-md-6">
		                                <p>指导老师:<#if project.adviser??>${project.adviser.chineseName!}|${project.adviser.academy.name!}</#if></p>
		                            </div>
		                            <div class="col-md-6">
		                                <p>职称:${project.jobTitle!}</p>
		                            </div>
		                        </div>
		                        <div class="row">
		                            <div class="col-md-6">
		                                <p>实验室名称:${project.libName!}</p>
		                            </div>
		                            <div class="col-md-6">
		                                <p>所属教学单位:${project.teachUnit!}</p>
		                            </div>
		                        </div>
                            </div>
                </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">申请人名单:</div>
                                <div class="panel-body">
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <td>申请人姓名</td><td>申请人专业</td><td>申请人学号</td><td>申请人班级</td>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <#list project.applyUsers as applyuser>
                                            <tr>
                                                <td>${applyuser.applyName!}</td><td>${applyuser.applyMajor!}</td><td>${applyuser.applyNumber!}</td><td>${applyuser.applyGrade!}</td>
                                            </tr>
                                            </#list>
                                        </tbody>
                                    </table>
                                </div>
                          </div>
                          <div class="panel panel-default">
                          	<div class="panel-heading">研究现状:</div>
                          	<div class="panel-body">
	                            <div class="row">
	                                <div class="col-md-12">${project.searchCondition!}</div>
	                            </div>
                            </div>
                           </div>
                           <div class="panel panel-default">
	                          	<div class="panel-heading">研究方案:</div>
	                          	<div class="panel-body">
		                            <div class="row">
		                               <div class="col-md-12">${project.searchPlan!}</div>
		                            </div>
	                            </div>
                           </div>
                           <div class="panel panel-default">
	                          	<div class="panel-heading">创新点:</div>
	                          	<div class="panel-body">
		                            <div class="row">
		                                <div class="col-md-12">${project.createPoint!}</div>
		                            </div>
	                            </div>
                           </div>
                           
                            <div class="panel panel-default">
	                          	<div class="panel-heading">研究工作的条件保障（研究室，研究基地等）:</div>
	                          	<div class="panel-body">
		                            <div class="row">
		                                <div class="col-md-12">${project.searchConditionSupport!}</div>
		                            </div>
	                            </div>
                           </div>
                           
                            <div class="panel panel-default">
	                          	<div class="panel-heading">拟提供成果及成果形式:</div>
	                          	<div class="panel-body">
		                            <div class="row">
		                                <div class="col-md-12">${project.achievenmentMethod!}</div>
		                            </div>
	                            </div>
                           </div>
                        <div class="panel panel-default">
                        	<div class="panel-heading">计划事件：</div>
                        	<div class="panel-body">
                        		<div class="col-md-12">
                                <table class="table">
                                    <thead>
                                    <tr>
                                        <td>计划时间</td><td>计划事件</td><td>计划备注</td>
                                    </tr>
                                    </thead>
                                    <tbody>
                                        <#list project.progressPlans as progressPlan>
                                        <tr>
                                            <td>${progressPlan.time!}</td><td>${progressPlan.event!}</td><td>${progressPlan.remark!}</td>
                                        </tr>
                                        </#list>
                                    </tbody>
                                </table>
                            	</div>
                        	</div>
                        </div>
                        <div class="panel panel-default">
                        	<div class="panel-heading">经费说明：</div>
                        	<div class="panel-body">
                        		<div class="col-md-12">
	                                <table class="table">
	                                    <thead>
	                                    <tr>
	                                        <td>经费说明</td><td>经费</td><td>备注</td>
	                                    </tr>
	                                    </thead>
	                                    <tbody>
	                                        <#list project.expenditures as expnediture>
	                                        <tr>
	                                            <td>${expnediture.description!}</td><td>${expnediture.money!}</td><td>${expnediture.remark!}</td>
	                                        </tr>
	                                        </#list>
	                                    </tbody>
	                                </table>
                          		</div>
                        	</div>
                        </div>

                <div class="panel panel-default">
                    <div class="panel-heading">审核项目</div>
                    <div class="panel-body">
                        <form id="form" action="/project/checked?id=${project.id}" method="post">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            <div class="form-group">
                                <label name="advicecontent">审核意见</label>
                                <textarea class="form-control" rows="4" id="advicecontent" name="advicecontent">${advicecontent!}</textarea>
                            </div>
                            <div class="form-group">
                                <label form="role">审核是否通过</label>
                                <input  type="radio" name="checked" id="checkok" value="true"/><label for="checkOk" >是</label>&nbsp;
                                <input  type="radio" name="checked" id="checkno" value="false"/><label for="checkNo" >否</label>&nbsp;
                            </div>
                            <button type="button" id="roleBtn" onclick="clickmodal()" class="btn btn-lg btn-default" data-target="#save_modal">保存</button>
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
                                            <button type="button" class="btn btn-default" data-dismiss="modal" >否</button>
                                            <button type="submit" id="save"  class="btn btn-primary">是</button>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <script type="text/javascript">
                                <#if checked??>
                                    var checked=${checked?c};
                                    if(checked){
                                        $("#checkok").attr("checked",true);
                                    }else{
                                        $("#checkno").attr("checked",true);
                                    }
                                </#if>
                                function clickmodal(){
                                    var advicecontent=$("#advicecontent").val();
                                    var checkok=$("#checkok").is(':checked');
                                    var checkno=$("#checkno").is(":checked");
                                    //var checked=
                                    var erro=$("#error");
                                    var em=0;

                                    if(!checkok&&!checkno){
                                        em++;
                                        erro.html('<div class="alert alert-info" role="alert">请选择是否通过</div>');
                                    }
                                    if(em==0){
                                        $("#alert").html('<div class="alert alert-info" role="alert">是否要提交审核</div>');
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
</@body>