<#include "../common/layer.ftl">
<@html page_title="角色配置">
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
                    <a href="/project/apply">申请项目</a>
                </li>


            </ul>
        </div>


        <div class="row">
            <div class="box col-md-12">
                <div class="panel panel-default">
                    <div class="panel-heading">项目申请</div>
                    <div class="panel-body">
                        <form role="form" action="/project/apply?name=${_principal}" method="POST" id="form">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            <div class="form-group">
                                <label for="name">项目名称</label>
                                <input type="text" class="form-control" id="name" value=""/>
                            </div>
                            <div class="form-group">
                                <label form="role">项目详情</label>
                                <div>
                                    <script id="container" name="content" type="text/plain">
                                    </script>
                                    <!-- 配置文件 -->
                                    <script type="text/javascript" src="/static/js/ueditor/ueditor.config.js"></script>
                                    <!-- 编辑器源码文件 -->
                                    <script type="text/javascript" src="/static/js/ueditor/ueditor.all.js"></script>
                                    <script type="text/javascript">
                                        var ue = UE.getEditor('container',{
                                            initialFrameHeight:500
                                        });
                                        ue.ready(function(){
                                            ue.execCommand("serverparam",{
                                                 "${_csrf.parameterName}":"${_csrf.token}"
                                            })
                                        });
                                    </script>
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

                                function clickmodal(){
                                    var username=$("#name").val();
                                    var roleId=$(".roleIds:checked").val();
                                    var rolename=$("#label_"+roleId).html();
                                    var em=0;
                                    var form=$("form");
                                    var error=$("#error");

                                    if(username.length==0){
                                        em++;
                                        error.html('<div class="alert alert-info" role="alert">用户名不能为空</div>');
                                    }
                                    if(roleId==null){
                                        em++;
                                        error.html('<div class="alert alert-info" role="alert">角色配置不能为空</div>');
                                    }
                                    if(em==0){
                                        $("#alert").html("是否保存用户："+username+" 角色："+rolename);
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
</@html>