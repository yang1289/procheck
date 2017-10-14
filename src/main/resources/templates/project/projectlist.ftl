<#include "../common/layer.ftl">
<@head page_title="项目列表"/>
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


            </ul>
        </div>


        <div class="row">
            <div class="box col-md-12">
                <div class="panel panel-default">
                    <div class="panel-heading">项目申请</div>
                    <div class="panel-body">
                        <#if message??>
                            <div class="alert alert-info" role="alert">${message!}</div>
                        </#if>
                        <table class="table table-striped table-bordered responsive">
                            <thead>
                                <tr>
                                    <td>id</td>
                                    <td>项目名称</td>
                                    <td>项目申请人</td>
                                    <td>项目申请时间</td>

                                    <td></td>
                                </tr>
                            </thead>
                            <tbody>
                                <#if projects??>
                                    <#list projects as project>
                                    <tr>
                                        <td>${project.id!}</td>
                                        <td>${project.projectName!}
                                            <#if rolename=="student">
                                                <#if project.needCheck&&!project.adviserIsCheck>
                                                    &nbsp<span class="label label-info">申请中</span>
                                                <#elseif project.needCheck&&!project.collegeIsCheck>
                                                    &nbsp<span class="label label-info">申请中</span>
                                                <#elseif project.needCheck&&!project.academyIsCheck>
                                                    &nbsp<span class="label label-info">申请中</span>
                                                <#elseif project.needCheck&&project.adviserIsCheck&&project.collegeIsCheck&&project.academyIsCheck>
                                                    &nbsp<span class="label label-info">已审核</span>
                                                </#if>
                                            </#if>
                                            <#if rolename=="adviser">
                                                <#if project.needCheck&&!project.adviserIsCheck>
                                                    &nbsp<span class="label label-info">审核中</span>
                                                <#else>
                                                    &nbsp<span class="label label-info">已审核</span>
                                                </#if>
                                            </#if>
                                            <#if rolename=="cpgroup"||rolename=="ctsecretary">
                                                <#if project.needCheck&&!project.collegeIsCheck>
                                                    &nbsp<span class="label label-info">审核中</span>
                                                <#else>
                                                    &nbsp<span class="label label-info">已审核</span>
                                                </#if>
                                            </#if>
                                            <#if rolename=="fpgroup">
                                                <#if project.needCheck&&!project.academyIsCheck>
                                                    &nbsp<span class="label label-info">审核中</span>
                                                <#else>
                                                    &nbsp<span class="label label-info">已审核</span>
                                                </#if>
                                            </#if>
                                        </td>
                                        <td>${project.user.username!}</td>
                                        <td>${project.createTime!}</td>

                                        <td>
                                            <#if rolename=="student">
                                                <a class="btn btn-primary" href="/project/find?id=${project.id}">查看项目</a>
                                                <a class="btn btn-primary" href="/project/needCheck?id=${project.id}">申请审核</a>
                                            </#if>
                                            <#if rolename=="dsoAdmin"||rolename=="adviser"||rolename=="cpgroup"||rolename=="fpgroup"||rolename=="ctsecretary">
                                                <a class="btn btn-primary" href="/project/check?id=${project.id}">审核项目</a>
                                            </#if>
                                            <#if rolename=="student">
                                                <a class="btn btn-info" href="/project/edit?id=${project.id}">修改</a>
                                                <a class="btn btn-warning" href="/project/delete?id=${project.id}">删除</a>
                                            </#if>
                                        </td>
                                    </tr>
                                    </#list>
                                </#if>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <!-- content ends -->
    </div><!--/#content.col-md-0-->
</div><!--/fluid-row-->
</@body>