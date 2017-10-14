<#include "../common/layer.ftl">
<@head page_title="查看项目"/>
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
                    <a href="/project/list">项目列表</a>
                </li>
                <li>
                    <a href="/project/find?id=${project.id}">查看项目</a>
                </li>


            </ul>
        </div>


        <div class="row">
            <div class="box col-md-12">
                <div class="panel panel-default">
                    <div class="panel-heading">项目</div>
                    <div class="panel-body">
                        <div class="form-group">
                            <label for="name">项目名称</label>
                            <input type="text" class="form-control" name="projectname" id="projectname" value="${project.projectName!}" disabled/>
                        </div>
                        <div class="form-group">
                            <label form="role">项目详情</label>
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
                            <div class="row">
                                <div class="col-md-12"><label>申请人名单:</label></div>
                                <div class="col-md-12">
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
                            <div class="row">
                                <div class="col-md-12"><label>研究现状:</label></div>
                                <div class="col-md-12"><textarea class="form-control" readonly>${project.searchCondition!}</textarea></div>
                            </div>
                            <div class="row">
                                <div class="col-md-12"><label>研究方案:</label></div>
                                <div class="col-md-12"><textarea class="form-control" readonly>${project.searchPlan!}</textarea></div>
                            </div>
                            <div class="row">
                                <div class="col-md-12"><label>创新点:</label></div>
                                <div class="col-md-12"><textarea class="form-control" readonly>${project.createPoint!}</textarea></div>
                            </div>
                            <div class="row">
                                <div class="col-md-12"><label>研究工作的条件保障（研究室，研究基地等）:</label></div>
                                <div class="col-md-12"><textarea class="form-control" readonly>${project.searchConditionSupport!}</textarea></div>
                            </div>
                            <div class="row">
                                <div class="col-md-12"><label>拟提供成果及成果形式:</label></div>
                                <div class="col-md-12"><textarea class="form-control" readonly>${project.achievenmentMethod!}</textarea></div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12"><label>计划事件:</label></div>
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
                        <div class="row">
                            <div class="col-md-12"><label>经费说明:</label></div>
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
                    <div class="panel-footer"><a href="/project/edit?id=${project.id}"><button type="button" class="btn btn-primary">修改</button></a></div>
                </div>

                <div class="panel panel-default" >
                    <div class="panel-heading">审核意见</div>
                    <div class="panel-body">
                        <div class="form-group" >
                            <label name="advicecontent">指导老师意见</label>
                            <textarea class="form-control" rows="4" id="advicecontent" name="advicecontent" disabled>${project.adviserAdvice!}</textarea>
                        </div>
                        <div class="form-group" disabled>
                            <label form="role">审核是否通过:</label>
                            <#if project.adviserIsCheck>
                                <span class="label label-success">是</span>&nbsp;
                            <#else>
                                <span class="label label-warning">否</span>&nbsp;
                            </#if>
                        </div>
                        <div class="form-group">
                            <label name="advicecontent">院系审核意见</label>
                            <textarea class="form-control" rows="4" id="advicecontent" name="advicecontent" disabled>${project.academyAdvice!}</textarea>
                        </div>
                        <div class="form-group">
                            <label form="role">审核是否通过:</label>
                            <#if project.academyIsCheck>
                                <span class="label label-success">是</span>&nbsp;
                            <#else>
                                <span class="label label-warning">否</span>&nbsp;
                            </#if>
                        </div>
                        <div class="form-group">
                            <label name="advicecontent">校级审核意见</label>
                            <textarea class="form-control" rows="4" id="advicecontent" name="advicecontent" disabled>${project.collegeAdvice!}</textarea>
                        </div>
                        <div class="form-group">
                            <label form="role">审核是否通过:</label>
                            <#if project.collegeIsCheck>
                                <span class="label label-success">是</span>&nbsp;
                            <#else>
                                <span class="label label-warning">否</span>&nbsp;
                            </#if>
                        </div>
                        <script type="text/javascript">
                                var adviserischeck=${project.adviserIsCheck?c};
                                var academyischeck=${project.academyIsCheck?c};
                                var collegeischeck=${project.collegeIsCheck?c};

//                                $("#adviserCheckOk").attr("checked",adviserischeck)
//
//                                $("#adviserCheckNo").attr("checked",adviserischeck);
//
//
//                                $("#academyCheckOk").attr("checked",academyischeck);
//
//
//                                $("#academyCheckNo").attr("checked",academyischeck);
//
//
//                                $("#collegeCheckOk").attr("checked",collegeischeck);
//
//
//                                $("#collegeCheckNo").attr("checked",collegeischeck);
                        </script>
                    </div>
                </div>
            </div>
        </div>
        <!-- content ends -->
    </div><!--/#content.col-md-0-->
</div><!--/fluid-row-->
</@body>