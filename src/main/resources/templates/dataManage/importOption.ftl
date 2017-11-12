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
                    <a href="/dataManage/list">数据导入选项</a>
                </li>


            </ul>
        </div>

        <#if message??>
            <div class="row">
               <div class="alert alert-info">${message!}</div>
            </div>
        <#elseif >
        </#if>


        <div class="row">

        </div>
        <!-- content ends -->
    </div><!--/#content.col-md-0-->
</div><!--/fluid-row-->
</@body>