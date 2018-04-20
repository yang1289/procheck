<#include "../common/layer.ftl">
<@head page_title="项目审核列表"/>
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
                    <a href="/dataManage/list">数据备份列表</a>
                </li>


            </ul>
        </div>

        <div class="row">
            <div class="col-md-10"></div>
            <div class="col-md-2"><a class="btn btn-info pull-right" href="/dataManage/getFileNow">立即生成并下载数据备份</a></div>
        </div>

        <div class="row">
            <div class="box col-md-12">
                <div class="panel panel-default">
                    <div class="panel-heading">已备份列表</div>
                    <div class="panel-body">
                        <#if message??>
                            <div class="alert alert-info" role="alert">${message}</div>
                        </#if>
                        <table class="table table-striped table-bordered responsive">
                            <thead>
                            <tr>
                                <td>序号</td>
                                <td>数据名称</td>
                                <td></td>
                            </tr>
                            </thead>
                            <tbody>
                                <#if filenames??>
                                    <#list filenames as filename>
                                        <tr>
                                            <td>${filename?index!}</td>
                                            <td>${filename!}</td>
                                            <td><a class="btn btn-primary" href="/getfile?filename=${filename!}">下载</a></td>
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