<#include "../common/layer.ftl">
<@head page_title="项目审核列表"/>
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
                    <a href="/dataManage/importOption">数据导入选项</a>
                </li>


            </ul>
        </div>

        <#if message??>
            <div class="row">
                <div class="col-md-12">
                    <div class="alert alert-info">${message!}</div>
                </div>

            </div>
        <#elseif dataList??>
            <div class="row">
                <div class="col-md-12">
                    <form action="/dataManage/importDataed" method="post" id="importData">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        <table class="table" role="table">
                            <thead>
                            <tr>
                                <td>选择需要导入的数据</td>
                                <td></td>
                                <td>对应的数据名</td>
                            </tr>
                            </thead>
                            <tbody>
                            <!--用户名-->
                            <tr>
                                <td>
                                    <select class="form-control" name="usernameColumn">
                                        <#list dataList as data>
                                            <option value="${data.column!}">${data.column_name!}</option>
                                        </#list>
                                    </select>
                                </td>
                                <td>导入到</td>
                                <td><p>用户名</p></td>
                            </tr>
                            <!--密码-->
                            <tr>
                                <td>
                                    <p>密码不导入，请选择</p>
                                </td>
                                <td>导入到</td>
                                <td>
                                    <div class="form-group">
                                        <select id="sOption" name="pwoption" class="form-control">
                                            <option value="aspwd">用户名作为密码</option>
                                            <option value="costum">自定义密码</option>
                                        </select>
                                        <div id="costumInput"></div>
                                    </div>

                                </td>
                            </tr>
                            <!--中文名-->
                            <tr>
                                <td>
                                    <select class="form-control" name="chineseNameColumn">
                                        <#list dataList as data>
                                            <option value="${data.column!}">${data.column_name!}</option>
                                        </#list>
                                    </select>
                                </td>
                                <td>导入到</td>
                                <td><p>姓名</p></td>
                            </tr>
                            <!--学院-->
                            <tr>
                                <td>
                                    <select class="form-control" name="academyColumn">
                                        <#list dataList as data>
                                            <option value="${data.column!}">${data.column_name!}</option>
                                        </#list>
                                    </select>
                                </td>
                                <td>导入到</td>
                                <td><p>学院</p></td>
                            </tr>
                            <!--性别-->
                            <tr>
                                <td>
                                    <select class="form-control" name="sexColumn">
                                        <#list dataList as data>
                                            <option value="${data.column!}">${data.column_name!}</option>
                                        </#list>
                                    </select>
                                </td>
                                <td>导入到</td>
                                <td><p>姓别</p></td>
                            </tr>
                            <!--职称-->
                            <tr>
                                <td>
                                    <select class="form-control" name="jobTitleColumn">
                                        <#list dataList as data>
                                            <option value="${data.column!}">${data.column_name!}</option>
                                        </#list>
                                    </select>
                                </td>
                                <td>导入到</td>
                                <td><p>职称</p></td>
                            </tr>

                            <!--学历-->
                            <tr>
                                <td>
                                    <select class="form-control" name="educationColumn">
                                        <#list dataList as data>
                                            <option value="${data.column!}">${data.column_name!}</option>
                                        </#list>
                                    </select>
                                </td>
                                <td>导入到</td>
                                <td><p>学历</p></td>
                            </tr>

                            <!--专业-->
                            <tr>
                                <td>
                                    <select class="form-control" name="professionColumn">
                                        <#list dataList as data>
                                            <option value="${data.column!}">${data.column_name!}</option>
                                        </#list>
                                    </select>
                                </td>
                                <td>导入到</td>
                                <td><p>专业</p></td>
                            </tr>
                            </tbody>
                        </table>

                        <div class="col-md-12">
                            <div class="pull-right"><button id="import" class="btn btn-info" type="submit">开始导入</button></div>
                        </div>
                    </form>
                </div>
            </div>

            <#--<div class="row">-->
                <#--<div class="col-md-12">-->
                   <#--<h3>选择需要导入的数据</h3>-->
                <#--</div>-->
                <#--<div class="col-md-4">-->
                    <#--<select class="form-control">-->
                        <#--<#list dataList as data>-->
                            <#--<option value="${data.column!}">${data.column_name!}</option>-->
                        <#--</#list>-->
                    <#--</select>-->
                <#--</div>-->
                <#--<div class="col-md-4">-->
                    <#--<p>导入的到</p>-->
                <#--</div>-->
                <#--<div class="col-md-4">-->
                    <#--<p>username</p>-->
                <#--</div>-->
            <#--</div>-->
        </#if>

        <script>
            $("#sOption").change(function(){
               value=$("#sOption").val();
               if(value=="costum"){
                   $("#costumInput").html("<input class='form-control' id='costumPassword' name='costumPassword' placeholder='输入自定义密码'>");
               }else{
                   $("#costumInput").html("");
               }
            });

            $("#importData").submit(function(){
                var value=$("#sOption").val();

                if(value=="costum"){
                    if($("#costumPassword").val().length==0){
                        alert("请设置自定义密码")
                        return false;
                    }
                }
                return true;
            })

        </script>


        <!-- content ends -->
    </div><!--/#content.col-md-0-->
</div><!--/fluid-row-->
</@body>