<#include "../../common/layer.ftl">
<@head page_title="修改项目-步骤四"/>
<@css>
<link href="/static/datetimepicker/css/bootstrap-datetimepicker.min.css" rel="stylesheet" media="screen">
</@css>
<@js>
<script type="text/javascript" src="/static/datetimepicker/js/bootstrap-datetimepicker.js" charset="UTF-8"></script>
<script type="text/javascript" src="/static/datetimepicker/js/locales/bootstrap-datetimepicker.zh-CN.js" charset="UTF-8"></script>
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
                        <form role="form" id="step2" method="post" action="/project/applystep4?method=edit">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            <#if project??><input type="hidden" name="id" value="${project.id}"/></#if>
                            <table class="table">
                                <thead>
                                <tr>
                                    <td>计划时间</td><td>计划事件</td><td>计划备注</td><td></td>
                                </tr>
                                </thead>
                                <tbody id="progressplan">
                                    <#if project??>
                                        <#if project.progressPlans??&&(project.progressPlans?size>=1)>
                                            <#list project.progressPlans as progressPlan>
                                                <tr id="progressplan_${progressPlan_index}">
                                                    <td><input  class="form-control dateTime " name="progressPlans[${progressPlan_index}].time" readonly type="text" value="${progressPlan.time}"/></td>
                                                    <td><input class="form-control " name="progressPlans[${progressPlan_index}].event" type="text" value="${progressPlan.event}"/></td>
                                                    <td><input class="form-control " name="progressPlans[${progressPlan_index}].remark" type="text" value="${progressPlan.remark}"/></td>
                                                    <#if !progressPlan_has_next>
                                                        <td>
                                                            <button class="btn btn-info" onclick="addProgressPlan(${progressPlan_index}),dateTime()" type="button"><i class="glyphicon glyphicon-plus"></i></button>
                                                            <button class="btn btn-warning" <#if progressPlan_index!=0>onclick="deleteProgressPlan(${progressPlan_index})"</#if> type="button"><i class="glyphicon glyphicon-minus"></i></button>
                                                        </td>
                                                    <#else>
                                                        <td></td>
                                                    </#if>

                                                </tr>
                                            </#list>
                                        <#else>
                                            <tr id="progressplan_0">
                                                <td><input class="form-control dateTime" name="progressPlans[0].time" readonly type="text" value=""/></td>
                                                <td><input class="form-control " name="progressPlans[0].event" type="text" value=""/></td>
                                                <td><input class="form-control " name="progressPlans[0].remark" type="text" value=""/></td>
                                                <td>
                                                    <button class="btn btn-info" onclick="addProgressPlan(0)" type="button"><i class="glyphicon glyphicon-plus"></i></button>
                                                    <button class="btn btn-warning" type="button"><i class="glyphicon glyphicon-minus"></i></button>
                                                </td>
                                            </tr>
                                        </#if>
                                    <#else>
                                        <tr id="progressplan_0">
                                            <td><input class="form-control dateTime" name="progressPlans[0].time" readonly type="text" value=""/></td>
                                            <td><input class="form-control" name="progressPlans[0].event" type="text" value=""/></td>
                                            <td><input class="form-control" name="progressPlans[0].remark" type="text" value=""/></td>
                                            <td>
                                                <button class="btn btn-info" onclick="addProgressPlan(0)" type="button"><i class="glyphicon glyphicon-plus"></i></button>
                                                <button class="btn btn-warning" type="button"><i class="glyphicon glyphicon-minus"></i></button>
                                            </td>
                                        </tr>
                                    </#if>
                                </tbody>
                            </table>
                            <div class="form-group col-md-12">
                                <button type="button" id="baseapply" onclick="saveStep4()" class="btn btn-primary">保存</button>
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

        <script>

            function dateTime(){
                $("#progressplan .dateTime").datetimepicker({
                    language:"zh-CN",
                    format:"yyyy-mm-dd",
                    minView : "month",
                    todayBtn:true,
                    autoclose:true
                })
            }


            $("#progressplan .dateTime").datetimepicker({
                language:"zh-CN",
                format:"yyyy-mm-dd",
                minView : "month",
                todayBtn:true,
                autoclose:true
            })

        </script>
    </div><!--/#content.col-md-0-->
</div><!--/fluid-row-->
</@body>