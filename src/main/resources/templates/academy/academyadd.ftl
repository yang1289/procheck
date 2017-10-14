<#include "../common/layer.ftl">
<@head page_title="添加权限"/>
<@css></@css>
<@js></@js>
<@body>
<div class="row">
    <#include "../common/left_menu.ftl"/>
    <@left_menu/>
    <div id="content" class="col-lg-10 col-sm-10">
        <!-- content starts -->
        <div>
            <ul class="breadcrumb">
                <li>
                    <a href="/index">主页</a>
                </li>
                <li>
                    <a href="/academy/add">添加学院信息</a>
                </li>

            </ul>
        </div>


        <div class="row">
            <div class="box col-md-12">
                <div class="panel panel-default">
                    <div class="panel-heading">学院信息</div>
                    <div class="panel-body">
                        <form role="form" action="/academy/add" method="POST" id="form">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            <div class="form-group">
                                <label for="parentPermission">学院名称</label>
                                <br/>
                                <div>
                                    <select id="academy" name="academyid" class="form-control">
                                        <option value="">无</option>
                                        <#list academys as academy>
                                            <option value="${academy.id}">${academy.name!}</option>
                                        </#list>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="parentPermission">专业名称</label>
                                <br/>
                                <div>
                                    <select id="major" name="majorid" class="form-control">
                                        <option value="">无</option>
                                    </select>
                                </div>
                            </div>

                            <label for="name">学院(专业或班级)</label><span class="label label-warning">提示:输入班级请按照专业(此项可以不输入)+xxx(年份)级+xxxx班</span>
                            <div class="input-group">
                                <span id="prename" class="input-group-addon">无</span>
                                <input type="text" id="name" name="name" value="" class="form-control"/>
                            </div>

                            <button type="button" id="roleBtn" onclick="roleSubmit()" class="btn btn-lg btn-default" data-target="#save_modal">保存</button>
                            <div id="errorMessage"></div>
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
                                var em=$("#errorMessage");
                                $("#academy").change(function(){
                                    var id=$(this).val();
                                    var data={
                                        id:id,
                                        levelname:"academy",
                                        ${_csrf.parameterName}:"${_csrf.token}",
                                    };
                                    if(id!=""){
                                        $.ajax({
                                            url:"/academy/findChild",
                                            dataType:"JSON",
                                            data:data,
                                            method:"post",
                                            error:function(){
                                                em.html('<div class="alert alert-info role="alert">出现错误</div>')
                                            },
                                            success:function(data){
                                                $("#major").html('<option value="">无</option>');
                                                for(i=0;i<data.length;i++){
                                                    $("#major").append("<option v" +
                                                            "alue='"+data[i].id+"'>"+data[i].name+"</option>");
                                                }
                                            }
                                        });
                                    }else{
                                        $("#major").html('<option value="">无</option>');
                                        $("#prename").text("无");
                                    }

                                });
                                $("#major").change(function(){
                                    var majorId=$(this).val();
                                    var name=$(this).find(":checked").text();
                                    if(majorId!=null){
                                        $("#prename").text(name);
                                        $("#name").attr("aria-describedby","name");
                                    }
                                });
                                function roleSubmit(){
                                    var submit=0;
                                    var em=$("#errorMessage");
                                    var name=$("#name").val();
                                    var select=$("#select").val();
                                    if(name.length==0){
                                        submit++;
                                        em.html('<div class="alert alert-info role="alert">名称不能为空</div>');
                                    }
                                    if(submit==0){
                                       $("#save_modal") .modal('show');
                                    }else{
                                        $("#save_modal") .modal('hide');
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