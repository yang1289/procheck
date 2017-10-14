<#include "../../common/layer.ftl">
<@head page_title="申请项目-步骤三"/>
<@css>
<link href="/static/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.25.0/codemirror.min.css">
<link href="/static/froala_editor/css/froala_editor.pkgd.min.css" rel="stylesheet" type="text/css" />
<link href="/static/froala_editor/css/themes/gray.min.css" rel="stylesheet" type="text/css" />
<link href="/static/froala_editor/css/froala_style.min.css" rel="stylesheet" type="text/css" />
</@css>
<@js>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.25.0/codemirror.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.25.0/mode/xml/xml.min.js"></script>

<!-- Include Editor JS files. -->
<script type="text/javascript" src="/static/froala_editor/js/froala_editor.pkgd.min.js"></script>
<script type="text/javascript" src="/static/froala_editor/js/languages/zh_cn.js"></script>
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
            </ul>
        </div>
        <script src="/static/js/apply.js" type="text/javascript"></script>
        <div id="alert"><#if message??><div class="alert alert-warning" role="alert">${message}</div></#if></div>
        <div class="row">
            <div class="box col-md-12">
                <div class="panel panel-default">
                    <div class="panel-heading">项目申请</div>
                    <div class="panel-body">
                        <form role="form" id="step3" method="post" action="/project/applystep3?method=apply">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            <#if project??><input type="hidden" name="id" value="${project.id}"/></#if>
                            <div class="form-group">
                                <label for="">研究现状</label>
                                    <#if project??>
                                        <#if project.searchCondition??>
                                            <textarea id="searchCondition" name="searchCondition" class="form-control froalaEdit" rows="3">${project.searchCondition}</textarea>
                                        <#else>
                                            <textarea id="searchCondition" name="searchCondition" class="form-control froalaEdit" rows="3"></textarea>
                                        </#if>
                                    <#else>
                                        <textarea id="searchCondition" name="searchCondition" class="form-control froalaEdit" rows="3"></textarea>
                                    </#if>
                            </div>
                            <div class="form-group">
                                <label for="">研究方案</label>
                                    <#if project??>
                                        <#if project.searchPlan??>
                                            <textarea id="searchPlan" name="searchPlan" class="form-control froalaEdit" rows="3">${project.searchPlan}</textarea>
                                        <#else>
                                            <textarea id="searchPlan" name="searchPlan" class="form-control froalaEdit" rows="3"></textarea>
                                        </#if>
                                    <#else>
                                        <textarea id="searchPlan" name="searchPlan" class="form-control froalaEdit" rows="3"></textarea>
                                    </#if>

                            </div>
                            <div class="form-group">
                                <label for="">创新点</label>
                                <#if project??>
                                    <#if project.createPoint??>
                                        <textarea id="createPoint" name="createPoint" class="form-control froalaEdit" rows="3">${project.createPoint}</textarea>
                                    <#else>
                                        <textarea id="createPoint" name="createPoint" class="form-control froalaEdit" rows="3"></textarea>
                                    </#if>
                                <#else>
                                    <textarea id="createPoint" name="createPoint" class="form-control froalaEdit" rows="3"></textarea>
                                </#if>
                            </div>
                            <div class="form-group">
                                <label for="">研究工作的条件保障（研究室，研究基地等）</label>
                                <#if project??>
                                    <#if project.searchConditionSupport??>
                                        <textarea id="searchConditionSupport" name="searchConditionSupport" class="form-control froalaEdit" rows="3">${project.searchConditionSupport}</textarea>
                                    <#else>
                                        <textarea id="searchConditionSupport" name="searchConditionSupport" class="form-control froalaEdit" rows="3"></textarea>
                                    </#if>
                                <#else>
                                    <textarea id="searchConditionSupport" name="searchConditionSupport" class="form-control froalaEdit" rows="3"></textarea>
                                </#if>
                            </div>
                            <div class="form-group">
                                <label for="">拟提供成果及成果形式</label>
                                <#if project??>
                                    <#if project.achievenmentMethod??>
                                        <textarea id="achievementMethod" name="achievenmentMethod" class="form-control froalaEdit" rows="3">${project.achievenmentMethod}</textarea>
                                    <#else>
                                        <textarea id="achievementMethod" name="achievenmentMethod" class="form-control froalaEdit" rows="3"></textarea>
                                    </#if>
                                <#else>
                                    <textarea id="achievenmentMethod" name="achievenmentMethod" class="form-control froalaEdit" rows="3"></textarea>
                                </#if>
                            </div>
                            <div class="form-group col-md-12">
                                <button type="button" id="baseapply" onclick="saveStep3()" class="btn btn-primary">保存并下一步</button>
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
        <script>
            $(function(){
                $(".froalaEdit").froalaEditor({
                    theme:'gray',
                    language:'zh_cn',
                    toolbarButtons: ['fullscreen', 'bold', 'italic', 'underline', 'strikeThrough', 'subscript', 'superscript', '|', 'fontFamily', 'fontSize', 'color', 'inlineStyle', 'paragraphStyle', '|', 'paragraphFormat', 'align', 'formatOL', 'formatUL', 'outdent', 'indent', 'quote', '-', 'insertLink', 'insertTable', '|', 'emoticons', 'specialCharacters', 'insertHR', 'selectAll', 'clearFormatting', '|', 'print', 'help', 'html', '|', 'undo', 'redo']
                })
            })
        </script>
        <!-- content ends -->
    </div><!--/#content.col-md-0-->
</div><!--/fluid-row-->
</@body>