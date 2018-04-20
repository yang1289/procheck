<#include "../../common/layer.ftl">
<@head page_title="申请项目-步骤一"/>
<@css></@css>
<@js></@js>
<@body>
<div class="row">
    <#include "../../common/left_menu.ftl"/>
    <@left_menu/>
    <div id="content" class="col-lg-10 col-sm-10">
        <div>
            <ul class="breadcrumb">
                <li>
                    <a href="/index">主页</a>
                </li>
                <li>
                    <a href="/project/apply">申请项目</a>
                </li>
                <li>
                    <a href="/project/applystep1?method=apply<#if project??>&&id=${project.id}</#if>">步骤一</a>
                </li>
            </ul>
        </div>
        <script src="/static/js/apply.js" type="text/javascript"></script>
        <div id="alert"><#if message??><div class="alert alert-warning" role="alert">${message}</div></#if></div>
        <div class="row">
            <div class="box col-md-12">
                <div class="panel panel-default">
                    <div class="panel-heading">项目申请</div>
                    <div class="panel-body">
                        <form role="form" id="step1" method="post" action="/project/applystep1?method=apply">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            <#if project??><input type="hidden" name="id" value="${project.id}"/></#if>
                            <div class="form-group col-md-12">
                                <label for="projectName">项目名称</label>
                                <input class="form-control" type="text" id="projectName" name="projectName" value="<#if project??><#if project.projectName??>${project.projectName}</#if></#if>"/>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="adviser">指导老师</label>
                                <select class="form-control" name="adviserId">

                                    <#list advisers as adviser>
                                        <option value="${adviser.id}" <#if project??><#if project.adviser??><#if adviser.id==project.adviser.id>selected</#if></#if></#if> >${adviser.chineseName}|${adviser.academy.name}</option>
                                    </#list>
                                </select>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="jobTitle">职称</label>
                                <input class="form-control" type="text" id="jobTitle" name="jobTitle" value="<#if project??><#if project.jobTitle??>${project.jobTitle}</#if></#if>"/>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="libName">实验室名称</label>
                                <input class="form-control" type="text" id="libName" name="libName" value="<#if project??><#if project.libName??>${project.libName}</#if></#if>"/>
                            </div>
                            <div class="form-group col-md-6">
                                <label for="teachUnit">所属教学单位</label>
                                <input class="form-control" type="text" id="teachUnit" name="teachUnit" value="<#if project??><#if project.teachUnit??>${project.teachUnit}</#if></#if>"/>
                            </div>
                            <div class="form-group col-md-12">
                                <button type="button" id="baseapply" onclick="saveBase()" class="btn btn-primary">保存并下一步</button>
                            </div>
                            <div id="message" class="form-group col-md-12"></div>
                            <div class="modal fade" id="save_modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
                                <div class="modal-dialog modal-lg" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                            <h4 class="modal-title" id="myModalLabel">注意</h4>
                                        </div>
                                        <div class="modal-body">
                                            <div class="alert alert-info" id="alert" role="alert">是否确认保存进行下一步</div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                                            <button type="submit" id="save"  class="btn btn-primary">是</button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- content ends -->
    </div><!--/#content.col-md-0-->
</div><!--/fluid-row-->
</@body>