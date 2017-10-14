<#include "../common/layer.ftl">
<@head page_title="项目申请"/>
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
                    <a href="/project/apply">申请项目</a>
                </li>


            </ul>
        </div>
        <script src="/static/js/apply.js" type="text/javascript"></script>
        <div id="alert"></div>
        <div class="row">
            <div class="box col-md-12">
                <div class="panel panel-default">
                    <div class="panel-heading">项目申请</div>
                    <div class="panel-body">
                        <ul id="pageTab" class="nav nav-tabs">
                            <li class="active">
                                <a href="#base" data-toggle="tab">
                                    基本信息
                                </a>
                            </li>
                            <li>
                                <a href="#applyuser" data-toggle="tab">
                                    申请小组成员
                                </a>
                            </li>
                            <li>
                                <a href="#applyIntro" data-toggle="tab">
                                    申请说明
                                </a>
                            </li>
                            <li>
                                <a href="#applyProgress" data-toggle="tab">
                                    进度计划
                                </a>
                            </li>
                            <li>
                                <a href="#expenditure" data-toggle="tab">
                                    经费预算
                                </a>
                            </li>
                        </ul>
                        <div id="tabContent" class="tab-content">
                            <div class="tab-pane fade in active" id="base">

                                <div class="form-group col-md-12">
                                    <label for="projectName">项目名称</label>
                                    <input class="form-control" type="text" id="projectName" name="projectName" value=""/>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="adviser">指导老师</label>
                                    <input class="form-control" type="text" id="adviser" name="adviser" value=""/>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="jobTitle">职称</label>
                                    <input class="form-control" type="text" id="jobTitle" name="jobTitle" value=""/>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="libName">实验室名称</label>
                                    <input class="form-control" type="text" id="libName" name="libName" value=""/>
                                </div>
                                <div class="form-group col-md-6">
                                    <label for="teachUnit">所属教学单位</label>
                                    <input class="form-control" type="text" id="teachUnit" name="teachUnit" value=""/>
                                </div>
                                <div class="form-group col-md-12">
                                    <button type="button" id="baseapply" onclick="saveBase('${_csrf.token}')" class="btn btn-primary">保存</button>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="applyuser">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <td>申请人姓名</td><td>申请人专业</td><td>申请人学号</td><td>申请人班级</td><td></td>
                                        </tr>
                                    </thead>
                                    <tbody id="user">
                                        <tr id="user_0">
                                            <td><input class="form-control" type="text" value=""/></td>
                                            <td><input class="form-control" type="text" value=""/></td>
                                            <td><input class="form-control" type="text" value=""/></td>
                                            <td><input class="form-control" type="text" value=""/></td>
                                            <td>
                                                <button class="btn btn-info" onclick="addUser(0)" type="button"><i class="glyphicon glyphicon-plus"></i></button>
                                                <button class="btn btn-warning" type="button"><i class="glyphicon glyphicon-minus"></i></button>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                                <div class="form-group">
                                    <button type="button" id="baseapply" class="btn btn-primary" onclick="saveUsers('user','${_csrf.token}')">保存</button>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="applyIntro">
                                <div class="form-group">
                                    <label for="">研究现状</label>
                                    <textarea class="form-control" rows="3"></textarea>
                                </div>
                                <div class="form-group">
                                    <label for="">研究方案</label>
                                    <textarea class="form-control" rows="3"></textarea>
                                </div>
                                <div class="form-group">
                                    <label for="">研究工作的条件保障（研究室，研究基地等）</label>
                                    <textarea class="form-control" rows="3"></textarea>
                                </div>
                                <div class="form-group">
                                    <label for="">拟提供成果及成果形式</label>
                                    <textarea class="form-control" rows="3"></textarea>
                                </div>
                                <div class="form-group">
                                    <button type="button" id="baseapply" class="btn btn-primary" >保存</button>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="applyProgress">
                                <table class="table">
                                    <thead>
                                    <tr>
                                        <td>计划时间</td><td>计划事件</td><td>计划备注</td><td></td>
                                    </tr>
                                    </thead>
                                    <tbody id="progress">
                                    <tr id="progress_0">
                                        <td><input class="form-control" type="text" value=""/></td>
                                        <td><input class="form-control" type="text" value=""/></td>
                                        <td><input class="form-control" type="text" value=""/></td>
                                        <td>
                                            <button class="btn btn-info" onclick="addProgress(0)" type="button"><i class="glyphicon glyphicon-plus"></i></button>
                                            <button class="btn btn-warning" type="button"><i class="glyphicon glyphicon-minus"></i></button>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                                <div class="form-group">
                                    <button type="button" id="baseapply" class="btn btn-primary" onclick="saveTable('progress')">保存</button>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="expenditure">
                                <table class="table">
                                    <thead>
                                    <tr>
                                        <td>经费说明</td><td>经费</td><td>备注</td><td></td>
                                    </tr>
                                    </thead>
                                    <tbody id="expend">
                                    <tr id="expend_0">
                                        <td><input class="form-control" type="text" value=""/></td>
                                        <td><input class="form-control" type="text" value=""/></td>
                                        <td><input class="form-control" type="text" value=""/></td>
                                        <td>
                                            <button class="btn btn-info" onclick="addExpend(0)" type="button"><i class="glyphicon glyphicon-plus"></i></button>
                                            <button class="btn btn-warning" type="button"><i class="glyphicon glyphicon-minus"></i></button>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                                <div class="form-group">
                                    <button type="button" id="baseapply" class="btn btn-primary" onclick="saveTable('expend')">保存</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- content ends -->
    </div><!--/#content.col-md-0-->
</div><!--/fluid-row-->
</@body>