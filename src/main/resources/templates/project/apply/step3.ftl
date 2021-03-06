<#include "../../common/layer.ftl">
<@head page_title="申请项目-步骤三"/>
<@css>

</@css>
<@js>
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
        <script src="https://res-procheck.oss-cn-hangzhou.aliyuncs.com/static/js/apply.js" type="text/javascript"></script>
        <div id="alert"><#if message??><div class="alert alert-warning" role="alert">${message}</div></#if></div>
        <div class="row">
            <div class="box col-md-12">
                <div class="panel panel-default">
                    <div class="panel-heading">项目申请</div>
                    <div class="panel-body">
                        <form role="form" id="step3" method="post" action="/project/applystep3?method=apply">
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
                                                <div name="searchCondition" id="searchCondition" class="editor">
                                                    ${project.searchCondition}
                                                </div>
                                            <#--<textarea id="searchCondition" name="searchCondition" >${project.searchCondition}</textarea>-->
                                            <#else>
                                                <div name="searchCondition" id="searchCondition" class="editor" ></div>
                                            </#if>
                                        <#else>
                                            <div id="searchCondition" name="searchCondition" class="editor" ></div>
                                        </#if>
                                    </div>
                                </div>
                                <div  class="tab-pane fade" id="researchPlanDiv">
                                    <div class="form-group">
                                    <#--<label for="">研究方案</label>-->
                                        <br/>
                                        <#if project??>
                                            <#if project.searchPlan??>
                                                <div class="editor" id="searchPlan" name="searchPlan">${project.searchPlan}</div>
                                            <#else>
                                                <div class="editor" id="searchPlan" name="searchPlan"></div>
                                            </#if>
                                        <#else>
                                            <div class="editor" id="searchPlan" name="searchPlan"></div>
                                        </#if>
                                    </div>
                                </div>
                                <div id="createPintDiv" class="tab-pane fade">
                                    <div class="form-group">
                                    <#--<label for="">创新点</label>-->
                                        <br/>
                                        <#if project??>
                                            <#if project.createPoint??>
                                                <div class="editor" id="createPoint" name="createPoint" class=" myEditor">${project.createPoint}</div>
                                            <#else>
                                                <div class="editor" id="createPoint" name="createPoint" class=" myEditor"></div>
                                            </#if>
                                        <#else>
                                            <div class="editor" id="createPoint" name="createPoint"  ></div>
                                        </#if>
                                    </div>
                                </div>

                                <div id="researchConditionSupportDiv" class="tab-pane fade">
                                    <div class="form-group">
                                    <#--<label for="">研究工作的条件保障（研究室，研究基地等）</label>-->
                                        <br/>
                                        <#if project??>
                                            <#if project.searchConditionSupport??>
                                                <div class="editor" id="searchConditionSupport" name="searchConditionSupport">${project.searchConditionSupport}</div>
                                            <#else>
                                                <div class="editor" id="searchConditionSupport" name="searchConditionSupport"></div>
                                            </#if>
                                        <#else>
                                            <div class="editor" id="searchConditionSupport" name="searchConditionSupport"></div>
                                        </#if>
                                    </div>
                                </div>
                                <div id="achievementMethodDiv" class="tab-pane fade">
                                    <div class="form-group">
                                    <#--<label for="">拟提供成果及成果形式</label>-->
                                        <br/>
                                        <#if project??>
                                            <#if project.achievenmentMethod??>
                                                <div class="editor" id="achievementMethod" name="achievenmentMethod">${project.achievenmentMethod}</div>
                                            <#else>
                                                <div class="editor" id="achievementMethod" name="achievenmentMethod"></div>
                                            </#if>
                                        <#else>
                                            <div class="editor" id="achievementMethod" name="achievenmentMethod"></div>
                                        </#if>
                                    </div>
                                </div>
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
        <!-- content ends -->
    </div><!--/#content.col-md-0-->
</div><!--/fluid-row-->
</@body>
<script type="text/javascript" src="https://res-procheck.oss-cn-hangzhou.aliyuncs.com/static/tinymce/js/tinymce/tinymce.min.js"></script>
<script type="text/javascript" src="/static/js/tinymceImgUpload.js"></script>
<script type="text/javascript">
    tinymce.init({
        selector:".editor",
        height:500,
        language: 'zh_CN', plugins: 'print preview fullpage  searchreplace autolink directionality  visualblocks visualchars fullscreen image link media template codesample table charmap hr pagebreak nonbreaking anchor toc insertdatetime advlist lists textcolor wordcount imagetools contextmenu colorpicker textpattern help',
        toolbar1: 'formatselect | bold italic strikethrough forecolor backcolor | link | alignleft aligncenter alignright alignjustify  | numlist bullist outdent indent  | removeformat',
        image_advtab: true,
        images_upload_handler:function (blobInfo, success, failure) {
            upload_handler(blobInfo,success,failure);
        }
    })
</script>