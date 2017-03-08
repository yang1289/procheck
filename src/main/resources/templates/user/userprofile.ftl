<#include "../common/layer.ftl">
<@html page_title="账户列表">
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
                    <a href="/user/profile?name=${user.username!}">个人资料</a>
                </li>

            </ul>
        </div>


        <div class="row">
            <div class="box col-md-12">
                <div class="panel panel-default">
                    <div class="panel-heading">修改个人资料</div>
                    <div class="panel-body">
                        <form id="form" action="/user/profile" method="post">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            <div class="form-group">
                                <lable for="">用户名</lable>
                                <input class="form-control" type="text" id="username" name="username" value="${user.username!}" readonly/>
                            </div>

                            <div class="form-group">
                                <lable for="">中文名</lable>
                                <input class="form-control" type="text" id="chinesename" name="chinesename" value="${user.chineseName!}" />
                            </div>

                            <div class="form-group">
                                <lable for="">邮箱</lable>
                                <input class="form-control" type="email" id="email" name="email" value="${user.email!}" />
                            </div>

                            <div class="form-group">
                                <lable for="">个人主页</lable>
                                <input  class="form-control" type="url" id="url" name="url" value="${user.url!}" />
                            </div>

                            <div class="form-group">
                                <lable for="">学院名称</lable>
                                <select id="academy" name="academyId" class="form-control">
                                    <option value="">无</option>
                                    <#if academymaplist.rootacademylist??>
                                        <#list academymaplist.rootacademylist as rootacademy>
                                            <option value="${rootacademy.id!}" id="option_${rootacademy.id!}">${rootacademy.name!}</option>
                                        </#list>
                                    </#if>
                                </select>
                            </div>

                            <div class="form-group">
                                <lable for="">专业名称</lable>
                                <select id="major" name="majorId" class="form-control">
                                    <option value="">无</option>
                                    <#if academymaplist.majorlist??>
                                        <#list academymaplist.majorlist as majorli>
                                            <option value="${majorli.id!}" id="option_${majorli.id}">${majorli.name!}</option>
                                        </#list>
                                    </#if>
                                </select>
                            </div>

                            <div class="form-group">
                                <lable for="">班级名称</lable>
                                <select id="classname" name="classId" class="form-control">
                                    <option value="">无</option>
                                    <#if academymaplist.classlist??>
                                        <#list academymaplist.classlist as classname>
                                            <option value="${classname.id!}" id="option_${classname.id}">${classname.name!}</option>
                                        </#list>
                                    </#if>
                                </select>
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
                                            <div class="alert alert-info" id="alert" role="alert">是否确认提交</div>

                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                                            <button type="submit" id="save"  class="btn btn-primary">保存</button>

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <script type="text/javascript">
                                <#if academymap.rootacademy??>
                                    $("#option_${academymap.rootacademy.id}").attr("selected",true);
                                    <#if academymap.major??>
                                        $("#option_${academymap.major.id}").attr("selected",true);
                                        <#if academymap.classname??>
                                            $("#option_${academymap.classname.id}").attr("selected",true);
                                        <#else>
                                            var major=$("#major").val();
                                            var selecting=$("#classname");
                                            getAjax(major,selecting);
                                        </#if>
                                    <#else>
                                        var academy=$("#academy").val();
                                        var selecting=$("#major");
                                        getAjax(academy,selecting);
                                    </#if>
                                </#if>
                                var em=$("#errorMessage");
                                $("#academy").change(function(){
                                    var pid=$(this).val();
                                    var selecting=$("#major");
                                    getAjax(pid,selecting);
                                });

                                $("#major").change(function(){
                                   var pid=$(this).val();
                                   var selecting=$("#classname");
                                   getAjax(pid,selecting);
                                });

                                function roleSubmit(){
                                    $("#save_modal").modal('show');
                                }

                                function getAjax(pid,selecting){
                                    var data={
                                        pid:pid,
                                        ${_csrf.parameterName}:"${_csrf.token}",
                                     };
                                    if(pid!=""){
                                        $.ajax({
                                            url:"/academy/findmajor",
                                            dataType:"JSON",
                                            data:data,
                                            method:"post",
                                            error:function(){
                                                em.html('<div class="alert alert-info role="alert">出现错误</div>')
                                            },
                                            success:function(data){
                                                selecting.html('<option value="">无</option>');
                                                for(i=0;i<data.length;i++){
                                                    selecting.append("<option value='"+data[i].id+"'>"+data[i].name+"</option>");
                                                }
                                            }
                                        });
                                    }else{
                                        selecting.html('<option value="">无</option>');
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
</div>
</@html>
