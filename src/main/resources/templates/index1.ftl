<!DOCTYPE html>
<html lang="zh-CN">

<head>
    <!--
        ===
        This comment should NOT be removed.

        Charisma v2.0.0

        Copyright 2012-2014 Muhammad Usman
        Licensed under the Apache License v2.0
        http://www.apache.org/licenses/LICENSE-2.0

        http://usman.it
        http://twitter.com/halalit_usman
        ===
    -->
    
    <meta charset="utf-8">
    <title>主页|项目审核系统</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Charisma, a fully featured, responsive, HTML5, Bootstrap admin template.">
    <meta name="author" content="Muhammad Usman">

    <!-- The styles -->
    <link href="static/css/bootstrap-cerulean.min.css" rel="stylesheet">
    
    <link href="static/css/charisma-app.css" rel="stylesheet">
    <link href='static/css/fullcalendar/fullcalendar.css' rel='stylesheet'>
    <link href='static/css/fullcalendar/fullcalendar.print.css' rel='stylesheet' media='print'>
    
    <link href='static/css/chosen/chosen.min.css' rel='stylesheet'>
    <link href='static/css/colorbox/colorbox.css' rel='stylesheet'>
    <link href='static/css/responsive-tables/responsive-tables.css' rel='stylesheet'>
    <link href='static/css/bootstrap-tour/bootstrap-tour.min.css' rel='stylesheet'>
    <link href='static/css/jquery.noty.css' rel='stylesheet'>
    <link href='static/css/noty_theme_default.css' rel='stylesheet'>
    <link href='static/css/elfinder.min.css' rel='stylesheet'>
    <link href='static/css/elfinder.theme.css' rel='stylesheet'>
    <link href='static/css/jquery.iphone.toggle.css' rel='stylesheet'>
    <link href='static/css/uploadify.css' rel='stylesheet'>
    <link href='static/css/animate.min.css' rel='stylesheet'>

    <!-- jQuery -->
    <script src="static/js/jquery.min.js"></script>

    <!-- The HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <!-- The fav icon 
    <link rel="shortcut icon" href="img/favicon.ico">-->

</head>

<body>
    <!-- topbar starts -->
    <div class="navbar navbar-default" role="navigation">

        <div class="navbar-inner">
            <button type="button" class="navbar-toggle pull-left animated flip">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/index"> <img alt="Charisma Logo" src="static/img/logo20.png" class="hidden-xs"/>
                <span>项目审核系统</span></a>

            <!-- user dropdown starts -->
            <div class="btn-group pull-right">
                <button class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                    <i class="glyphicon glyphicon-user"></i><span class="hidden-sm hidden-xs"> <#if _principal??>${_principal}</#if></span>
                    <span class="caret"></span>
                </button>
                <ul class="dropdown-menu">
                    <li><a href="/${_principal}/profile">个人资料</a></li>
                    <li class="divider"></li>
                    <li><a href="/logout">登出</a></li>
                </ul>
            </div>
            <!-- user dropdown ends -->

          

            <ul class="collapse navbar-collapse nav navbar-nav top-menu">
              
                <li>
                    <form class="navbar-search pull-left">
                        <input placeholder="Search" class="search-query form-control col-md-10" name="query"
                               type="text">
                    </form>
                </li>
            </ul>

        </div>
    </div>
    <!-- topbar ends -->
<div class="ch-container">
    <div class="row">
        
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
                        <#if _roles?seq_contains("proapply:apply")>
                        	<li class="accordion">
	                            <a href="#"><i class="glyphicon glyphicon-plus"></i><span> 项目申请 </span></a>
	                            <ul class="nav nav-pills nav-stacked">
	                            	<#list permissions as permission>
	                            		<#if permission.name?contains("proapply")>
	                            			<li><a href="#"> ${permission.description}</a></li>
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
                      <#if _roles?seq_contains("setApplyTime:set")>
                       	 <li><a class="" href="#"><i class="glyphicon glyphicon-list-alt"></i><span>申请日期设定</span></a>
                        </li>
                      </#if>
                      
                      <#if _roles?seq_contains("startManage:initialization")>
                       	 <li><a class="" href="#"><i class="glyphicon glyphicon-list-alt"></i><span>初始化设置</span></a>
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

        

        <div id="content" class="col-lg-10 col-sm-10">
            <!-- content starts -->
            <div>
		    <ul class="breadcrumb">
		        <li>
		            <a href="/index">主页</a>
		        </li>
		       
		    </ul>
		</div>


<div class="row">
    <div class="box col-md-12">
        <div class="box-inner">
            <div class="box-header well">
                <h2><i class="glyphicon glyphicon-info-sign"></i> Introduction</h2>

                <div class="box-icon">
                    <a href="#" class="btn btn-setting btn-round btn-default"><i
                            class="glyphicon glyphicon-cog"></i></a>
                    <a href="#" class="btn btn-minimize btn-round btn-default"><i
                            class="glyphicon glyphicon-chevron-up"></i></a>
                    <a href="#" class="btn btn-close btn-round btn-default"><i
                            class="glyphicon glyphicon-remove"></i></a>
                </div>
            </div>
            <div class="box-content row">
                <div class="col-lg-7 col-md-12">
                    <h1>Charisma <br>
                        <small>free, premium quality, responsive, multiple skin admin template.</small>
                    </h1>
                    <p>It's a live demo of the template. I have created Charisma to ease the repeat work I have to do on my
                        projects. Now I re-use Charisma as a base for my admin panel work and I am sharing it with you
                        :)</p>

                    <p><b>All pages in the menu are functional, take a look at all, please share this with your
                            followers.</b></p>

                    <p class="center-block download-buttons">
                        <a href="http://usman.it/free-responsive-admin-template/" class="btn btn-primary btn-lg"><i
                                class="glyphicon glyphicon-chevron-left glyphicon-white"></i> Back to article</a>
                        <a href="http://usman.it/free-responsive-admin-template/" class="btn btn-default btn-lg"><i
                                class="glyphicon glyphicon-download-alt"></i> Download Page</a>
                    </p>
                </div>
              
               

            </div>
        </div>
    </div>
</div>



   <!-- content ends -->
  </div><!--/#content.col-md-0-->
</div><!--/fluid-row-->

   
    <hr>

    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
         aria-hidden="true">

        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">×</button>
                    <h3>Settings</h3>
                </div>
                <div class="modal-body">
                    <p>Here settings can be configured...</p>
                </div>
                <div class="modal-footer">
                    <a href="#" class="btn btn-default" data-dismiss="modal">Close</a>
                    <a href="#" class="btn btn-primary" data-dismiss="modal">Save changes</a>
                </div>
            </div>
        </div>
    </div>

    <footer class="row">
        <p class="col-md-9 col-sm-9 col-xs-12 copyright">&copy; <a href="http://usman.it" target="_blank">Muhammad
                Usman</a> 2012 - 2015</p>

        <p class="col-md-3 col-sm-3 col-xs-12 powered-by">Powered by: <a
                href="http://usman.it/free-responsive-admin-template">Charisma</a></p>
    </footer>

</div><!--/.fluid-container-->

<!-- external javascript -->

<script src="static/js/bootstrap.min.js"></script>

<!-- library for cookie management -->
<script src="static/js/jquery.cookie.js"></script>

<!-- calender plugin -->
<script src='static/js/moment/moment.min.js'></script>
<script src='static/js/fullcalendar/fullcalendar.min.js'></script>

<!-- select or dropdown enhancer -->
<script src="static/js/chosen/chosen.jquery.min.js"></script>

<!-- notification plugin -->
<script src="static/js/jquery.noty.js"></script>

<!-- autogrowing textarea plugin -->
<script src="static/js/jquery.autogrow-textarea.js"></script>

<!-- plugin for gallery image view -->
<script src="static/js/colorbox/jquery.colorbox-min.js"></script>

<!-- data table plugin -->
<script src='static/js/jquery.dataTables.min.js'></script>

<!-- library for making tables responsive -->
<script src="static/js/responsive-tables/responsive-tables.js"></script>

<!-- history.js for cross-browser state change on ajax -->
<script src="static/js/jquery.history.js"></script>

<!-- star rating plugin -->
<script src="static/js/jquery.raty.min.js"></script>

<!-- multiple file upload plugin -->
<script src="static/js/jquery.uploadify-3.1.min.js"></script>

<!-- for iOS style toggle switch -->
<script src="static/js/jquery.iphone.toggle.js"></script>

<!-- application script for Charisma demo -->
<script src="static/js/charisma.js"></script>


</body>
</html>