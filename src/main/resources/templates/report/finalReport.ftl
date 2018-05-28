<#include "../common/layer.ftl">
<@head page_title="中期报告"/>
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
                    <a href="/proprocess/finalprocess">结题报告列表</a>
                </li>


            </ul>
        </div>


        <div class="row">
            <div class="box col-md-12">
                <div class="panel panel-default">
                    <div class="panel-heading">结题报告</div>
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
                                        <td>${project.projectName!}</td>
                                        <td>${project.user.username!}</td>
                                        <td>${project.createTime!}</td>

                                        <td>
                                            <a class="btn btn-primary" href="/proprocess/editfinalReport?id=${project.id!}">填写结题报告</a>
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