<#include "../common/layer.ftl">
<@html page_title="查看项目">
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
                            <div>
                            ${project.projectInfo!}
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
</@html>