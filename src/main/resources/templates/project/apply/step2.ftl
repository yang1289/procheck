<#include "../../common/layer.ftl">
<@head page_title="申请项目-步骤二"/>
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
            </ul>
        </div>
        <script src="/static/js/apply.js" type="text/javascript"></script>
        <div id="alert"><#if message??><div class="alert alert-warning" role="alert">${message}</div></#if></div>
        <div class="row">
            <div class="box col-md-12">
                <div class="panel panel-default">
                    <div class="panel-heading">项目申请</div>
                    <div class="panel-body">
                        <form role="form" id="step2" method="post" action="/project/applystep2?method=apply">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            <#if project??><input type="hidden" name="id" value="${project.id}"/></#if>
                            <table class="table">
                                <thead>
                                <tr>
                                    <td>申请人姓名</td><td>申请人专业</td><td>申请人学号</td><td>申请人班级</td><td></td>
                                </tr>
                                </thead>
                                <tbody id="user">
                                <#if project??>
                                    <#if project.applyUsers??&&(project.applyUsers?size>=1)>
                                        <#list project.applyUsers as applyuser>
                                            <tr id="user_${applyuser_index}">
                                                <td><input class="form-control" name="applyusers[0].applyName" type="text" value="${applyuser.applyName}"/></td>
                                                <td><input class="form-control" name="applyusers[0].applyMajor" type="text" value="${applyuser.applyMajor}"/></td>
                                                <td><input class="form-control" name="applyusers[0].applyNumber" type="text" value="${applyuser.applyNumber}"/></td>
                                                <td><input class="form-control" name="applyusers[0].applyGrade" type="text" value="${applyuser.applyGrade}"/></td>
                                                <#if !applyuser_has_next>
                                                    <td>
                                                        <button class="btn btn-info" onclick="addUser(${applyuser_index})" type="button"><i class="glyphicon glyphicon-plus"></i></button>
                                                        <button class="btn btn-warning" onclick="deleteUser(${applyuser_index})"type="button"><i class="glyphicon glyphicon-minus"></i></button>
                                                    </td>
                                                <#else>
                                                    <td></td>
                                                </#if>
                                            </tr>
                                        </#list>
                                    <#else>
                                        <tr id="user_0">
                                            <td><input class="form-control" name="applyusers[0].applyName" type="text" value=""/></td>
                                            <td><input class="form-control" name="applyusers[0].applyMajor" type="text" value=""/></td>
                                            <td><input class="form-control" name="applyusers[0].applyNumber" type="text" value=""/></td>
                                            <td><input class="form-control" name="applyusers[0].applyGrade" type="text" value=""/></td>
                                            <td>
                                                <button class="btn btn-info" onclick="addUser(0)" type="button"><i class="glyphicon glyphicon-plus"></i></button>
                                                <button class="btn btn-warning" type="button"><i class="glyphicon glyphicon-minus"></i></button>
                                            </td>
                                        </tr>
                                    </#if>
                                <#else>
                                    <tr id="user_0">
                                        <td><input class="form-control" name="applyusers[0].applyName" type="text" value=""/></td>
                                        <td><input class="form-control" name="applyusers[0].applyMajor" type="text" value=""/></td>
                                        <td><input class="form-control" name="applyusers[0].applyNumber" type="text" value=""/></td>
                                        <td><input class="form-control" name="applyusers[0].applyGrade" type="text" value=""/></td>
                                        <td>
                                            <button class="btn btn-info" onclick="addUser(0)" type="button"><i class="glyphicon glyphicon-plus"></i></button>
                                            <button class="btn btn-warning" type="button"><i class="glyphicon glyphicon-minus"></i></button>
                                        </td>
                                    </tr>
                                </#if>
                                </tbody>
                            </table>
                            <div class="form-group col-md-12">
                                <button type="button" id="baseapply" onclick="saveUsers()" class="btn btn-primary">保存并下一步</button>
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