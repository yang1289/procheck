<#include "../common/layer.ftl">
<@head page_title="中期报告"/>
<@css></@css>
<@js>
    <!-- 配置文件 -->
<script type="text/javascript" src="/static/js/ueditor/ueditor.config.js"></script>
<!-- 编辑器源码文件 -->
<script type="text/javascript" src="/static/js/ueditor/ueditor.all.js"></script>
</@js>
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
                    <a href="/proprocess/editfinalReport?id=${projectid!}">编辑结题报告</a>
                </li>


            </ul>
        </div>

        <div class="row">
            <div class="col-md-12">
                <input class="form-control" type="text" value="${projectname!}" readonly/>
                <input id="projectid" value="${projectid!}" hidden="hidden"/>
            </div>

        </div>
        <div class="row">
            <div class="box col-md-12">
                <div class="panel panel-default">
                    <div class="panel-heading">结题报告</div>
                    <div class="panel-body">
                        <script id="finalReport" type="text/plain">
                            <#if finalreport??>${finalreport!}</#if>
                       </script>
                    </div>
                    <div class="panel-footer">
                        <button class="btn btn-primary" onclick="gosaveFinalReport()">保存</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-12" id="message">
            </div>

        </div>

        <div class="modal fade" id="save_modal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
            <div class="modal-dialog modal-lg" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">注意</h4>
                    </div>
                    <div class="modal-body">
                        <div class="alert alert-info" id="alert" role="alert">是否保存</div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                        <button type="submit" id="save" onclick="saveFianlReport()"  class="btn btn-primary">是</button>
                    </div>
                </div>
            </div>
        </div>

        <script>
            function gosaveFinalReport(){
                $("#save_modal").modal("show");
            }
            ue=UE.getEditor("finalReport");
            ue.ready(function(){
                ue.execCommand("serverparam",{
                    "${_csrf.parameterName}":"${_csrf.token}"
                })
            })

            function saveFianlReport(){
                var projectid=$("#projectid").val();
                var finalReport=ue.getContent();
                if(finalReport==""){
                    alert("报告内容不能为空");
                }

                var data={
                    "${_csrf.parameterName}":"${_csrf.token}",
                    finalReport:finalReport,
                    projectid:projectid
                }

                $.ajax({
                    url:"/proprocess/saveFinalReport",
                    data:data,
                    dataType:"JSON",
                    type:"POST",
                    error:function (data) {
                        alert("系统错误");
                    },
                    success:function (data) {
                        $("#save_modal").modal("hide");
                        alert(data);
                    }
                })
            }
        </script>
        <!-- content ends -->
    </div><!--/#content.col-md-0-->
</div><!--/fluid-row-->
</@body>