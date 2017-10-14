<#include "../../common/layer.ftl">
<@head page_title="申请项目-步骤五"/>
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
                <li>
                    <a href="/project/applystep2?method=apply<#if project??>&&id=${project.id}</#if>">步骤二</a>
                </li>
                <li>
                    <a href="/project/applystep3?method=apply<#if project??>&&id=${project.id}</#if>">步骤三</a>
                </li>
                <li>
                    <a href="/project/applystep4?method=apply<#if project??>&&id=${project.id}</#if>">步骤四</a>
                </li>
                <li>
                    <a href="/project/applystep5?method=apply<#if project??>&&id=${project.id}</#if>">步骤五</a>
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
                        <form role="form" id="step2" method="post" action="/project/applystep5?method=apply">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            <#if project??><input type="hidden" name="id" value="${project.id}"/></#if>
                            <table class="table">
                                <thead>
                                <tr>
                                    <td>经费说明</td><td>经费</td><td>备注</td><td></td>
                                </tr>
                                </thead>
                                <tbody id="expenditure">
                                <#if project??>
                                    <#if project.expenditures??&&(project.expenditures?size>=1)>
                                        <#list project.expenditures as expnediture>
                                            <tr id="expenditure_${expnediture_index}">
                                                <td><input class="form-control" name="expenditures[${expnediture_index}].description" type="text" value="${expnediture.description}"/></td>
                                                <td><input class="form-control" name="expenditures[${expnediture_index}].money" type="text" value="${expnediture.money?c}"/></td>
                                                <td><input class="form-control" name="expenditures[${expnediture_index}].remark" type="text" value="${expnediture.remark}"/></td>
                                                <#if !expnediture_has_next>
                                                    <td>
                                                        <button class="btn btn-info" onclick="addExpenditure(${expnediture_index})" type="button"><i class="glyphicon glyphicon-plus"></i></button>
                                                        <button class="btn btn-warning" onclick="deleteExpenditure(${expnediture_index})" type="button"><i class="glyphicon glyphicon-minus"></i></button>
                                                    </td>
                                                <#else>
                                                    <td></td>
                                                </#if>
                                            </tr>
                                        </#list>
                                    <#else>
                                        <tr id="expenditure_0">
                                            <td><input class="form-control" name="expenditures[0].description" type="text" value=""/></td>
                                            <td><input class="form-control" name="expenditures[0].money" type="text" value=""/></td>
                                            <td><input class="form-control" name="expenditures[0].remark" type="text" value=""/></td>
                                            <td>
                                                <button class="btn btn-info" onclick="addExpenditure(0)" type="button"><i class="glyphicon glyphicon-plus"></i></button>
                                                <button class="btn btn-warning" type="button"><i class="glyphicon glyphicon-minus"></i></button>
                                            </td>
                                        </tr>
                                    </#if>
                                <#else>
                                    <tr id="expenditure_0">
                                        <td><input class="form-control" name="expenditures[0].description" type="text" value=""/></td>
                                        <td><input class="form-control" name="expenditures[0].money" type="text" value=""/></td>
                                        <td><input class="form-control" name="expenditures[0].remark" type="text" value=""/></td>
                                        <td>
                                            <button class="btn btn-info" onclick="addExpenditure(0)" type="button"><i class="glyphicon glyphicon-plus"></i></button>
                                            <button class="btn btn-warning" type="button"><i class="glyphicon glyphicon-minus"></i></button>
                                        </td>
                                    </tr>
                                </#if>
                                </tbody>
                            </table>
                            <div class="form-group col-md-12">
                                <button type="button" id="baseapply" onclick="saveStep5()" class="btn btn-primary">保存并下一步</button>
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