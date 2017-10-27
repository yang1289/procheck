<#include "../../common/layer.ftl">

<@head page_title="修改项目-步骤三"/>
<@css>

</@css>
<@js>
<!-- 配置文件 -->
<script type="text/javascript" src="/static/js/ueditor/ueditor.config.js"></script>
<!-- 编辑器源码文件 -->
<script type="text/javascript" src="/static/js/ueditor/ueditor.all.js"></script>
</@js>
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
                    <a href="/project/edit<#if project??>?id=${project.id}</#if>">修改项目</a>
                </li>
                <li>
                    <a href="/project/applystep1?method=edit<#if project??>&&id=${project.id}</#if>">步骤一</a>
                </li>
                <li>
                    <a href="/project/applystep2?method=edit<#if project??>&&id=${project.id}</#if>">步骤二</a>
                </li>
                <li>
                    <a href="/project/applystep3?method=edit<#if project??>&&id=${project.id}</#if>">步骤三</a>
                </li>
                <li>
                    <a href="/project/applystep4?method=edit<#if project??>&&id=${project.id}</#if>">步骤四</a>
                </li>
                <li>
                    <a href="/project/applystep5?method=edit<#if project??>&&id=${project.id}</#if>">步骤五</a>
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
                        <form role="form" id="step3" method="post" action="/project/applystep3?method=edit">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            <#if project??><input type="hidden" name="id" value="${project.id}"/></#if>
                            <ul class="nav nav-pills" id="mytab" role="tablist">
                                <li class="active"><a href="#researchConditionDiv" data-toggle="pill" aria-controls="researchConditionDiv" role="tab">研究现状</a></li>
                                <li><a href="#researchPlanDiv" data-toggle="pill" aria-controls="researchPlanDiv" role="tab">研究方案</a></li>
                                <li><a href="#createPintDiv" data-toggle="pill" aria-controls="createPintDiv" role="tab">创新点</a></li>
                                <li><a href="#researchConditionSupportDiv" data-toggle="pill" aria-controls="researchConditionSupportDiv" role="tab">研究工作的条件保障（研究室，研究基地等）</a></li>
                                <li><a href="#achievementMethodDiv" data-toggle="pill" aria-controls="achievementMethodDiv" role="tab">拟提供成果及成果形式</a></li>
                            </ul>
                            <div id="mytabContent" class="tab-content">
                                <div id="researchConditionDiv" class="tab-pane fade in active">
                                    <div class="form-group">
                                        <!--<label for="">研究现状</label>-->
                                        <br/>
                                        <#if project??>
                                            <#if project.searchCondition??>
                                                <script name="searchCondition" id="searchCondition" type="text/plain">
                                                    ${project.searchCondition}
                                                </script>
                                                <#--<textarea id="searchCondition" name="searchCondition" >${project.searchCondition}</textarea>-->
                                            <#else>
                                                <script name="searchCondition" id="searchCondition" type="text/plain"></script>
                                            </#if>
                                        <#else>
                                            <script id="searchCondition" name="searchCondition" type="text/plain"></script>
                                        </#if>
                                    </div>
                                </div>
                                <div  class="tab-pane fade" id="researchPlanDiv">
                                    <div class="form-group">
                                        <#--<label for="">研究方案</label>-->
                                        <br/>
                                        <#if project??>
                                            <#if project.searchPlan??>
                                                <script type="text/plain" id="searchPlan" name="searchPlan">${project.searchPlan}</script>
                                            <#else>
                                                <script type="text/plain" id="searchPlan" name="searchPlan"></script>
                                            </#if>
                                        <#else>
                                            <script type="text/plain" id="searchPlan" name="searchPlan"></script>
                                        </#if>
                                    </div>
                                </div>
                                <div id="createPintDiv" class="tab-pane fade">
                                    <div class="form-group">
                                        <#--<label for="">创新点</label>-->
                                        <br/>
                                        <#if project??>
                                            <#if project.createPoint??>
                                                <script type="text/plain" id="createPoint" name="createPoint" class=" myEditor">${project.createPoint}</script>
                                            <#else>
                                                <script type="text/plain" id="createPoint" name="createPoint" class=" myEditor"></script>
                                            </#if>
                                        <#else>
                                            <script type="text/plain" id="createPoint" name="createPoint"  ></script>
                                        </#if>
                                    </div>
                                </div>

                                <div id="researchConditionSupportDiv" class="tab-pane fade">
                                    <div class="form-group">
                                        <#--<label for="">研究工作的条件保障（研究室，研究基地等）</label>-->
                                        <br/>
                                        <#if project??>
                                            <#if project.searchConditionSupport??>
                                                <script type="text/plain" id="searchConditionSupport" name="searchConditionSupport">${project.searchConditionSupport}</script>
                                            <#else>
                                                <script type="text/plain" id="searchConditionSupport" name="searchConditionSupport"></script>
                                            </#if>
                                        <#else>
                                            <script type="text/plain" id="searchConditionSupport" name="searchConditionSupport"></script>
                                        </#if>
                                    </div>
                                </div>
                                <div id="achievementMethodDiv" class="tab-pane fade">
                                    <div class="form-group">
                                        <#--<label for="">拟提供成果及成果形式</label>-->
                                        <br/>
                                        <#if project??>
                                            <#if project.achievenmentMethod??>
                                                <script type="text/plain" id="achievementMethod" name="achievenmentMethod">${project.achievenmentMethod}</script>
                                            <#else>
                                                <script type="text/plain" id="achievementMethod" name="achievenmentMethod"></script>
                                            </#if>
                                        <#else>
                                            <script type="text/plain" id="achievementMethod" name="achievenmentMethod"></script>
                                        </#if>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group col-md-12">
                                <button type="button" id="baseapply" onclick="saveStep3()" class="btn btn-primary">保存</button>
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
                                            <div class="alert alert-info" id="alert" role="alert">是否确认保存</div>
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
    <script>
        var ue1=UE.getEditor("searchCondition");
        ue1.ready(function(){
            ue1.execCommand("serverparam",{
                "${_csrf.parameterName}":"${_csrf.token}"
            })
        });

        var ue2=UE.getEditor("searchPlan");
        ue2.ready(function(){
            ue2.execCommand("serverparam",{
                "${_csrf.parameterName}":"${_csrf.token}"
            })
        });


        var ue3=UE.getEditor("createPoint");
        ue3.ready(function(){
            ue3.execCommand("serverparam",{
                "${_csrf.parameterName}":"${_csrf.token}"
            })
        });


        UE.getEditor("searchConditionSupport").ready(function(){
            this.execCommand("serverparam",{
                "${_csrf.parameterName}":"${_csrf.token}"
            })
        });


        UE.getEditor("achievementMethod").ready(function(){
            this.execCommand("serverparam",{
                "${_csrf.parameterName}":"${_csrf.token}"
            })
        });

    </script>

</div><!--/fluid-row-->
</@body>