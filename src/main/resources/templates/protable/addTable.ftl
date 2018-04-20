<#include "../common/layer.ftl">
<@head page_title="添加申请表"/>
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
                    <a href="/protable/add">设置表格式</a>
                </li>


            </ul>
        </div>


        <div class="row">
            <div class="box col-md-12">
                <div class="panel panel-default">
                    <div class="panel-heading">设置表格式</div>
                    <div class="panel-body">
                        <#if message??>
                            <div class="alert alert-info" role="alert">${message!}</div>
                        </#if>
                        <form role="form" action="/protable/add" method="POST" id="form">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            <div class="form-group">
                                <label for="name">表格名称</label>
                                <input type="text" class="form-control" name="tablename" id="tablename" value=""/>
                            </div>
                            <div class="form-group">
                                <label for="name">表格描述</label>
                                <input type="text" class="form-control" name="tabledescription" id="tabledescription" value=""/>
                            </div>
                            <div class="form-group">
                                <label for="name">允许使用的权限</label>
                                <select class="form-control" id="allowPermission" name="allowPermission">
                                    <option value="">无</option>
                                    <#list childPermissions as childpermission>
                                        <option value="${childpermission.id!}">${childpermission.description!}</option>
                                    </#list>
                                </select>
                            </div>
                            <div class="form-group">
                                <label form="role">表格内容</label>
                                <div>
                                    <script id="tablevalue" name="tablevalue"  type="text/plain">
                                    </script>
                                    <!-- 配置文件 -->
                                    <script type="text/javascript" src="/static/js/ueditor/ueditor.config.js"></script>
                                    <!-- 编辑器源码文件 -->
                                    <script type="text/javascript" src="/static/js/ueditor/ueditor.all.js"></script>

                                </div>

                            </div>
                            <button type="button" id="roleBtn" onclick="clickmodal()" class="btn btn-lg btn-default"  data-target="#save_modal">保存</button>
                            <div id="error"></div>
                            <div class="modal fade" id="save_modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
                                <div class="modal-dialog modal-lg" role="document">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                            <h4 class="modal-title" id="myModalLabel">注意</h4>
                                        </div>
                                        <div class="modal-body">
                                            <div class="alert alert-info" id="alert" role="alert"></div>

                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                                            <button type="submit" id="save"  class="btn btn-primary">保存</button>

                                        </div>
                                    </div>
                                </div>
                            </div>

                            <script type="text/javascript">
                                var ue = UE.getEditor('tablevalue',{
                                    initialFrameHeight:500
                                });
                                ue.ready(function(){
                                    ue.execCommand("serverparam",{
                                        "${_csrf.parameterName}":"${_csrf.token}"
                                    })
                                });
                                function clickmodal(){
                                    var tablename=$("#tablename").val();
                                    var tabledescription=$("#tabledescription").val();
                                    var allowpermission=$("#allowPermission").val();
                                    var content=ue.getContent();
                                    var em=0;
                                    var form=$("form");
                                    var error=$("#error");

                                    if(tablename.length==0){
                                        em++;
                                        error.html('<div class="alert alert-info" role="alert">表格名称不能为空</div>');
                                    }
                                    if(tabledescription.length==0){
                                        em++;
                                        error.html('<div class="alert alert-info" role="alert">表格描述不能为空</div>');
                                    }
                                    if(allowpermission==""){
                                        em++;
                                        error.html('<div class="alert alert-info" role="alert">请选择谁能使用这个表格</div>');
                                    }
                                    if(content.length==0){
                                        em++;
                                        error.html('<div class="alert alert-info" role="alert">表格内容不能为空</div>');
                                    }
                                    if(em==0){
                                        $("#alert").html("是否保存项目："+tabledescription);
                                        $("#save_modal").modal('show');
                                    }else{
                                        $("#save_modal").modal('hide');
                                    }

                                }

                            </script>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <!-- content ends -->
    </div><!--/#content.col-md-0-->
</div><!--/fluid-row-->
</@body>