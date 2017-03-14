<#macro left_menu>
	 <!-- left menu starts -->
        <div class="col-sm-2 col-lg-2">
            <div class="sidebar-nav">
                <div class="nav-canvas">
                    <div class="nav-sm nav nav-stacked">

                    </div>
                    <ul class="nav nav-pills nav-stacked main-menu">
                        <li class="nav-header">导航栏</li>
                        <li><a class="" href="/index"><i class="glyphicon glyphicon-home"></i><span>个人主页</span></a>
                        </li>

                        <#if _roles?seq_contains("setApplyTime:set")>
                            <li><a class="" href="#"><i class="glyphicon glyphicon-list-alt"></i><span>申请日期设定</span></a>
                            </li>
                        </#if>

                        <#if _roles?seq_contains("startManage:initialization")>
                            <li><a class="" href="#"><i class="glyphicon glyphicon-list-alt"></i><span>初始化设置</span></a>
                            </li>
                        </#if>
                        <#if _roles?seq_contains("protable:add")>
                            <li><a class="" href="/protable/add"><i class="glyphicon glyphicon-list-alt"></i><span>表格设置</span></a>
                            </li>
                        </#if>

                        <#if _roles?seq_contains("project:list")>
                            <li class="accordion">
                                <a href="#"><i class="glyphicon glyphicon-plus"></i><span> 项目 </span></a>
                                <ul class="nav nav-pills nav-stacked">
                                    <#list permissions as permission>
                                        <#if permission.name?contains("project")>
                                            <li><a href="${permission.url}"> ${permission.description}</a></li>
                                        </#if>
                                    </#list>
                                </ul>
                            </li>
                        </#if>
                       <#if _roles?seq_contains("proprocess:process")>
                        <li class="accordion">
                            <a href="#"><i class="glyphicon glyphicon-plus"></i><span> 项目进展 </span></a>
                            <ul class="nav nav-pills nav-stacked">
                              <#list permissions as permission>
                              	<#if permission.name?contains("proprocess")>
                              		<li><a href="#"> ${permission.description}</a></li>
                              	</#if>
                              </#list>
                            </ul>
                        </li>
                      </#if>

                      
                       <#if _roles?seq_contains("user:list")>
                        <li class="accordion">
                            <a href="#"><i class="glyphicon glyphicon-plus"></i><span> 账号 </span></a>
                            <ul class="nav nav-pills nav-stacked">
                              <#list permissions as permission>
                              	<#if permission.name?contains("user")>
                              		<li><a href="${permission.url!}"> ${permission.description}</a></li>
                              	</#if>
                              </#list>
                            </ul>
                        </li>
                      </#if>
                        <#if _roles?seq_contains("academy:list")>
                            <li class="accordion">
                                <a href="#"><i class="glyphicon glyphicon-plus"></i><span> 学院管理 </span></a>
                                <ul class="nav nav-pills nav-stacked">
                                    <#list permissions as permission>
                                        <#if permission.name?contains("academy")>
                                            <li><a href="${permission.url!}"> ${permission.description}</a></li>
                                        </#if>
                                    </#list>
                                </ul>
                            </li>
                        </#if>
                      <#if _roles?seq_contains("permission:list")>
                       	 <li class="accordion">
                            <a href="#"><i class="glyphicon glyphicon-plus"></i><span> 权限 </span></a>
                            <ul class="nav nav-pills nav-stacked">
                              <#list permissions as permission>
                              	<#if permission.name?contains("permission")>
                              		<li><a href="${permission.url!}"> ${permission.description}</a></li>
                              	</#if>
                              </#list>
                            </ul>
                        </li>
                      </#if>
                      
                        <#if _roles?seq_contains("role:list")>
                       	 <li class="accordion">
                            <a href="#"><i class="glyphicon glyphicon-plus"></i><span> 角色 </span></a>
                            <ul class="nav nav-pills nav-stacked">
                              <#list permissions as permission>
                              	<#if permission.name?contains("role")>
                              		<li><a href="${permission.url!}"> ${permission.description}</a></li>
                              	</#if>
                              </#list>
                            </ul>
                        </li>
                      </#if>
                      
                    </ul>
                    
                </div>
            </div>
        </div>
        <!--/span-->
        <!-- left menu ends -->

</#macro>